# About LOINC and getting started with {roinc}

## About LOINC

[Logical Observation Identifiers Names and Codes](https://loinc.org) or
[LOINC](https://loinc.org) is a global standard providing universal
codes for laboratory and clinical results. It enables interoperability
between diverse health systems by ensuring data can be pooled and
understood.

LOINC provides standardised, universal names and codes that support the
exchange of orders and clinical observations across information systems
using established syntax standards, including
[HL7](https://hl7.org/fhir/), [CEN
TC251](https://www.ehealth-standards.eu/centc251/), [ISO
TC215](https://www.iso.org/committee/54960.html),
\[ASTM(<https://www.astm.org/>)\], and
[DICOM](https://www.dicomstandard.org/). These identifiers can serve as
coded representations of observations within any interoperability
standard that follows the observation–value model, including messaging
formats, electronic documents, and application programming interfaces
(APIs).

For example, LOINC codes are widely used in the Observation Identifier
field (OBX-3) of the OBX segment within HL7 Observation Result (ORU)
messages, including HL7 version 2.x and ASTM 1238-9410 messages. This
enables standardized identification of laboratory observations when
information is exchanged between systems such as Clinical Laboratory
Information Management Systems (LIMS) and Electronic Health Record (EHR)
systems. By providing consistent identifiers for clinical concepts,
LOINC facilitates the reliable exchange and interpretation of clinical
data across heterogeneous information systems.

LOINC’s database of codes can be accessed in different ways including
accessing the content programmatically via application programming
interfaces (APIs) to download the entire LOINC database of codes, search
the entire LOINC database, and the LOINC terminology service powered by
HL7 FHIR.

## The {roinc} package

The [roinc](https://oxford-ihtm.io/roinc/) package has been developed to
primarily interface with these LOINC API endpoints.

The name of the package is a play between two ideas. First is that of a
common approach by package developers of adding an *r* to a regular word
that one is considering for a package name to make a link to this being
an R package. Second is the concept of *lallation* which is a context in
which someone has difficulty in enunciation such that when *l* is
pronounced it sounds like an *r* or when *r* is pronounced is sounds
like an *l*[^1]. So, we see the spelling of the package as *roinc* with
an *r* but our recommended pronunciation is *loinc* which is the name of
the standard of which it’s API is what this package is interfacing with.

### What does the package do?

Currently, the package provides functions for all the LOINC API
endpoints. These functions support:

- interfacing with the [LOINC download API
  endpoints](https://loinc.org/kb/api/download);

- interfacing with the [LOINC search API
  endpoints](https://loinc.org/kb/api/search-api); and,

- interfacing with the [LOINC FHIR terminology service API
  endpoints](https://loinc.org/fhir).

### Installation

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

### Usage

#### Authentication

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

#### Retrieve LOINC metadata

Metadata on all the versions of LOINC can be retrieved via:

``` r

roinc_get_metadata()
```

which results in a `tibble` that includes information on the LOINC
version, release date, number of LOINCs, and download URL sorted
starting from the most current LOINC version (as shown below):

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

If you would prefer to have the result in an unflattened list format as
produced by
[`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
set the argument `tabular = FALSE` as follows:

``` r

roinc_get_metadata(tabular = FALSE)
```

which gives (showing only first 2 elements of list):

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

If you would like to get the metadata of a specific LOINC version, for
example the latest version which is 2.83, set the argument
`version = "2.83"`:

``` r

roinc_get_metadata(version = "2.83")
```

and this will provide the following `tibble` output:

    #> # A tibble: 1 × 7
    #>   version releaseDate         relmaVersion numberOfLoincs maxLoinc downloadUrl  
    #>   <chr>   <chr>               <chr>                 <int> <chr>    <chr>        
    #> 1 2.83    2026-08-19T00:00:00 7.16                 112405 115803-9 https://loin…
    #> # ℹ 1 more variable: downloadMD5Hash <chr>

#### Download LOINC primary artifact

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
#> [1] "/tmp/RtmpSCyGoH/loinc_2.80.zip"
```

We can check whether version 2.80 has indeed been downloaded in the
temporary directory:

``` r

file.exists(file.path(tempdir(), "loinc_2.80.zip"))
#> [1] TRUE
```

#### Search LOINC database

You can search the extensive LOINC database using the `roinc_search_*()`
set of functions. Each of these functions searches within a specific
scope of the LOINC database. These scopes can either be the *LOINCs*,
the *LOINC answer lists*, the *LOINC parts*, or the *LOINC groups*. For
example, if you want to look up *glucose* from the LOINCs search, that
can be done as follows:

``` r

roinc_search_loincs(query = "glucose")
```

which gives the following `tibble` of search results:

``` r

roinc_search_loincs("glucose")
#> # A tibble: 50 × 47
#>    LOINC_NUM COMPONENT     PROPERTY TIME_ASPCT SYSTEM SCALE_TYP METHOD_TYP CLASS
#>    <chr>     <chr>         <chr>    <chr>      <chr>  <chr>     <chr>      <chr>
#>  1 97510-2   Glucose meas… NFr      RptPeriod  Inter… Qn        Calculated CHEM 
#>  2 2352-3    Glucose CSF/… RelMCnc  Pt         Plas+… Qn        NA         CHEM 
#>  3 25670-1   Glucose^30M … MCnc     Pt         Urine  Qn        NA         CHAL 
#>  4 25675-0   Glucose^4H p… MCnc     Pt         Urine  Qn        NA         CHAL 
#>  5 26545-4   Glucose^6H p… MCnc     Pt         Urine  Qn        NA         CHAL 
#>  6 26540-5   Glucose^3H p… MCnc     Pt         Urine  Qn        NA         CHAL 
#>  7 26542-1   Glucose^5H p… MCnc     Pt         Urine  Qn        NA         CHAL 
#>  8 18296-4   Glucose^post… Imp      Pt         Ser/P… Nom       NA         CHAL 
#>  9 47622-6   Glucose^pre … SCnc     Pt         Ser/P… Qn        NA         CHAL 
#> 10 108027-4  Glucose       {Measur… -          Urine  -         NA         LABO…
#> # ℹ 40 more rows
#> # ℹ 39 more variables: VersionLastChanged <chr>, CHNG_TYPE <chr>,
#> #   DefinitionDescription <chr>, STATUS <chr>, CLASSTYPE <int>, FORMULA <lgl>,
#> #   ExampleAnswers <chr>, SURVEY_QUEST_TEXT <chr>, SURVEY_QUEST_SRC <lgl>,
#> #   UNITSREQUIRED <chr>, RELATEDNAMES2 <chr>, SHORTNAME <chr>, ORDER_OBS <chr>,
#> #   HL7_FIELD_SUBFIELD_ID <lgl>, EXTERNAL_COPYRIGHT_NOTICE <lgl>,
#> #   EXAMPLE_UNITS <chr>, LONG_COMMON_NAME <chr>, EXAMPLE_UCUM_UNITS <chr>, …
```

By default,
[`roinc_search_loincs()`](https://oxford-ihtm.io/roinc/reference/roinc_search.md)
(and the other `roinc_search_*()` functions) returns a `tibble` of the
first 50 rows of the search results with 47 variables/fields. These
results can be customised by specifying the arguments for the *number of
rows to return*, the *page of results to return*, the *variable/field to
sort the results on*, and the *language for the returned results*.

#### LOINC terminology services

The LOINC database can be accessed through a terminology service defined
by [HL7’s FHIR](https://hl7.org/fhir/) standard. The API offers
endpoints for three FHIR resources: *code system*, *value set*, and
*concept map*. It also has a set of endpoints for *questionnaire*
resources to LOINC’s wealth of standard assessments and survey content
including all child concepts (i.e. questions) and answer lists of a
given assessment.

##### Code system

To get properties available for LOINC as a CodeSystem, use the following
command:

``` r

roinc_codesystem()
```

which returns:

    #> # A tibble: 15 × 7
    #>    resourceType id             meta$meta type  total link$relation entry$fullUrl
    #>    <chr>        <chr>          <chr>     <chr> <int> <chr>         <chr>        
    #>  1 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #>  2 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #>  3 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #>  4 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #>  5 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #>  6 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #>  7 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #>  8 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #>  9 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #> 10 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #> 11 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #> 12 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #> 13 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #> 14 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #> 15 Bundle       0bde809e-fbe5… 2026-09-… sear…    15 self          https://fhir…
    #> # ℹ 27 more variables: link$url <chr>, entry$resourceType <chr>, $id <chr>,
    #> #   $versionId <chr>, $lastUpdated <chr>, $system <chr>, $code <chr>,
    #> #   $url <chr>, $identifier <list>, $version <chr>, $name <chr>, $title <chr>,
    #> #   $status <chr>, $experimental <lgl>, $date <chr>, $publisher <chr>,
    #> #   $contact <list>, $description <chr>, $copyright <chr>,
    #> #   $caseSensitive <lgl>, $valueSet <chr>, $hierarchyMeaning <chr>,
    #> #   $compositional <lgl>, $versionNeeded <lgl>, $content <chr>, $count <int>, …

To get information on an individual LOINC term, Part, Answer List, or
Answer string, use
[`roinc_codesystem_lookup()`](https://oxford-ihtm.io/roinc/reference/roinc_codesystem.md).
For example, using the code `4544-3` for hematocrit:

``` r

roinc_codesystem_lookup(code = "4544-3")
```

which returns an unflattened list format as produced by
[`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).

To get a specific piece of information, specify the argument for
`property` using any of the different variables/fields available from
the system. For example, for the code `4544-3` for hematocrit and
retrieving information on which version of LOINC this was first
released:

``` r

roinc_codesystem_lookup(code = "4544-3", property = "VersionFirstReleased")
#> $resourceType
#> [1] "Parameters"
#> 
#> $parameter
#> $parameter[[1]]
#> $parameter[[1]]$name
#> [1] "code"
#> 
#> $parameter[[1]]$valueCode
#> [1] "4544-3"
#> 
#> 
#> $parameter[[2]]
#> $parameter[[2]]$name
#> [1] "system"
#> 
#> $parameter[[2]]$valueString
#> [1] "http://loinc.org"
#> 
#> 
#> $parameter[[3]]
#> $parameter[[3]]$name
#> [1] "name"
#> 
#> $parameter[[3]]$valueString
#> [1] "LOINC"
#> 
#> 
#> $parameter[[4]]
#> $parameter[[4]]$name
#> [1] "version"
#> 
#> $parameter[[4]]$valueString
#> [1] "2.83"
#> 
#> 
#> $parameter[[5]]
#> $parameter[[5]]$name
#> [1] "display"
#> 
#> $parameter[[5]]$valueString
#> [1] "Hematocrit [Volume Fraction] of Blood by Automated count"
#> 
#> 
#> $parameter[[6]]
#> $parameter[[6]]$name
#> [1] "status"
#> 
#> $parameter[[6]]$valueCode
#> [1] "active"
#> 
#> 
#> $parameter[[7]]
#> $parameter[[7]]$name
#> [1] "property"
#> 
#> $parameter[[7]]$part
#> $parameter[[7]]$part[[1]]
#> $parameter[[7]]$part[[1]]$name
#> [1] "code"
#> 
#> $parameter[[7]]$part[[1]]$valueCode
#> [1] "VersionFirstReleased"
#> 
#> 
#> $parameter[[7]]$part[[2]]
#> $parameter[[7]]$part[[2]]$name
#> [1] "value"
#> 
#> $parameter[[7]]$part[[2]]$valueString
#> [1] "1.0"
```

##### Value sets

FHIR’s *ValueSet* resource specifies a set of codes drawn from one or
more code systems. In LOINC’s case, three main types of value sets are
defined:

- Broadly useful collections of LOINC terms
- Answer Lists, e.g. LL4700-2
- LOINC Groups, e.g. LG32763-1

To return a value set definition,
[`roinc_valueset()`](https://oxford-ihtm.io/roinc/reference/roinc_valueset.md)
can be used. For example, to get the value set definition for answer
list *LL1162-8*:

``` r

roinc_valueset(valueset = "LL1162-8")
```

which returns

    #> $resourceType
    #> [1] "Bundle"
    #> 
    #> $id
    #> [1] "5f1e2204-d8c0-48a2-8775-8faa5fda5223"
    #> 
    #> $meta
    #> $meta$lastUpdated
    #> [1] "2026-09-18T13:49:32.959+00:00"
    #> 
    #> 
    #> $type
    #> [1] "searchset"
    #> 
    #> $total
    #> [1] 1
    #> 
    #> $link
    #> $link[[1]]
    #> $link[[1]]$relation
    #> [1] "self"
    #> 
    #> $link[[1]]$url
    #> [1] "https://fhir.loinc.org/ValueSet/?url=http://loinc.org/vs/LL1162-8"
    #> 
    #> 
    #> 
    #> $entry
    #> $entry[[1]]
    #> $entry[[1]]$fullUrl
    #> [1] "https://fhir.loinc.org/ValueSet/bee38a9a-595c-4904-861a-84ce8034369f"
    #> 
    #> $entry[[1]]$resource
    #> $entry[[1]]$resource$resourceType
    #> [1] "ValueSet"
    #> 
    #> $entry[[1]]$resource$id
    #> [1] "bee38a9a-595c-4904-861a-84ce8034369f"
    #> 
    #> $entry[[1]]$resource$meta
    #> $entry[[1]]$resource$meta$versionId
    #> [1] "1"
    #> 
    #> $entry[[1]]$resource$meta$lastUpdated
    #> [1] "2026-08-19T00:00:00+00:00"
    #> 
    #> $entry[[1]]$resource$meta$tag
    #> $entry[[1]]$resource$meta$tag[[1]]
    #> $entry[[1]]$resource$meta$tag[[1]]$system
    #> [1] "originalId"
    #> 
    #> $entry[[1]]$resource$meta$tag[[1]]$code
    #> [1] "7e4ee1c6-a158-4654-937a-e3205327786e"
    #> 
    #> 
    #> 
    #> 
    #> $entry[[1]]$resource$url
    #> [1] "http://loinc.org/vs/LL1162-8"
    #> 
    #> $entry[[1]]$resource$identifier
    #> $entry[[1]]$resource$identifier[[1]]
    #> $entry[[1]]$resource$identifier[[1]]$system
    #> [1] "urn:ietf:rfc:3986"
    #> 
    #> $entry[[1]]$resource$identifier[[1]]$value
    #> [1] "urn:oid:1.3.6.1.4.1.12009.10.1.333"
    #> 
    #> 
    #> 
    #> $entry[[1]]$resource$version
    #> [1] "2.83"
    #> 
    #> $entry[[1]]$resource$name
    #> [1] "Quantity (5 answers, ord)"
    #> 
    #> $entry[[1]]$resource$status
    #> [1] "active"
    #> 
    #> $entry[[1]]$resource$publisher
    #> [1] "Regenstrief Institute, Inc."
    #> 
    #> $entry[[1]]$resource$contact
    #> $entry[[1]]$resource$contact[[1]]
    #> $entry[[1]]$resource$contact[[1]]$name
    #> [1] "Regenstrief Institute, Inc."
    #> 
    #> $entry[[1]]$resource$contact[[1]]$telecom
    #> $entry[[1]]$resource$contact[[1]]$telecom[[1]]
    #> $entry[[1]]$resource$contact[[1]]$telecom[[1]]$system
    #> [1] "url"
    #> 
    #> $entry[[1]]$resource$contact[[1]]$telecom[[1]]$value
    #> [1] "http://loinc.org"
    #> 
    #> 
    #> 
    #> 
    #> 
    #> $entry[[1]]$resource$copyright
    #> [1] "This material contains content from LOINC (http://loinc.org). LOINC is copyright Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc."

To get the list of terms in a value set, specify the argument
`expand = TRUE` as follows:

``` r

roinc_valueset(valueset = "LL1162-8", expand = TRUE)
```

which returns

    #> $resourceType
    #> [1] "ValueSet"
    #> 
    #> $id
    #> [1] "bee38a9a-595c-4904-861a-84ce8034369f"
    #> 
    #> $url
    #> [1] "http://loinc.org/vs/LL1162-8"
    #> 
    #> $identifier
    #> $identifier[[1]]
    #> $identifier[[1]]$system
    #> [1] "urn:ietf:rfc:3986"
    #> 
    #> $identifier[[1]]$value
    #> [1] "urn:oid:1.3.6.1.4.1.12009.10.1.333"
    #> 
    #> 
    #> 
    #> $version
    #> [1] "2.83"
    #> 
    #> $name
    #> [1] "Quantity (5 answers, ord)"
    #> 
    #> $status
    #> [1] "active"
    #> 
    #> $publisher
    #> [1] "Regenstrief Institute, Inc."
    #> 
    #> $contact
    #> $contact[[1]]
    #> $contact[[1]]$name
    #> [1] "Regenstrief Institute, Inc."
    #> 
    #> $contact[[1]]$telecom
    #> $contact[[1]]$telecom[[1]]
    #> $contact[[1]]$telecom[[1]]$system
    #> [1] "url"
    #> 
    #> $contact[[1]]$telecom[[1]]$value
    #> [1] "http://loinc.org"
    #> 
    #> 
    #> 
    #> 
    #> 
    #> $copyright
    #> [1] "This material contains content from LOINC (http://loinc.org). LOINC is copyright Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc."
    #> 
    #> $compose
    #> $compose$include
    #> $compose$include[[1]]
    #> $compose$include[[1]]$system
    #> [1] "http://loinc.org"
    #> 
    #> $compose$include[[1]]$concept
    #> $compose$include[[1]]$concept[[1]]
    #> $compose$include[[1]]$concept[[1]]$code
    #> [1] "LA137-2"
    #> 
    #> $compose$include[[1]]$concept[[1]]$display
    #> [1] "None"
    #> 
    #> 
    #> $compose$include[[1]]$concept[[2]]
    #> $compose$include[[1]]$concept[[2]]$code
    #> [1] "LA15679-6"
    #> 
    #> $compose$include[[1]]$concept[[2]]$display
    #> [1] "Rare"
    #> 
    #> 
    #> $compose$include[[1]]$concept[[3]]
    #> $compose$include[[1]]$concept[[3]]$code
    #> [1] "LA15680-4"
    #> 
    #> $compose$include[[1]]$concept[[3]]$display
    #> [1] "Few"
    #> 
    #> 
    #> $compose$include[[1]]$concept[[4]]
    #> $compose$include[[1]]$concept[[4]]$code
    #> [1] "LA15681-2"
    #> 
    #> $compose$include[[1]]$concept[[4]]$display
    #> [1] "Many"
    #> 
    #> 
    #> $compose$include[[1]]$concept[[5]]
    #> $compose$include[[1]]$concept[[5]]$code
    #> [1] "LA6751-7"
    #> 
    #> $compose$include[[1]]$concept[[5]]$display
    #> [1] "Moderate"
    #> 
    #> 
    #> 
    #> 
    #> 
    #> 
    #> $expansion
    #> $expansion$id
    #> [1] "fa4a748e-834b-4d8e-b2a2-a6082e296c20"
    #> 
    #> $expansion$identifier
    #> [1] "74680424-a6cc-46e4-852f-6342031c6d7f"
    #> 
    #> $expansion$timestamp
    #> [1] "2026-09-18T13:49:33+00:00"
    #> 
    #> $expansion$total
    #> [1] 5
    #> 
    #> $expansion$offset
    #> [1] 0
    #> 
    #> $expansion$parameter
    #> $expansion$parameter[[1]]
    #> $expansion$parameter[[1]]$name
    #> [1] "offset"
    #> 
    #> $expansion$parameter[[1]]$valueInteger
    #> [1] 0
    #> 
    #> 
    #> $expansion$parameter[[2]]
    #> $expansion$parameter[[2]]$name
    #> [1] "count"
    #> 
    #> $expansion$parameter[[2]]$valueInteger
    #> [1] 100
    #> 
    #> 
    #> 
    #> $expansion$contains
    #> $expansion$contains[[1]]
    #> $expansion$contains[[1]]$system
    #> [1] "http://loinc.org"
    #> 
    #> $expansion$contains[[1]]$code
    #> [1] "LA137-2"
    #> 
    #> $expansion$contains[[1]]$display
    #> [1] "None"
    #> 
    #> 
    #> $expansion$contains[[2]]
    #> $expansion$contains[[2]]$system
    #> [1] "http://loinc.org"
    #> 
    #> $expansion$contains[[2]]$code
    #> [1] "LA15679-6"
    #> 
    #> $expansion$contains[[2]]$display
    #> [1] "Rare"
    #> 
    #> 
    #> $expansion$contains[[3]]
    #> $expansion$contains[[3]]$system
    #> [1] "http://loinc.org"
    #> 
    #> $expansion$contains[[3]]$code
    #> [1] "LA15680-4"
    #> 
    #> $expansion$contains[[3]]$display
    #> [1] "Few"
    #> 
    #> 
    #> $expansion$contains[[4]]
    #> $expansion$contains[[4]]$system
    #> [1] "http://loinc.org"
    #> 
    #> $expansion$contains[[4]]$code
    #> [1] "LA15681-2"
    #> 
    #> $expansion$contains[[4]]$display
    #> [1] "Many"
    #> 
    #> 
    #> $expansion$contains[[5]]
    #> $expansion$contains[[5]]$system
    #> [1] "http://loinc.org"
    #> 
    #> $expansion$contains[[5]]$code
    #> [1] "LA6751-7"
    #> 
    #> $expansion$contains[[5]]$display
    #> [1] "Moderate"

To determine if a term is in a given ValueSet,
[`roinc_valueset_validate()`](https://oxford-ihtm.io/roinc/reference/roinc_valueset.md)
can be used. For example, to determine if the LOINC term `8867-4` is in
the LOINC group `LG33055-1`:

``` r

roinc_valueset_validate(valueset = "LG33055-1", code = "8867-4")
```

which returns:

    #> $resourceType
    #> [1] "Parameters"
    #> 
    #> $parameter
    #> $parameter[[1]]
    #> $parameter[[1]]$name
    #> [1] "result"
    #> 
    #> $parameter[[1]]$valueBoolean
    #> [1] TRUE
    #> 
    #> 
    #> $parameter[[2]]
    #> $parameter[[2]]$name
    #> [1] "display"
    #> 
    #> $parameter[[2]]$valueString
    #> [1] "Heart rate"

In the result, the `valueBoolean` returns a value `TRUE` which means
that the term is included in the specified value set.

[^1]: A condition that the author of the package suffered from at their
    young formative years.
