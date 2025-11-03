# DEFINE THE UI ==============================================================
## HEADER -----------------------------
header <- dashboardHeader(
    title = "nanomedAI"#,
    # If you want user authentification
    #tags$li(class="dropdown", style="padding: 8px",#
    #        shinyauthr::logoutUI(id="logout")
    #)
) # End header

## SIDEBAR ----------------------------
sidebar <- dashboardSidebar(
    sidebarMenu(#
        menuItem("Home", tabName="home", icon=icon("house")),
        menuItem("Information & Help", tabName="help",
            icon=icon("circle-question")),
        menuItem("Database", tabName="db", icon=icon("database")),
        menuItem("Contribute", tabName="upload", icon=icon("upload")),
        menuItem("License", tabName="license", icon=icon("scale-balanced")),
        menuItem("GitHub", icon = icon("github"),
            href="https://github.com/tlmoore-UniNA/nanomedAI",
            newtab = TRUE)
    ) # End sidebarMenu
) # End dashboardSidebar

## LOAD PAGES -------------------------
source("www/home.R")
source("www/info.R")
source("www/db.R")
source("www/upload.R")
source("www/license.R")

## BODY -------------------------------
body <- dashboardBody(
### CSS STYLE ------
tags$head(tags$style(HTML('
    /* logo */
    .skin-blue .main-header .logo {background-color: #17375E;}
    
    /* logo when hovered */
    .skin-blue .main-header .logo:hover {background-color: #1B415D;}

    /* navbar (rest of the header) */
    .skin-blue .main-header .navbar {background-color: #17375E;}
    
    /* main sidebar */
    .skin-blue .main-sidebar {background-color: #17375E;}

    /* active selected tab in the sidebar menu */
    .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{background-color: #1092BA;}
   
    /* other links in the sidebar menu when hovered */
    .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{background-color: #7AB700;}
'))), # End HTML styling
### TAB ITEMS ------
tabItems(
    home,
    info,
    db,
    upload,
    license
) # End tabItems
) # End dashboardBody

ui <- dashboardPage(header, sidebar, body) # End UI
