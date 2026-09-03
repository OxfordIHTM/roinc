# Get LOINC linguistic variants ------------------------------------------------

linguistic_variants <- read.csv("data-raw/LinguisticVariants.csv")

usethis::use_data(linguistic_variants, overwrite = TRUE, compress = "xz")
