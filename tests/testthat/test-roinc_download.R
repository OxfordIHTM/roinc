# Tests for roinc_download -----------------------------------------------------

with_mock_api({
  test_that("LOINC metadata is retrieved", {
    expect_equal(
      roinc_download_metadata(tabular = FALSE) |>
        (\(x) x[[length(x)]]$version[[1]])(),
      "1.0i"
    )
  })
})

without_internet({
  test_that("LOINC metadata API request is made appropriately", {
    expect_GET(
      roinc_download_metadata(),
      "https://loinc.regenstrief.org/api/v1/Loinc/All"
    )    
  })
})

with_mock_api({
  test_that("LOINC metadata for specific version is retrieved", {
    expect_equal(
      roinc_download_metadata_version(version = "2.80", tabular = FALSE)$version[[1]],
      "2.80"
    )
  })
})

without_internet({
  test_that("LOINC metadata version API request is made appropriately", {
    expect_GET(
      roinc_download_metadata_version(version = "2.80"),
      "https://loinc.regenstrief.org/api/v1/Loinc?version=2.80"
    )    
  })
})
