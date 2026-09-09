#'
#' Retrieving the LOINC value set resource for FHIR
#' 
#' @inheritParams roinc-params valueset code version
#' @param expand Logical. Should a value set expansion be performed? If TRUE
#'   (default), the terms in a given value set are returned.
#' 
#' @returns A [list] or a [tibble] of LOINC ValueSet resources for FHIR.
#' 
#' @examples
#' \dontrun{
#' roinc_valueset("LL1162-8")
#' roinc_valueset("LL1162-8", expand = TRUE, metadata = FALSE)
#' roinc_valueset_validate("LG33055-1", "8867-4")
#' }
#' 
#' @rdname roinc_valueset
#' @export
#' 

roinc_valueset <- function(valueset, 
                           expand = FALSE,
                           version = NULL) {
  ## Create base request for value set ----
  req <- httr2::request(base_url = base_url_terminology) |>
    httr2::req_url_path_append("ValueSet")
  
  ## Check whether to perform value set expansion ----
  if (expand) {
    path <- file.path("$expand?url=http://loinc.org", "vs", valueset)
  } else {
    path <- file.path("?url=http://loinc.org", "vs", valueset)
  }

  ## Check for version ----
  if (!is.null(version)) {
    path <- paste0(path, "-", version)
  }

  ## Append parameters ----
  req <- req |>
    httr2::req_url_path_append(path)
  
  ## Authenticate ----
  req <- req |>
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


#'
#' @rdname roinc_valueset
#' 

roinc_valueset_validate <- function(valueset, code) {
  req <- httr2::request(base_url = base_url_terminology) |>
    httr2::req_url_path_append("ValueSet", valueset, "$validate-code") |>
    httr2::req_url_query(system = "http://loinc.org", code = code) |>
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
