# R analysis pipeline

These scripts are a fully anonymized description of a restricted-data workflow. They use generic variables and require authorized inputs; no original field names, results, locations, or study identifiers are included.

1. `01_cohort_audit.R` — eligibility filters, deduplication, and integrity checks
2. `02_screening_outcomes.R` — generic outcome construction and exact intervals
3. `03_regression_models.R` — adjusted logistic-regression workflow
4. `04_visualization.R` — restricted output generation
