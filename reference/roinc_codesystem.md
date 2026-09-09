# Retrieving the LOINC CodeSystem resource for FHIR

Retrieving the LOINC CodeSystem resource for FHIR

## Usage

``` r
roinc_codesystem(tabular = TRUE)

roinc_codesystem_lookup(code, property = NULL, version = NULL)
```

## Arguments

- tabular:

  Logical. Should response be tabular? If TRUE (default), response is
  converted to a
  [tibble](https://tibble.tidyverse.org/reference/tibble.html). If
  FALSE, response is kept as a [list](https://rdrr.io/r/base/list.html).

- code:

  String value for LOINC code identifier for a LOINC code, part, answer
  list, or answer.

- property:

  A string value or vector of string values for specific LOINC code
  system property or properties to return in a lookup. The current list
  of property codes that will return a result are found in
  <https://build.fhir.org/ig/HL7/termchangeset-ig/en/CodeSystem-roinc-property-cs.html>.

- version:

  A string value for LOINC version identifier to specify which versions
  of concepts in LOINC to retrieve.

## Value

A [list](https://rdrr.io/r/base/list.html) or a
[tibble](https://tibble.tidyverse.org/reference/tibble.html) of LOINC
CodeSystem resources for FHIR.

## Examples

``` r
if (FALSE) { # \dontrun{
roinc_codeystem()
roinc_codesystem_lookup(code = "4544-3")
roinc_codesystem_lookup(code = "LP31755-9")
roinc_codesystem_lookup(code = "LL1162-8")
roinc_codesystem_lookup(code = "LA6751-7")
} # }
```
