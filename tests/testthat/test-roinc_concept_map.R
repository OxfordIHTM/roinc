
# Tests for roinc_concept_map --------------------------------------------------

with_mock_api({
  test_that("roinc_concept_map returns the appropriate response", {
    expect_named(
      roinc_concept_map("30657-1"),
      c("resourceType", "parameter")
    )
  })
})
