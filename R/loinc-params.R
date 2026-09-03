#' 
#' Common parameters used across loinc functions
#'
#' @param query Search string.
#' @param rows Integer value to indicate the number of rows to return. When set
#'   to NULL (default), 50 rows of search results are returned.
#' @param offset Integer value to indicate the offset, for paging. When set to
#'   NULL (default), offset of 0 is used.
#' @param sortorder String value, specifying which field to sort on and order
#'   (desc and asc).
#' @param language Integer value to indicate which language to return.
#' @param includefiltercounts Boolean value to indicate if information for
#'   filters should be returned with the results.
#' @param tabular Logical. Should response be tabular? If TRUE (default),
#'   response is converted to a [tibble]. If FALSE, response is kept
#'   as a [list].
#'
#' @name loinc-params
#' @keywords internal
#'
NULL

## Base URL for download api ----
base_url_download <- "https://loinc.regenstrief.org/api/v1"

## Base URL for search api ----
base_url_search <- "https://loinc.regenstrief.org/searchapi"

## Base URL for terminology service ----
base_url_terminology <- "https://fhir.loinc.org"


