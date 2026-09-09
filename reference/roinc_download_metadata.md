# Get LOINC's primary release artifact download metadata

Get LOINC's primary release artifact download metadata

## Usage

``` r
roinc_download_metadata(tabular = TRUE)

roinc_download_metadata_version(version = NULL, tabular = TRUE)
```

## Arguments

- tabular:

  Logical. Should response be tabular? If TRUE (default), response is
  converted to a
  [tibble](https://tibble.tidyverse.org/reference/tibble.html). If
  FALSE, response is kept as a [list](https://rdrr.io/r/base/list.html).

- version:

  A string value for LOINC version identifier to specify which versions
  of concepts in LOINC to retrieve.

## Value

A [list](https://rdrr.io/r/base/list.html) or
[tibble](https://tibble.tidyverse.org/reference/tibble.html) of the
metadata for the current and for every past release of LOINC or for
specific version requested.

## Examples

``` r
if (FALSE) { # \dontrun{
roinc_download_metadata()
roinc_download_metadata_version()
} # }
```
