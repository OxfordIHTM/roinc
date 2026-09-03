#'
#' Retrieving the LOINC CodeSystem resource for FHIR
#' 
#' @inheritParams loinc-params tabular
#' 
#' @returns A [list] or a [tibble] of LOINC CodeSystem resources for FHIR.
#' 
#' @examples
#' \dontrun{
#' loinc_terminology_codeystem()
#' }
#' 
#' @rdname loinc_terminology_codesystem
#' @export
#' 

loinc_terminology_codesystem <- function(tabular = TRUE) {
  req <- httr2::request(base_url = base_url_terminology) |>
    httr2::req_url_path_append("CodeSystem") |>
    httr2::req_url_query(url = "http://loinc.org") |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )
  
  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  if (tabular) {
    resp$meta <- dplyr::bind_rows(resp$meta)

    resp$link <- tibble::tibble(resp$link) |>
      tidyr::unnest_wider(.data$`resp$link`)

    resp$entry <- tibble::tibble(resp$entry) |>
      tidyr::unnest_wider(.data$`resp$entry`) |>
      tidyr::unnest_wider(.data$resource)

    resp <- resp |>
      dplyr::bind_rows()
  }

  resp
}