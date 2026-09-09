# Retrieving the LOINC concept map resource for FHIR

Retrieving the LOINC concept map resource for FHIR

## Usage

``` r
roinc_concept_map(code)
```

## Arguments

- code:

  String value for LOINC code identifier for a LOINC code, part, answer
  list, or answer.

## Value

A [list](https://rdrr.io/r/base/list.html) or a
[tibble](https://tibble.tidyverse.org/reference/tibble.html) of LOINC
ConceptMap resources for FHIR.

## Examples

``` r
if (FALSE) { # \dontrun{
roinc_concept_map("30657-1")
} # }
```
