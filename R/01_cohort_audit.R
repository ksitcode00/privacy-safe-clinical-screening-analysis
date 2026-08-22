# Construct a study-defined analytic cohort from authorized inputs.
source("R/00_packages.R")

input_path <- "data/private/restricted_screening_data.xlsx"
study_data <- readxl::read_excel(input_path)

eligible_settings <- c("setting_a", "setting_b")

analytic_cohort <- study_data |>
  dplyr::filter(screening_setting %in% eligible_settings) |>
  dplyr::distinct(record_id, .keep_all = TRUE) |>
  dplyr::mutate(
    age_years = suppressWarnings(as.numeric(sub("\\+$", "", age))),
    age_group = dplyr::case_when(
      dplyr::between(age_years, 18, 39) ~ "18–39",
      dplyr::between(age_years, 40, 64) ~ "40–64",
      age_years >= 65 ~ "65+",
      TRUE ~ NA_character_
    )
  )

stopifnot(!anyDuplicated(analytic_cohort$record_id))
