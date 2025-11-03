home <- tabItem(tabName = "home",
    h2("Welcome to the nanomedAI Open Database"),
    fluidRow(
    column(9, 
        p("The", strong("nanomedAI Open Database"), "is an initiative 
          to curate nanomedicine formulation data in a systematic and open
          manner. 
          These data are freely accessible to the nanomedicine
          community to explore structure-function relationships
          between nanomaterial physico-chemical properties, formulation
          parameters, and biological interactions.
          "),
        p("Users can also contribute their data, which
          will then be integrated into the database."),
        p("The nanomedAI platform and data herein are distributed
          under a ", a("CC BY 4.0 license.", 
          href="https://creativecommons.org/licenses/by/4.0/deed.en"),
          "You are free to share (copy and redistribute) as well as 
          adapt (remix, transform, and build upon) with proper
          attribution given to the nanomedAI platform
          and database."),
        p("")
    ), # End column
    column(3,
    ) # End column
) # End fluidRow
)
