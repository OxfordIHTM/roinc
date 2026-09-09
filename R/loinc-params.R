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
#' @param code String value for LOINC code identifier for a LOINC code,
#'   part, answer list, or answer.
#' @param tabular Logical. Should response be tabular? If TRUE (default),
#'   response is converted to a [tibble]. If FALSE, response is kept
#'   as a [list].
#' @param property A string value or vector of string values for specific LOINC
#'   code system property or properties to return in a lookup. The current list
#'   of property codes that will return a result are found in <https://build.fhir.org/ig/HL7/termchangeset-ig/en/CodeSystem-loinc-property-cs.html>.
#' @param version A string value for LOINC version identifier to specify which
#'   versions of concepts in LOINC to retrieve.
#' @param valueset A string value for a LOINC term, answer lists, or LOINC
#'   groups that specify a set of codes drawn from one or more LOINC code systems.
#' @param panel A string value for a LOINC panel.
#' 
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

