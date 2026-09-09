#'
#' Set LOINC API credentials
#' 
#' @param username LOINC login username
#' @param password LOINC login password
#' 
#' @examples
#' \dontrun{
#' roinc_set_credentials
#' }
#' 
#' @export
#' 

roinc_set_credentials <- function(username, password) {
  check_username(username = username)
  check_password(password = password)

  Sys.setenv(LOINC_USERNAME = username, LOINC_PASSWORD = password)
}

