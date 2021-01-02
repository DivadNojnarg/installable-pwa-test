#' @export
f7_page <- function(..., navbar, toolbar, title = NULL, options = NULL) {

  config_tag <- tags$script(
    type = "application/json",
    `data-for` = "app",
    jsonlite::toJSON(
      x = options,
      auto_unbox = TRUE,
      json_verbatim = TRUE
    )
  )

  # create body_tag
  body_tag <- tags$body(
    tags$div(
      id = "app",
      tags$div(
        class = "view view-main",
        tags$div(
          class = "page",
          navbar,
          toolbar,
          tags$div(
            class = "page-content",
            ...
          )
        )
      )
    ),
    config_tag
  )

  tagList(
    tags$head(
      tags$meta(charset = "utf-8"),
      tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, viewport-fit=cover"
      ),
      tags$meta(
        name = "apple-mobile-web-app-capable",
        content = "yes"
      ),
      tags$meta(
        name = "theme-color",
        content = "#2196f3"
      ),
      tags$title(title)
    ),
    add_dependencies(
      body_tag,
      deps = c("framework7", "mypkg2", "pwa", "pwacompat")
    )
  )
}

#' @export
f7_navbar <- function(title) {
  tags$div(
    class = "navbar",
    tags$div(class = "navbar-bg"),
    tags$div(
      class = "navbar-inner",
      tags$div(
        class = "title",
        title
      )
    )
  )
}

#' @export
f7_toolbar <- function(...) {
  tags$div(
    class = "toolbar toolbar-bottom",
    tags$div(
      class = "toolbar-inner",
      ...
    )
  )
}
