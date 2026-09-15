# Tests for roinc_search -------------------------------------------------------

with_mock_api({
  test_that("roinc_searc_loincs returns the appropriate response", {
    expect_vector(roinc_search_loincs("glucose", tabular = FALSE))
  })
})


with_mock_api({
  test_that("roinc_search_answerlists returns the appropriate response", {
    expect_vector(roinc_search_answerlists("glucose", tabular = FALSE))
  })
})


with_mock_api({
  test_that("roinc_search_parts returns the appropriate response", {
    expect_vector(roinc_search_parts("glucose", tabular = FALSE))
  })
})


with_mock_api({
  test_that("roinc_search_groups returns the appropriate response", {
    expect_vector(roinc_search_groups("glucose", tabular = FALSE))
  })
})
