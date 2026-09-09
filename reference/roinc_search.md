# Search the LOINC database

Search the LOINC database

## Usage

``` r
roinc_search_loincs(
  query,
  rows = NULL,
  offset = NULL,
  sortorder = NULL,
  language = NULL,
  includefiltercounts = NULL,
  tabular = TRUE,
  summary = FALSE
)

roinc_search_answerlists(
  query,
  rows = NULL,
  offset = NULL,
  sortorder = NULL,
  language = NULL,
  includefiltercounts = NULL,
  tabular = TRUE,
  summary = FALSE
)

roinc_search_parts(
  query,
  rows = NULL,
  offset = NULL,
  sortorder = NULL,
  language = NULL,
  includefiltercounts = NULL,
  tabular = TRUE,
  summary = FALSE
)

roinc_search_groups(
  query,
  rows = NULL,
  offset = NULL,
  sortorder = NULL,
  language = NULL,
  includefiltercounts = NULL,
  tabular = TRUE,
  summary = FALSE
)
```

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

- tabular:

  Logical. Should response be tabular? If TRUE (default), response is
  converted to a
  [tibble](https://tibble.tidyverse.org/reference/tibble.html). If
  FALSE, response is kept as a [list](https://rdrr.io/r/base/list.html).

- summary:

  Logical. Should the results summary be returned? If FALSE (default),
  full search results are returned. If TRUE, only results summary are
  returned.

## Value

A [list](https://rdrr.io/r/base/list.html) or
[tibble](https://tibble.tidyverse.org/reference/tibble.html) of results
summary or full search results.

## Examples

``` r
if (FALSE) { # \dontrun{
roinc_search_loincs()
roinc_search_answerlists()
roinc_search_parts()
roinc_search_groups()
} # }
```
