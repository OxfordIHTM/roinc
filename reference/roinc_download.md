# Download LOINC's primary release artifact

Download LOINC's primary release artifact

## Usage

``` r
roinc_download(version = NULL, directory = NULL)
```

## Arguments

- version:

  A string value for LOINC version identifier to specify which versions
  of concepts in LOINC to retrieve.

- directory:

  Directory path to save the LOINC primary release artifact download to.
  Default is to save in the current working directory.

## Value

The file path to the downloaded LOINC primary release artifact.

## Examples

``` r
if (FALSE) { # \dontrun{
roinc_download()
} # }
```
