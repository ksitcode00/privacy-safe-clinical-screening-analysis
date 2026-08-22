# Package manifest for the authorized internal environment.
required_packages <- c("dplyr", "readxl", "ggplot2", "broom", "forcats", "tibble", "tidyr", "scales")

missing_packages <- required_packages[!vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_packages) > 0) {
  stop("Install required packages: ", paste(missing_packages, collapse = ", "))
}

invisible(lapply(required_packages, library, character.only = TRUE))
