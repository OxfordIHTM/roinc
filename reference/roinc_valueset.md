# Retrieving the LOINC value set resource for FHIR

Retrieving the LOINC value set resource for FHIR

## Usage

``` r
roinc_valueset(valueset, expand = FALSE, version = NULL)

roinc_valueset_validate(valueset, code)
```

## Arguments

- valueset:

  A string value for a LOINC term, answer lists, or LOINC groups that
  specify a set of codes drawn from one or more LOINC code systems.

- expand:

  Logical. Should a value set expansion be performed? If TRUE (default),
  the terms in a given value set are returned.

- version:

  A string value for LOINC version identifier to specify which versions
  of concepts in LOINC to retrieve.

- code:

  String value for LOINC code identifier for a LOINC code, part, answer
  list, or answer.

## Value

A [list](https://rdrr.io/r/base/list.html) or a
[tibble](https://tibble.tidyverse.org/reference/tibble.html) of LOINC
ValueSet resources for FHIR.

## Examples

``` r
if (FALSE) { # \dontrun{
roinc_valueset("LL1162-8")
roinc_valueset("LL1162-8", expand = TRUE, metadata = FALSE)
roinc_valueset_validate("LG33055-1", "8867-4")
} # }
```
