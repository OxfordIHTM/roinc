#'
#' Get LOINC's primary release artifact download metadata
#' 
#' @param version Character string for LOINC version.
#' @param tabular Logical. Should response be tabular? If TRUE (default),
#'   response is converted to a [tibble]. If FALSE, response is kept
#'   as a [list].
#' 
#' @returns A [list] or [tibble] of the metadata for the current and for every
#'   past release of LOINC or for specific version requested.
#' 
#' @examples
#' \dontrun{
#' loinc_download_metadata()
#' loinc_download_metadata_version()
#' }
#' 
#' @rdname loinc_download_metadata
#' @export
#' 

loinc_download_metadata <- function(tabular = TRUE) {
  ## Create base request for all metadata and authenticate ----
  req <- httr2::request(base_url = base_url_download) |>
    httr2::req_url_path_append("Loinc/All") |>
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

#'
#' @rdname loinc_download_metadata
#' @export
#' 

loinc_download_metadata_version <- function(version = NULL, tabular = TRUE) {
  ## Create base request for current version ----
  req <- httr2::request(base_url = base_url_download) |>
    httr2::req_url_path_append("Loinc")

  ## Update base request if version is specified ----
  if (!is.null(version)) {
    req <- req |>
      httr2::req_url_query(version = version)
  }

  ## Authenticate ----
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
