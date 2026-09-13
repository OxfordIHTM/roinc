# Tests for roinc_download -----------------------------------------------------

with_mock_api({
  test_that("LOINC download is found", {
    expect_equal(
      roinc_download(),
      "loinc_latest.zip"  
    )
  })
})

with_mock_api({
  test_that("LOINC download is found", {
    expect_equal(
      roinc_download(version = "2.80"),
      "loinc_2.80.zip"  
    )
  })
})

with_mock_api({
  test_that("LOINC download is found", {
    expect_equal(
      roinc_download(directory = "data"),
      "data/loinc_latest.zip"  
    )
  })
})

without_internet({
  test_that("LOINC download request is made", {
    expect_GET(
      roinc_download(),
      "https://loinc.regenstrief.org/api/v1/Loinc/Download"
    )    
  })
})

