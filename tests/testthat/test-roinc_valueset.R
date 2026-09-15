# Tests for roinc_valueset -----------------------------------------------------

with_mock_api({
  test_that("roinc_valueset returns the appropriate response", {
    expect_named(
      roinc_valueset("LL1162-8"),
      c("resourceType", "id", "meta", "type", "total", "link", "entry")
    )
  })
})

with_mock_api({
  test_that("roinc_valueset returns the appropriate response", {
    expect_named(
      roinc_valueset("LL1162-8", expand = TRUE),
      c("resourceType", "id", "meta", "type", "total", "link", "entry")
    )
  })
})

with_mock_api({
  test_that("roinc_valueset returns the appropriate response", {
    expect_named(
      roinc_valueset("LG33055-1", version = "2.72"),
      c("resourceType", "id", "meta", "type", "total", "link", "entry")
    )
  })
})

with_mock_api({
  test_that("roinc_valueset returns the appropriate response", {
    expect_named(
      roinc_valueset("LG33055-1", expand = TRUE, version = "2.72"),
      c(
        "resourceType", "id", "url", "version", "name", "status", "experimental",
        "publisher", "contact", "copyright", "compose", "expansion"
      )
    )
  })
})


with_mock_api({
  test_that("roinc_valueset_validate returns the appropriate response", {
    expect_named(
      roinc_valueset_validate("LG33055-1", "8867-4"),
      c("resourceType", "parameter")
    )
  })
})

without_internet({
  test_that("roinc_valueset_validate request is properly formed", {
    expect_GET(
      roinc_valueset_validate("LG33055-1", "8867-4"),
      "https://fhir.loinc.org/ValueSet/LG33055-1/%24validate-code?system=http%3A%2F%2Floinc.org&code=8867-4"
    )
  })
})


