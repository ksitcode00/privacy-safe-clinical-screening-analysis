# Generate restricted internal figures; no outputs are committed publicly.
source("R/03_regression_models.R")

dir.create("results/private", recursive = TRUE, showWarnings = FALSE)

summary_by_age <- screening_outcomes |>
  dplyr::filter(!is.na(age_group)) |>
  dplyr::group_by(age_group) |>
  dplyr::summarise(
    examined = dplyr::n(),
    exam_positive_n = sum(exam_positive),
    prevalence = exam_positive_n / examined,
    .groups = "drop"
  )

ggplot2::ggplot(summary_by_age, ggplot2::aes(age_group, prevalence)) +
  ggplot2::geom_col(fill = "#355F83") +
  ggplot2::scale_y_continuous(labels = scales::percent) +
  ggplot2::labs(x = "Age group", y = "Screening-positive prevalence") +
  ggplot2::theme_minimal(base_size = 12)
