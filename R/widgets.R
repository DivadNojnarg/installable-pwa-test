#' @export
f7_gauge <- function(id, value, options = NULL) {

  if (is.null(options[["valueText"]])) options[["valueText"]] <- paste(value * 100, "%")

  gaugeProps <- c(list(value = value), options)

  gaugeConfig <- shiny::tags$script(
    type = "application/json",
    `data-for` = id,
    jsonlite::toJSON(
      x = gaugeProps,
      auto_unbox = TRUE,
      json_verbatim = TRUE
    )
  )

  shiny::tags$div(
    class = "gauge",
    id = id,
    gaugeConfig
  )
}



#' @export
f7_notif <- function(id = NULL, text, options = NULL, session = shiny::getDefaultReactiveDomain()) {

  if (!is.null(options$icon)) options$icon <- as.character(options$icon)

  message <- c(dropNulls(list(id = id, text = text)), options)
  # see my-app.js function
  sendCustomMessage("notification", message, session)

}



#' @export
update_f7_instance <- function(id, options, session = shiny::getDefaultReactiveDomain()) {

  # Convert any shiny tag into character so that toJSON does not cry
  listRenderTags <- function(l) {
    lapply(
      X = l,
      function(x) {
        if (inherits(x, c("shiny.tag", "shiny.tag.list"))) {
          as.character(x)
        } else if (inherits(x, "list")) {
          # Recursive part
          listRenderTags(x)
        } else {
          x
        }
      }
    )
  }
  options <- listRenderTags(options)

  message <- list(id = id, options = options)
  sendCustomMessage("update-instance", message, session)
}



sendCustomMessage <- function(type, message, session) {
  session$sendCustomMessage(
    type,
    jsonlite::toJSON(
      message,
      auto_unbox = TRUE,
      json_verbatim = TRUE
    )
  )
}
