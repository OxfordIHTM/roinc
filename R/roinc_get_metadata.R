#'
#' Get LOINC's primary release artifact download metadata
#' 
#' @inheritParams roinc-params version tabular
#' 
#' @returns A [list] or [tibble] of the metadata for the current and for every
#'   past release of LOINC or for specific version requested.
#' 
#' @examples
#' \dontrun{
#' roinc_get_metadata()
#' roinc_get_metadata_version()
#' }
#' 
#' @rdname roinc_get_metadata
#' @export
#' 

roinc_get_metadata <- function(version = NULL, tabular = TRUE) {
  ## Create base request for all metadata and authenticate ----
  req <- httr2::request(base_url = base_url_download) |>
    httr2::req_url_path_append("Loinc")

  if (is.null(version)) {
    req <- req |>
      httr2::req_url_path_append("All")
  } else {
    req <- req |>
      httr2::req_url_query(version = version)
  }

  req <- req |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )

  ## Get response ----
  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  ## Tabularise ----
  if (tabular) resp <- dplyr::bind_rows(resp)
    
  ## Return response ----
  resp
}

