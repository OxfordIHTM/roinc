# Get LOINC's primary release artifact download metadata

Get LOINC's primary release artifact download metadata

## Usage

``` r
roinc_get_metadata(version = NULL, tabular = TRUE)
```

## Arguments

- version:

  A string value for LOINC version identifier to specify which versions
  of concepts in LOINC to retrieve.

- tabular:

  Logical. Should response be tabular? If TRUE (default), response is
  converted to a
  [tibble](https://tibble.tidyverse.org/reference/tibble.html). If
  FALSE, response is kept as a [list](https://rdrr.io/r/base/list.html).

## Value

A [list](https://rdrr.io/r/base/list.html) or
[tibble](https://tibble.tidyverse.org/reference/tibble.html) of the
metadata for the current and for every past release of LOINC or for
specific version requested.

## Examples

``` r
if (FALSE) { # \dontrun{
roinc_get_metadata()
roinc_get_metadata_version()
} # }
```
