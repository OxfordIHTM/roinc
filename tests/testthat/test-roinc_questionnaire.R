# Tests for roinc_questionnaire ------------------------------------------------

with_mock_api({
  test_that("roinc_questionnaire returns the appropriate response", {
    expect_named(
      roinc_questionnaire("89689-4"),
      c(
        "resourceType", "id", "meta", "url", "version", "name", "title", "status",
        "subjectType", "publisher", "contact", "description", "copyright", "code",
        "item"
      )
    )
  })
})

