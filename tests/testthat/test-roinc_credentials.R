# Tests for roinc_set_credentials ----------------------------------------------

test_that("roinc_set_credentials errors as expected", {
  expect_error(roinc_set_credentials())
  expect_error(roinc_set_credentials(username = "username"))
})

test_env <- rlang::new_environment()

withr::with_environment(
  env = test_env,
  code = {
    roinc_set_credentials(username = "username", password = "password")

    test_that("roinc_set_credentials works as expected", {
      expect_equal(Sys.getenv("LOINC_USERNAME"), "username")
      expect_equal(Sys.getenv("LOINC_PASSWORD"), "password")
    })

    test_that("roinc_set_credentials works as expected", {
      expect_warning(
        roinc_set_credentials(username = "username", password = "password")
      )
    })

    test_that("roinc_set_credentials works as expected", {
      expect_message(
        roinc_set_credentials(username = "user", password = "pass")
      )
    })

    test_that("roinc_set_credentials works as expected", {
      expect_message(check_credentials())
    })

    Sys.setenv(LOINC_USERNAME = "", LOINC_PASSWORD = "")

    test_that("roinc_set_credentials errors as expected", {
      expect_message(check_username())
      expect_message(check_password())
      expect_error(check_credentials())
    })
  }
)

