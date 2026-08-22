# Model adjusted associations among eligible complete cases.
source("R/02_screening_outcomes.R")

model_data <- screening_outcomes |>
  dplyr::filter(exam_positive) |>
  dplyr::transmute(
    previously_unreported,
    age_group = factor(age_group),
    sex = factor(sex),
    demographic_group = factor(demographic_group),
    coverage_status = factor(coverage_status),
    area_context_quartile = factor(area_context_quartile)
  ) |>
  tidyr::drop_na()

fit <- stats::glm(
  previously_unreported ~ age_group + sex + demographic_group + coverage_status + area_context_quartile,
  data = model_data,
  family = stats::binomial()
)

odds_ratios <- broom::tidy(fit, conf.int = TRUE, exponentiate = TRUE)
