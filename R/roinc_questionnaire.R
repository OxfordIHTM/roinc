#'
#' Retrieve LOINC panel/questionnaire resource for FHIR
#' 
#' @inheritParams roinc-params panel
#' 
#' @returns A [list] or a [tibble] of LOINC panel/questionnaire resources for
#'   FHIR.
#' 
#' @examples
#' \dontrun{
#' roinc_questionnaire(panel = "89689-4")
#' }
#' 
#' @rdname roinc_questionnaire
#' @export
#' 

roinc_questionnaire <- function(panel) {
  req <- httr2::request(base_url = base_url_terminology) |>
    httr2::req_url_path_append("Questionnaire", panel) |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )
  
  ## Retrieve response ----
  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  ## Return response ----
  resp
}

