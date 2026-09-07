#'
#' Retrieving the LOINC CodeSystem resource for FHIR
#' 
#' @inheritParams loinc-params tabular code property version
#' 
#' @returns A [list] or a [tibble] of LOINC CodeSystem resources for FHIR.
#' 
#' @examples
#' \dontrun{
#' loinc_terminology_codeystem()
#' loinc_terminology_codesystem_lookup(code = "4544-3")
#' loinc_terminology_codesystem_lookup(code = "LP31755-9")
#' loinc_terminology_codesystem_lookup(code = "LL1162-8")
#' loinc_terminology_codesystem_lookup(code = "LA6751-7")
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
    resp$meta <- tibble::tibble(meta = resp$meta) |>
      tidyr::unnest_longer(.data$meta)

    resp$link <- tibble::tibble(link = resp$link) |>
      tidyr::unnest_wider(.data$link)

    resp$entry <- tibble::tibble(entry = resp$entry) |>
      tidyr::unnest_wider(.data$entry) |>
      tidyr::unnest_wider(.data$resource) |>
      tidyr::unnest_wider(.data$meta) |>
      tidyr::unnest(.data$tag) |>
      tidyr::unnest_wider(.data$tag)


    resp <- resp |>
      dplyr::bind_rows()
  }

  resp
}

#'
#' @rdname loinc_terminology_codesystem
#' @export
#' 

loinc_terminology_codesystem_lookup <- function(code, 
                                                property = NULL,
                                                version = NULL) {
  req <- httr2::request(base_url = base_url_terminology) |>
    httr2::req_url_path_append("CodeSystem", "$lookup") |>
    httr2::req_url_query(
      system = "http://loinc.org",
      code = code
    ) |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )

  if (!is.null(property)) {
    req <- req |>
      httr2::req_url_query(
        "&property" = property, .multi = "explode"
      )
  }

  if (!is.null(version)) {
    req <- req |>
      httr2::req_url_query(version = version)
  }
  
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  resp
}


