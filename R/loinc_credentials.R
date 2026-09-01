#'
#' Set LOINC API credentials
#' 
#' @param username LOINC login username
#' @param password LOINC login password
#' 
#' @examples
#' \dontrun{
#' loinc_set_credentials
#' }
#' 
#' @export
#' 

loinc_set_credentials <- function(username, password) {
  Sys.setenv(LOINC_USERNAME = username, LOINC_PASSWORD = password)
}
