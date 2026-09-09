# Common parameters used across roinc functions

Common parameters used across roinc functions

## Arguments

- query:

  Search string.

- rows:

  Integer value to indicate the number of rows to return. When set to
  NULL (default), 50 rows of search results are returned.

- offset:

  Integer value to indicate the offset, for paging. When set to NULL
  (default), offset of 0 is used.

- sortorder:

  String value, specifying which field to sort on and order (desc and
  asc).

- language:

  Integer value to indicate which language to return.

- includefiltercounts:

  Boolean value to indicate if information for filters should be
  returned with the results.

- code:

  String value for LOINC code identifier for a LOINC code, part, answer
  list, or answer.

- tabular:

  Logical. Should response be tabular? If TRUE (default), response is
  converted to a
  [tibble](https://tibble.tidyverse.org/reference/tibble.html). If
  FALSE, response is kept as a [list](https://rdrr.io/r/base/list.html).

- property:

  A string value or vector of string values for specific LOINC code
  system property or properties to return in a lookup. The current list
  of property codes that will return a result are found in
  <https://build.fhir.org/ig/HL7/termchangeset-ig/en/CodeSystem-roinc-property-cs.html>.

- version:

  A string value for LOINC version identifier to specify which versions
  of concepts in LOINC to retrieve.

- valueset:

  A string value for a LOINC term, answer lists, or LOINC groups that
  specify a set of codes drawn from one or more LOINC code systems.

- panel:

  A string value for a LOINC panel.
