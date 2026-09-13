# Tests for roinc_codesystem ---------------------------------------------------

with_mock_api({
  test_that("roinc_codesystem returns appropriate response", {
    expect_named(
      roinc_codesystem(tabular = FALSE),
      c("resourceType", "id", "meta", "type", "total", "link", "entry")
    )
  })
})

without_internet({
  test_that("roinc_codesystem creates the appropriate request", {
    expect_GET(
      roinc_codesystem(),
      "https://fhir.loinc.org/CodeSystem?url=http%3A%2F%2Floinc.org"
    )
  })
})

with_mock_api({
  test_that("roinc_codesystem_lookup returns appropriate response", {
    expect_named(
      roinc_codesystem_lookup(code = "4544-3"),
      c("resourceType", "parameter")
    )
  })
})

without_internet({
  test_that("roinc_codesystem_lookup creates the appropriate request", {
    expect_GET(
      roinc_codesystem_lookup(code = "4544-3"),
      "https://fhir.loinc.org/CodeSystem/%24lookup?system=http%3A%2F%2Floinc.org&code=4544-3"
    )
  })
})

with_mock_api({
  test_that("roinc_codesystem_lookup returns appropriate response", {
    expect_named(
      roinc_codesystem_lookup(code = "4544-3", property = "METHOD_TYP"),
      c("resourceType", "parameter")
    )
  })
})

without_internet({
  test_that("roinc_codesystem_lookup creates the appropriate request", {
    expect_GET(
      roinc_codesystem_lookup(code = "4544-3", property = "METHOD_TYP"),
      "https://fhir.loinc.org/CodeSystem/%24lookup?system=http%3A%2F%2Floinc.org&code=4544-3&%26property=METHOD_TYP"
    )
  })
})

with_mock_api({
  test_that("roinc_codesystem_lookup returns appropriate response", {
    expect_named(
      roinc_codesystem_lookup(code = "4544-3", version = "2.80"),
      c("resourceType", "parameter")
    )
  })
})

without_internet({
  test_that("roinc_codesystem_lookup creates the appropriate request", {
    expect_GET(
      roinc_codesystem_lookup(code = "4544-3", version = "2.80"),
      "https://fhir.loinc.org/CodeSystem/%24lookup?system=http%3A%2F%2Floinc.org&code=4544-3&version=2.80"
    )
  })
})
