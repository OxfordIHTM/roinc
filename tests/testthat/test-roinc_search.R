# Tests for roinc_search -------------------------------------------------------

with_mock_api({
  test_that("roinc_searc_loincs returns the appropriate response", {
    expect_vector(roinc_search_loincs("glucose", tabular = FALSE))
  })
})

with_mock_api({
  test_that("roinc_search_loincs returns the appropriate response", {
    expect_vector(
      roinc_search_loincs(
        "glucose", 
        rows = 10, offset = 1, sortorder = "PROPERTY", language = 28,
        includefiltercounts = "true", tabular = FALSE
      )
    )
  })
})


with_mock_api({
  test_that("roinc_search_answerlists returns the appropriate response", {
    expect_vector(roinc_search_answerlists("glucose", tabular = FALSE))
  })
})

with_mock_api({
  test_that("roinc_search_answerlists returns the appropriate response", {
    expect_vector(
      roinc_search_answerlists(
        "glucose", 
        rows = 10, offset = 1, sortorder = "PROPERTY", language = 28,
        includefiltercounts = "true", tabular = FALSE
      )
    )
  })
})


with_mock_api({
  test_that("roinc_search_parts returns the appropriate response", {
    expect_vector(roinc_search_parts("glucose", tabular = FALSE))
  })
})

with_mock_api({
  test_that("roinc_search_parts returns the appropriate response", {
    expect_vector(
      roinc_search_parts(
        "glucose", 
        rows = 10, offset = 1, sortorder = "PROPERTY", language = 28,
        includefiltercounts = "true", tabular = FALSE
      )
    )
  })
})


with_mock_api({
  test_that("roinc_search_groups returns the appropriate response", {
    expect_vector(roinc_search_groups("glucose", tabular = FALSE))
  })
})

with_mock_api({
  test_that("roinc_search_groups returns the appropriate response", {
    expect_vector(
      roinc_search_groups(
        "glucose", 
        rows = 10, offset = 1, sortorder = "PROPERTY", language = 28,
        includefiltercounts = "true", tabular = FALSE
      )
    )
  })
})
