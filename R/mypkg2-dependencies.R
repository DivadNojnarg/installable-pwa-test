#' mypkg2 dependencies utils
#'
#' @description This function attaches mypkg2. dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom utils packageVersion
#' @importFrom htmltools tagList htmlDependency
#' @export
add_mypkg2_deps <- function(tag) {
 mypkg2_deps <- htmlDependency(
  name = "mypkg2",
  version = packageVersion("mypkg2"),
  src = c(file = "mypkg2-0.0.0.9000"),
  script = "js/mypkg2.js",
  package = "mypkg2",
 )
 tagList(tag, mypkg2_deps)
}

