#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import mapselector
#' @noRd
app_ui <- function(request) {
  tagList(
    marcel(filename = "marcel.md"),
    golem_add_external_resources(),
    tableau_de_bord(
      dash_title(title = "Explorateur des sites"), 
      dash_sidebar(
        badge(text_badge = "Un survol des sites sélectionnés par les scientifiques du MFFP pour compléter un suivi de la biodiversité au Québec.")
      ), 
      dash_tabs(
        #maybe a little strange, but here we pass in the UI of a modal and the id that defines it.
        tab_map(title = "Plan des sites", id = "sitemap", outputFunction = mod_map_select_ui)
        )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(ext = 'png'),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'explosites'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

