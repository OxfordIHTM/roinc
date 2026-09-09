#'
#' Interface to the Logical Observation Identifiers Names and Codes (LOINC) API
#' 
#' The Logical Observation Identifiers Names and Codes or LOINC LOINC is the
#' international standard for identifying health observations, measurements, and
#' documents. This package interfaces with the LOINC API.
#'
#' @docType package
#' @keywords internal
#' @name roinc
#' 
#' @import httr2
#' @importFrom dplyr bind_rows
#' @importFrom tidyr unnest_wider unnest
#' @importFrom tibble tibble
#' @importFrom rlang .data
#'
#'
"_PACKAGE"