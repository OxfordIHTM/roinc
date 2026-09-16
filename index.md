# roinc: Interface to the Logical Observation Identifiers Names and Codes (LOINC) API

The [Logical Observation Identifiers Names and Codes or
LOINC](https://loinc.org/) is the international standard for identifying
health observations, measurements, and documents. This package
interfaces with the LOINC API for their [terminology
service](https://loinc.org/fhir),
[search](https://loinc.org/kb/api/search-api), and
[download](https://loinc.org/kb/api/download) endpoints.

## What does the package do?

Please note that [roinc](https://oxford-ihtm.io/roinc/) is in early
experimental development stage and functionalities and their
corresponding syntax may change over time until we reach a more stable
version.

Currently, the package provides functions for all the LOINC API
endpoints. These functions support:

- interfacing with the [LOINC download API
  endpoints](https://loinc.org/kb/api/download);

- interfacing with the [LOINC search API
  endpoints](https://loinc.org/kb/api/search-api); and,

- interfacing with the [LOINC FHIR terminology service API
  endpoints](https://loinc.org/fhir).

## Installation

[roinc](https://oxford-ihtm.io/roinc/) is not yet on
[CRAN](https://cran.r-project.org) but can be installed from the [Oxford
iHealth R Universe](https://oxfordihtm.r-universe.dev) as follows:

``` r

install.packages(
  "roinc",
  repos = c('https://oxfordihtm.r-universe.dev', 'https://cloud.r-project.org')
)
```

or via the [pak](https://pak.r-lib.org/) package as follows:

``` r

if(!require(pak)) install.packages("pak")
pak::pak("OxfordIHTM/roinc")
```

Once installed, [roinc](https://oxford-ihtm.io/roinc/) can then be
loaded into an R session

``` r

# load package
library(roinc)
```

## Usage

### Authentication

All requests to LOINC’s RESTful API endpoints require [basic
authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)
using a valid LOINC username and password. LOINC logins are available by
[registering on the website](https://loinc.org/join). Once you have a
LOINC username and password, store these credentials as variables in
your working environment by editing your `.Renviron` file and adding the
following:

``` bash
LOINC_USERNAME=YOUR_USERNAME
LOINC_PASSWORD=YOUR_PASSWORD
```

[roinc](https://oxford-ihtm.io/roinc/) provides a convenience function
that will allow you to set these variables in your current environment
as follows:

``` r

roinc_set_credentials(username = "YOUR_USERNAME", password = "YOUR_PASSWORD")
```

To check whether your authentication credentials have been set, use

``` r

Sys.getenv("LOINC_USERNAME")
Sys.getenv("LOINC_PASSWORD")
```

Your username and password should show up when you run these commands.

Once these environment variables are set, all functions that interface
and make requests against the LOINC API endpoints will use these
credentials to authenticate.

### Retrieve LOINC metadata

Metadata on all the versions of LOINC can be retrieved via:

``` r

roinc_get_metadata()
```

which results in a `tibble` that includes information on the LOINC
version, release date, number of LOINCs, and download URL sorted
starting from the most current LOINC version (as shown below):

``` R
#> # A tibble: 65 × 7
#>    version releaseDate         relmaVersion numberOfLoincs maxLoinc downloadUrl 
#>    <chr>   <chr>               <chr>                 <int> <chr>    <chr>       
#>  1 2.83    2026-08-19T00:00:00 7.16                 112405 115803-9 https://loi…
#>  2 2.82    2026-02-24T17:00:00 7.15                 109325 112587-1 https://loi…
#>  3 2.81    2025-08-12T00:00:00 7.14                 108248 111472-7 https://loi…
#>  4 2.80    2025-02-26T00:00:00 7.13                 104672 107378-2 https://loi…
#>  5 2.79    2025-02-18T00:00:00 7.12                 104584 107378-2 https://loi…
#>  6 2.78    2024-08-06T00:00:00 7.11                 104054 106413-8 https://loi…
#>  7 2.77    2024-02-27T00:00:00 7.10                 102465 104478-3 https://loi…
#>  8 2.76    2023-09-18T00:00:00 7.9                  101632 103542-7 https://loi…
#>  9 2.75    2023-08-15T00:00:00 7.8                  101632 103542-7 https://loi…
#> 10 2.74    2023-02-22T00:00:00 7.7                   99687 101582-5 https://loi…
#> # ℹ 55 more rows
#> # ℹ 1 more variable: downloadMD5Hash <chr>
```

If you would prefer to have the result in an unflattened list format as
produced by
[`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
set the argument `tabular = FALSE` as follows:

``` r

roinc_get_metadata(tabular = FALSE)
```

which gives (showing only first 2 elements of list):

``` R
#> [[1]]
#> [[1]]$version
#> [1] "2.83"
#> 
#> [[1]]$releaseDate
#> [1] "2026-08-19T00:00:00"
#> 
#> [[1]]$relmaVersion
#> [1] "7.16"
#> 
#> [[1]]$numberOfLoincs
#> [1] 112405
#> 
#> [[1]]$maxLoinc
#> [1] "115803-9"
#> 
#> [[1]]$downloadUrl
#> [1] "https://loinc.regenstrief.org/api/v1/Loinc/Download?version=2.83"
#> 
#> [[1]]$downloadMD5Hash
#> [1] "057ddf203164705d5a4c3604257060a4"
#> 
#> 
#> [[2]]
#> [[2]]$version
#> [1] "2.82"
#> 
#> [[2]]$releaseDate
#> [1] "2026-02-24T17:00:00"
#> 
#> [[2]]$relmaVersion
#> [1] "7.15"
#> 
#> [[2]]$numberOfLoincs
#> [1] 109325
#> 
#> [[2]]$maxLoinc
#> [1] "112587-1"
#> 
#> [[2]]$downloadUrl
#> [1] "https://loinc.regenstrief.org/api/v1/Loinc/Download?version=2.82"
#> 
#> [[2]]$downloadMD5Hash
#> [1] "1976936e2232d20cfcef8c9ac528c6f9"
```

If you would like to get the metadata of a specific LOINC version, for
example the latest version which is 2.83, set the argument
`version = "2.83"`:

``` r

roinc_get_metadata(version = "2.83")
```

and this will provide the following `tibble` output:

``` R
#> # A tibble: 1 × 7
#>   version releaseDate         relmaVersion numberOfLoincs maxLoinc downloadUrl  
#>   <chr>   <chr>               <chr>                 <int> <chr>    <chr>        
#> 1 2.83    2026-08-19T00:00:00 7.16                 112405 115803-9 https://loin…
#> # ℹ 1 more variable: downloadMD5Hash <chr>
```

### Download LOINC primary artifact

The LOINC primary release artifact can be downloaded. The
[`roinc_download()`](https://oxford-ihtm.io/roinc/reference/roinc_download.md)
functions allows for this download to be done programmatically as shown
below:

``` r

roinc_download()
#> [1] "loinc_latest.zip"
```

The result is the file path to the downloaded release artifact in zip
format. The download is saved in the current working directory by
default and the file is always named with the label `loinc_` followed by
the label for the version. By default, the latest version is downloaded
hence the full file path of the downloaded artifact is
`loinc_latest.zip`.

We can check that the download has indeed been stored by checking the
existence of the specific file in the current directory:

``` r

file.exists("loinc_latest.zip")
#> [1] TRUE
```

If you want to download a specific version of the LOINC primary release
artifact into a different directory, you can specify the `version` and
the `directory` arguments. In the following example, LOINC version 2.80
will be downloaded in a temporary directory:

``` r

roinc_download(version = "2.80", directory = tempdir())
#> [1] "/tmp/RtmpC3GXOQ/loinc_2.80.zip"
```

We then check whether version 2.80 has indeed been downloaded in the
temporary directory:

``` r

file.exists(file.path(tempdir(), "loinc_2.80.zip"))
#> [1] TRUE
```

## Citation

If you use the [roinc](https://oxford-ihtm.io/roinc/) package in your
work, please cite using the suggested citation provided by a call to the
`citation` function as follows:

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

  
  

[![This is a project under the Oxford iHealth initiative of the MSc in
International Health and Tropical Medicine of the Nuffield Department of
Medicine, University of
Oxford](https://github.com/OxfordIHTM/ihealth-images/blob/main/ihealth/ihealth_footer.png?raw=true)](https://oxford-ihtm.io)
