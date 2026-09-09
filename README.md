
<!-- README.md is generated from README.Rmd. Please edit that file -->

# roinc: Interface to the Logical Observation Identifiers Names and Codes (LOINC) API

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/OxfordIHTM/roinc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/OxfordIHTM/roinc/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/OxfordIHTM/roinc/graph/badge.svg)](https://app.codecov.io/gh/OxfordIHTM/roinc)
[![CodeFactor](https://www.codefactor.io/repository/github/oxfordihtm/roinc/badge)](https://www.codefactor.io/repository/github/oxfordihtm/roinc)
<!-- badges: end -->

The [Logical Observation Identifiers Names and Codes or
LOINC](https://loinc.org/) is the international standard for identifying
health observations, measurements, and documents. This package
interfaces with the LOINC API for their [terminology
service](https://loinc.org/fhir),
[search](https://loinc.org/kb/api/search-api), and
[download](https://loinc.org/kb/api/download).

## What does the package do?

Please note that `{roinc}` is in early experimental development stage
and functionalities and their corresponding syntax may change over time
until we reach a more stable version.

Currently, the package provides functions for:

- interfacing with the [LOINC download API
  endpoints](https://loinc.org/kb/api/download);

- interfacing with the [LOINC search API
  endpoints](https://loinc.org/kb/api/search-api); and,

- interfacing with the [LOINC FHIR terminology service API
  endpoints](https://loinc.org/fhir).

## Installation

`{roinc}` is not yet on [CRAN](https://cran.r-project.org) but can be
installed from the [Oxford iHealth R
Universe](https://oxfordihtm.r-universe.dev) as follows:

``` r
install.packages(
  "roinc",
  repos = c('https://oxfordihtm.r-universe.dev', 'https://cloud.r-project.org')
)
```

or via the `{pak}` package as follows:

``` r
if(!require(pak)) install.packages("pak")
pak::pak("OxfordIHTM/roinc")
```

Once installed, `{roinc}` can then be loaded into an R session

``` r
# load package
library(roinc)
```

## Usage

## Citation

If you use the `{roinc}` package in your work, please cite using the
suggested citation provided by a call to the `citation` function as
follows:

``` r
citation("roinc")
#> To cite loinc in publications use:
#> 
#>   Ernest Guevarra (2026). _roinc: Interface to the Logical Observation
#>   Identifiers Names and Codes (LOINC) API_. R package version 0.0.9000,
#>   <https://oxford-ihtm.io/roinc/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {roinc: Interface to the Logical Observation Identifiers Names and Codes (LOINC) API},
#>     author = {{Ernest Guevarra}},
#>     year = {2026},
#>     note = {R package version 0.0.9000},
#>     url = {https://oxford-ihtm.io/roinc/},
#>   }
```

## Community guidelines

Feedback, bug reports and feature requests are welcome; file issues or
seek support [here](https://github.com/OxfordIHTM/roinc/issues). If you
would like to contribute to the package, please see our [contributing
guidelines](https://oxford-ihtm.io/roinc/CONTRIBUTING.html).

This project is released with a [Contributor Code of
Conduct](https://oxford-ihtm.io/roinc/CODE_OF_CONDUCT.html). By
participating in this project you agree to abide by its terms.

If you are interested in [Oxford iHealth](https://oxford-ihtm.io)’s work
and would like to join the community or contribute to it’s various
projects, visit the [Oxford iHealth website](https://oxford-ihtm.io) and
its [community page](https://oxford-ihtm.io/community/) to learn more.

<br/> <br/>

[![This is a project under the Oxford iHealth initiative of the MSc in
International Health and Tropical Medicine of the Nuffield Department of
Medicine, University of
Oxford](https://github.com/OxfordIHTM/ihealth-images/blob/main/ihealth/ihealth_footer.png?raw=true)](https://oxford-ihtm.io)
