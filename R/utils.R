# Check for LOINC username and password ----
check_username <- function(username) {
  env_username <- Sys.getenv("LOINC_USERNAME")

  if (env_username != "") {
    if (env_username == username) {
      warning(
        "An existing username environment variable of the same value as ",
        username, " has already been specified. Using existing username ",
        "environment variable."
      )
    } else {
      message("A username environment variable will be set as specified.")
    }
  } else {
    message("A username environment variable will be set as specified.")
  }
}

check_password <- function(password) {
  env_password <- Sys.getenv("LOINC_PASSWORD")

  if (env_password != "") {
    if (env_password == password) {
      warning(
        "An existing password environment variable of the same value as the ",
        "password you have provided. Using existing username environment variable."
      )
    } else {
      message("A password environment variable will be set as specified.")
    }
  } else {
    message("A password environment variable will be set as specified.")
  }
}


check_credentials <- function() {
  username <- Sys.getenv("LOINC_USERNAME")
  password <- Sys.getenv("LOINC_PASSWORD")

  if (username == "" | password == "") {
    stop(
      "No LOINC username and/or password found in environment variables. Please ",
      "remember to register with LOINC at https://loinc.org/join to get a ",
      "username and password and then set appropriate environment variables ",
      "using loinc_set_credentials().",
      call. = TRUE
    )
  } else {
    message(
      "LOINC username and password environment variables detected. ",
      "Continuing on with authentication."
    )
  }
}