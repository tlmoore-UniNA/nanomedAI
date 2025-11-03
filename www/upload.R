upload <- tabItem(tabName = "upload",
    h2("Contribute your data to nanomedAI"),
    fluidRow(
        column(7,
            h3("Indicate what kind of data you would like to upload."),
            fluidRow(
                column(4,
                    radioButtons(
                        inputId = "input_expType",
                        label = "Experiment Type",
                        choices = list(
                            "NP Production" = "np_prod",
                            "In Vitro (Cells)" = "invitro",
                            "In Vivo (Animals)" = "invivo"
                        ), # End choices
                        selected="np_prod"
                    ) #  End radioButtons
                ), # End column
                column(4,
                    uiOutput("template_menu") 
                ), # End column
                column(4,
                    downloadButton("downloadTemplate", "Download the input data template")
                )
            ), # End fluidRow
            fluidRow(
                column(12,
                    h3("Fill out your information."),
                )
            ), # End fluidRow
            fluidRow(
                column(3,
                    textInput(
                        "fname",
                        "First name",
                        placeholder = "Jane"
                    ) # End textInput
                ), # End column
                column(3, 
                    textInput(
                        "lname",
                        "Last name",
                        placeholder = "Doe"
                    ) # End textInput
                ), # End column
                column(3, 
                    textInput(
                        "affil",
                        "Affiliation",
                        placeholder = "The Awesome Institute"
                    ) # End textInput
                ), # End column
                column(3, 
                    textInput(
                        "email",
                        "E-mail",
                        placeholder = "jane.doe@awesome.edu"
                    ) # End textInput
                ) # End column
            ), # End fluidRow
            fluidRow(#
                column(9,
                    h3("Upload data as a .csv file")
                ) # End column
            ), # End fluidRow
            fluidRow(
                column(9, 
                    p("Data can be uploaded as a .csv file here.
                      Files must conform to the strict data format outlined
                      for each template. For help visit the 'Information & Help'
                      page.
                      "),
                    p("By checking the box below, you as a 'USER' agree to the terms 
                      and conditions outlined on the righthand side of this page."),
                    checkboxInput("agree_terms", "I agree to the Terms & Conditions.", 
                        FALSE),
                    fileInput("batchUpload", 
                        h4("Submit .csv"),
                        multiple = FALSE,
                        accept = c("text/csv", 
                            "text/comma-separated-values,text/plain",
                            ".csv")
                    ), # End fileInput
                    textOutput('msgUpload', 
                        container = div, 
                        inline = FALSE), # End textOutput
                    h4("Append your data to the database."),
                    actionButton("appendUpload", "Append data"),
                    verbatimTextOutput("msgAppend", placeholder=TRUE),
                ) # End column
            ) # End fluidRow
        ), # End column
        column(5,
            h3("Data Contribution Terms"),
            p("By submitting or contributing any data, information, or materials 
            ('Contributed Data') to the nanomedAI Database or this repository, 
            you agree to the following:"),
            p(strong("1. Public Availability:"), "All Contributed Data will be 
            publicly available without restriction. Data will be hosted and 
            disseminated via a public GitHub repository (and related mirrors or 
            archives)."),
            p(strong("2. No Expectation of Privacy or Confidentiality:"), "By 
            contributing, you waive any expectation of privacy, confidentiality, 
            or control over your submission. Contributed Data may be freely 
            viewed, copied, modified, and redistributed by others."),
            p(strong("3. License and Use rights:"), "You grant nanomedAI and the 
            public a perpetual, irrevocable, worldwide, royalty-free, 
            non-exclusive license to use, reproduce, distribute, modify, and 
            create derivative works from your Contributed Data for any purpose, 
            including commercial, research, and educational use."),
            p(strong("4. Waiver of Intellectual Property Claims:"), "You 
            relinquish and waive any ownership, attribution, or moral rights 
            associated with the Contributed Data once submitted."),
            p(strong("5. Representation of Rights"), "You represent that you have 
            the necessary rights and authority to contribute the data and that 
            your contribution does not infringe upon any third-party rights 
            (including privacy, intellectual property, or contractual 
            obligations)."),
            h3("GDPR and Data Privacy Statement"),
            strong("1. Purpose"),
            p("This statement clarifies the handling of data submitted to the 
            nanomedAI Database, including personal and non-personal data, in 
            compliance with the EU General Data Protection Regulation (GDPR, 
            Regulation (EU) 2016/679) and other applicable data protection laws."),
            strong("2. Scope"),
            p("This policy applies to all contributors ('Users') who submit data, 
            information, or materials (“Contributed Data”) to the nanomedAI 
            Database, whether for research, administrative, or other purposes."),
            strong("3. Nature of Contributed Data"),
            p("(a) Users may be required to submit personal data ('Personal Data') 
            as part of their contribution. Personal Data will be stored securely
            and processed in accordance with GDPR but will not be included in 
            the publicly accessible portion of the Database."),
            p("(b) Any data released publicly ('Public Data') must not include 
            personal data, unless explicit consent has been obtained for 
            public release. Public Data may include research datasets, 
            aggregate statistics, or other non-identifiable information."),
            strong("4. Public Data and User Consent"),
            p("By contributing data, Users acknowledge and consent that:"),
            p("(a) Public data:"),
            p("- Will be hosted publicly, including on GitHub or similar 
            platforms"),
            p("- May be copied, redistributed, modified, and used by third 
            parties for research, educational, or commercial purposes without 
            restriction."),
            p("(b) Personal data:"),
            p("- Will be kept private, accessible only to authorized personnel 
              for research, administrative, or regulatory purposes."),
            p("- Will not be shared with the general public."),
            strong("5. Personal Data Handling"),
            p("(a) Personal Data submitted by Users will be:"),
            p("- Stored securely using encryption and access controls."),
            p("- Processed only for purposes necessary to support database 
              operations and research."),
            p("- Accessible only to authorized personnel within the nanomedAI project."),
            p("(b) Users and data subjects retain all rights guaranteed under 
              GDPR, including:"),
            p("- Access to their personal data."),
            p("- Correction or rectification of inaccurate data."),
            p("- Deletion of personal data where applicable."),
            p("- Restriction or objection to processing of personal data."),
            strong("6. Data Anonymization"),
            p("To ensure GDPR compliance:"),
            p("- Public Data should contain no direct identifiers 
              (e.g., names, email addresses, national IDs)."),
            p("- Avoid indirect identifiers that could allow re-identification."),
            p("- Aggregation, generalization, or pseudonymization should be 
              applied where appropriate."),
            strong("7. Rights of Data Subjects"),
            p("Data subjects may contact thomaslee.moore@unina.it to exercise 
              their GDPR rights at any time, including access, correction, 
              deletion, and objection."),
            strong("8. Liability and Representations"),
            p("By contributing data, Users represent and warrant that:"),
            p("(a) They have the legal authority to submit all Contributed Data."),
            p("(b) Public Data does not contain personal data unless proper 
              consent has been obtained."),
            p("(c) They assume responsibility for compliance with all 
              applicable privacy and data protection laws."),
            strong("9. Data Retention"),
            p("(a) Public Data: Retained indefinitely and permanently 
              accessible once submitted."),
            p("(b) Personal Data: Retained only as long as necessary for 
              administrative, research, or regulatory purposes, 
              in accordance with GDPR and internal retention policies."),
            strong("10. Contact"),
            p("For questions regarding GDPR compliance, privacy, or contributions, contact:"),
            p("Thomas L. Moore, E-mail: thomaslee.moore@unina.it")
        ) # End column
    ) # End fluidRow
) # End tabItem
