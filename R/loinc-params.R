#' 
#' Common parameters used across loinc functions
#'
#' @param query Search string
#' @param rows Integer value to indicate the number of rows to return
#' @param offset Integer value to indicate the offset, for paging
#' @param sortorder String value, specifying which field to sort on and order
#'   (desc and asc)
#' @param language Integer value to indicate which language to return.
#' @param includefiltercounts Boolean value to indicate if information for
#'   filters should be returned with the results
#'
#' @name loinc-params
#' @keywords internal
#'
NULL


base_url <- "https://loinc.regenstrief.org/api/v1"

