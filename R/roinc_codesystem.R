#'
#' Retrieving the LOINC CodeSystem resource for FHIR
#' 
#' @inheritParams roinc-params tabular code property version
#' 
#' @returns A [list] or a [tibble] of LOINC CodeSystem resources for FHIR.
#' 
#' @examples
#' \dontrun{
#' roinc_codeystem()
#' roinc_codesystem_lookup(code = "4544-3")
#' roinc_codesystem_lookup(code = "LP31755-9")
#' roinc_codesystem_lookup(code = "LL1162-8")
#' roinc_codesystem_lookup(code = "LA6751-7")
#' }
#' 
#' @rdname roinc_codesystem
#' @export
#' 

roinc_codesystem <- function(tabular = TRUE) {
  ## Create request ----
  req <- httr2::request(base_url = base_url_terminology) |>
    httr2::req_url_path_append("CodeSystem") |>
    httr2::req_url_query(url = "http://loinc.org") |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )
  
  ## Retrieve response ----
  resp <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  ## Tabularise ----
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

  ## Return response ----
  resp
}

#'
#' @rdname roinc_codesystem
#' @export
#' 

roinc_codesystem_lookup <- function(code, 
                                    property = NULL,
                                    version = NULL) {
  req <- httr2::request(base_url = base_url_terminology) |>
    httr2::req_url_path_append("CodeSystem", "$lookup") |>
    httr2::req_url_query(
      system = "http://loinc.org",
      code = code
    )

  ## Add property and version queries ----
  if (!is.null(property)) {
    req_url <- paste0(
      file.path(base_url_terminology, "CodeSystem", "$lookup"),
      "?system=http://loinc.org&code=", code
    )

    if (!is.null(version)) {
      req_url <- paste0(req_url, "&version=", version)
    }
    
    property_query <- paste0("&&property=", property, collapse = "")

    req_url <- paste0(req_url, property_query)

    req <- httr2::request(base_url = req_url)
  } else {
    if (!is.null(version)) {
      req <- req |>
        httr2::req_url_query(version = version)
    }
  }

  ## Authenticate ----
  req <- req |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )
  
  ## Perform request ----
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  ## Return response ----
  resp
}


