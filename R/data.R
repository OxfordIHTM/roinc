#'
#' List of the LOINC Linguistic Variants that are available and their producers
#' (translators).
#' 
#' LOINC Linguistic Variants are provided by an international community of
#' volunteer translators.
#'
#' @format A tibble with 5 fields
#'
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | *ID* | The unique identifier for a particular language variant within the LOINC database. This identifier does not have any meaning outside of LOINC. |
#' | *ISO_LANGUAGE* | The ISO language code |
#' | *ISO_COUNTRY* | The ISO-2C country code |
#' | *LANGUAGE_NAME* | A combination of the name of the language and the country in which that variant is used |
#' | *PRODUCER* | The person or organisation that provided the translation |
#'
#' @examples
#' linguistic_variants
#'
#'
"linguistic_variants"
