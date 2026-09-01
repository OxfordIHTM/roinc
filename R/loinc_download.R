#'
#' Get LOINC's primary release artifact download metadata
#' 
#' @param tabular Logical. Should response be tabular? If TRUE (default),
#'   response is converted to a [tibble]. If FALSE, response is kept
#'   as a [list].
#' 
#' @returns A [list] or [tibble] of the metadata for the current and for every
#'   past release of LOINC.
#' 
#' @examples
#' \dontrun{
#' loinc_download_metadata
#' }
#' 
#' @rdname loinc_download_metadata
#' @export
#' 

loinc_download_metadata <- function(tabular = TRUE) {
  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append("Loinc/All") |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )

  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  if (tabular) resp <- dplyr::bind_rows(resp)
    
  resp
}
