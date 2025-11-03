server <- function(input, output, session){

# UPLOAD PAGE ================================================================
## Dynamic radio button menus ------------------------------------------------
### Generated based on selections of
## experiment type (i.e. formulation, in vitro, in vivo)
output$template_menu <- renderUI({
    req(input$input_expType)
    # Logic for type of template options to render
    if (input$input_expType == "np_prod"){
        radioButtons(
            inputId = "np_options",
            label = "Production method",
            choices = list(
                "Batch/Benchtop production" = "batchprod",
                "Microfluidic" = "ufluidic"
            ) # End choices
        ) # End radioButtons
    } # End np_prod list
    else if (input$input_expType == "invitro") {
        radioButtons(
            inputId = "invitro_options",
            label = "In vitro experiment type",
            choices = list(
                "Cytotoxicity assay" = "cytotox",
                "Uptake study" = "uptake",
                "Drug efficacy (small molecule)" = "drug_eff", 
                "Transfection efficiency (protein expression)" = "transfect_protein",
                "Transfection efficiency (protein silencing)" = "transfect_silence"
            ) # End choices
        ) # End radioButtons
    } # End invitro list
    else if (input$input_expType == "invivo") {
        radioButtons(
            inputId = "invivo_options",
            label = "Type of in vivo study",
            choices = list(
                "Biodistribution" = "biodist",
                "Toxicity study" = "invivo_tox",
                "Therapeutic efficacy" = "invivo_eff"
            ) # End choices
        ) # End radioButtons
    } # End invivo list
})

## DOWNLOAD THE DATABASE TEMPLATE -------------------------------------------- 
output$downloadTemplate <- downloadHandler(
    filename = function() {
        "template.csv"
    }, # End filename function
    content = function(file) {
        df <- NULL
        # Select template based on inputs
        if (input$input_expType == "np_prod" && #
            input$np_options == "batchprod") {
            df <- template_npprod_batch
        } # END batch production template
        else if (input$input_expType == "np_prod" && #
                 input$np_options == "ufluidic") {
            df <- template_ufluidic_prod
        } # END microfluidic production template

        write.csv(df, file, row.names = FALSE)
    } # End dynamic template content selection
) # End downloadHandler

## UPLOAD/APPEND NEW DATA TO GOOGLE SHEETS -----------------------------------
df_upload <- reactive({
    # Load the .csv as 'temp_df' when the file is uploaded
    if (is.null(input$batchUpload))
        return(NULL) # No file uploaded yet
    temp_df <- read.csv(input$batchUpload$datapath, header=TRUE, sep=",")

    # Validate all the submission conditions are met
    validate(
        need(input$fname, "Please input first name."),
        need(input$lname, "Please input last name."),
        need(input$affil, "Please input affiliation."),
        need(input$email, "Please input e-mail.")
    )

    # Get user info inputs
    firstName <- as.character(input$fname)
    lastName <- as.character(input$lname)
    inst <- as.character(input$affil)
    webmail <- as.character(input$email)

    # Clean up the data
    temp_df <- trimws_df(temp_df) # trim white spaces
    temp_df[temp_df == 0] <- NA
    temp_df[temp_df == ""] <- NA
    # Drop rows containing only NA
    temp_df <- temp_df[rowSums(is.na(temp_df)) != ncol(temp_df),]
    # Get the date-time and user info
    temp_df$datetime <- as.POSIXct(Sys.time(), format = "%Y-%m-%d %H:%M:%S")
    temp_df$fname <- firstName
    temp_df$lname <- lastName
    temp_df$institute <- inst
    temp_df$email <- webmail
    # Generate a commit hash
    commit_hash <- as.character(paste0(#
            gsub("\\.", "", format(Sys.time(), "%OS3")),
            scramble_letters(toupper(substr(lastName, 1, 3))),
            format(Sys.time(), "%Y%m%d%H%M"),
            scramble_letters(toupper(substr(firstName,1, 3))), 
            scramble_letters(toupper(substr(inst, 1, 3)))
        ) # End paste0
    ) # End as.character
    temp_df$commit_hash <- commit_hash
})

## Message when data ready to upload
output$msgUpload <- renderText({#
    req(df_upload())
    paste(nrow(df_upload()), "datapoints ready for upload.")
})

## APPEND TO GOOGLE SHEETS ---------------------------------------------------
observeEvent(input$appendUpload, {
    req(df_upload())
    # Agree to terms and conditions
    validate(
        need(input$agree_terms, "Must agree to the Terms & Conditions.")
    )
    # Get the commit_hash
    tmp <- df_upload()
    commit_hash <- tmp[1, "commit_hash"]
    # Append to google sheets
    sheet_append(data = df_upload(),
        ss = sheetID_dat,
        sheet = "pending")

    
}) # END appendUpload





} # END server
