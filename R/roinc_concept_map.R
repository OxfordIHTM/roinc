#'
#' Retrieving the LOINC concept map resource for FHIR
#' 
#' @inheritParams roinc-params code
#' 
#' @returns A [list] or a [tibble] of LOINC ConceptMap resources for FHIR.
#' 
#' @examples
#' \dontrun{
#' roinc_concept_map("30657-1")
#' }
#' 
#' @rdname roinc_concept_map
#' @export
#' 

roinc_concept_map <- function(code) {
  ## Create base request for value set ----
  req <- httr2::request(base_url = base_url_terminology) |>
    httr2::req_url_path_append("ConceptMap")

  req <- req |>
    httr2::req_url_path_append("$translate") |>
    httr2::req_url_query(
      system = "http://loinc.org",
      code = code
    )
  
  ## Authenticate ----
  req <- req |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )
  
  ## Retrieve response ----
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  ## Return response ----
  resp
}


