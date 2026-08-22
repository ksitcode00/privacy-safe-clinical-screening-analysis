# Construct generic screening and reported-history outcomes.
source("R/01_cohort_audit.R")

any_true <- function(...) Reduce(`|`, list(...))

screening_outcomes <- analytic_cohort |>
  dplyr::mutate(
    exam_positive = any_true(exam_indicator_a, exam_indicator_b, exam_indicator_c),
    history_positive = any_true(history_indicator_a, history_indicator_b, history_indicator_c),
    previously_unreported = exam_positive & !history_positive
  )

exact_prevalence <- function(data, outcome) {
  events <- sum(data[[outcome]], na.rm = TRUE)
  total <- sum(!is.na(data[[outcome]]))
  interval <- stats::binom.test(events, total)$conf.int
  tibble::tibble(events, total, proportion = events / total,
                 ci_low = interval[[1]], ci_high = interval[[2]])
}
