# Retrieve LOINC panel/questionnaire resource for FHIR

Retrieve LOINC panel/questionnaire resource for FHIR

## Usage

``` r
roinc_questionnaire(panel)
```

## Arguments

- panel:

  A string value for a LOINC panel.

## Value

A [list](https://rdrr.io/r/base/list.html) or a
[tibble](https://tibble.tidyverse.org/reference/tibble.html) of LOINC
panel/questionnaire resources for FHIR.

## Examples

``` r
if (FALSE) { # \dontrun{
roinc_questionnaire(panel = "89689-4")
} # }
```
