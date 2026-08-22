# Reproducibility

The public repository is intentionally non-executable without authorized private inputs. The pipeline is documented as:

```text
01_cohort_audit → 02_screening_outcomes → 03_regression_models → 04_visualization
```

Use R 4.x and install the packages listed in `R/00_packages.R` when working in an authorized environment. Keep inputs in `data/private/` and outputs in `results/private/`. Neither directory is tracked.

No environment lock file is committed because this repository does not package or reproduce the original restricted project environment.
