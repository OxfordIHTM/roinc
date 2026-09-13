#'
#' Download LOINC's primary release artifact
#' 
#' @inheritParams roinc-params version directory
#' 
#' @returns The file path to the downloaded LOINC primary release artifact.
#' 
#' @examples
#' \dontrun{
#' roinc_download()
#' }
#' 
#' @rdname roinc_download
#' @export
#' 

roinc_download <- function(version = NULL, directory = NULL) {
  ## Create base request for download ----
  req <- httr2::request(base_url = base_url_download) |>
    httr2::req_url_path_append("Loinc/Download")
  
  ## Check for download version ----
  if (!is.null(version)) {
    req <- req |>
      httr2::req_url_query(version = version)
  }

  ## Authenticate ----
  req <- req |>
    httr2::req_auth_basic(
      username = Sys.getenv("LOINC_USERNAME"),
      password = Sys.getenv("LOINC_PASSWORD")
    )
  
  ## Determine filename ----
  if (is.null(version))
    filename <- "loinc_latest.zip"
  else
    filename <- paste0("loinc_", version, ".zip") 
  
  ## Determine file path ----
  if (is.null(directory)) {
    path <- filename
  } else {
    path <- file.path(directory, filename)
  }

  ## Get response ----
  httr2::req_perform(req = req, path = path)

  ## Return file path ----
  path
}
