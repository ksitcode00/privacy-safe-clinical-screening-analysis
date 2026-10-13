# Visual guide

These illustrations explain the generalized public R workflow. They are not charts of study results, synthetic patient records, or a depiction of the final specification of a named study. No counts, effect estimates, locations, organizations, or restricted findings are shown.

## Cover: from records to evidence

[View the cover](../figures/clinical-screening-cover.svg).

Examination findings and reported history are reconciled into outcomes. The cover highlights three analytical responsibilities: cohort and denominator auditing, explicit outcome definitions, and adjusted modeling with uncertainty.

## Outcome definition

[View the comparison diagram](../figures/screening-outcome-definition.svg).

| Examination status | History reported | No history reported |
| --- | --- | --- |
| Positive | Exam positive with history reported | Previously unreported: exam positive with no history reported |
| Negative | Exam negative with history reported | Exam negative with no history reported |

The matrix represents categories; cell areas do not encode frequencies. Unknown or missing fields require separate auditing and must not automatically be interpreted as negative responses.

Two descriptive quantities need separate denominators:

- **Examination-positive proportion:** positive examinations divided by eligible records with a known examination outcome.
- **Previously-unreported proportion:** previously-unreported outcomes divided by exam-positive records with known reported-history status.

Reported-history discordance is a constructed analytic outcome. It is not proof of a missed diagnosis or clinical error.

## Analysis workflow

[View the analysis diagram](../figures/screening-analysis-workflow.svg).

Audit eligibility, remove duplicate records, and check missing fields. Then distinguish the descriptive and modeling populations:

- **Descriptive analysis:** reconcile events and eligible denominators; estimate proportions with exact binomial confidence intervals.
- **Adjusted modeling:** select eligible exam-positive complete cases; fit logistic regression; review diagnostics and odds ratios with confidence intervals.

Selection can change the sample across these branches. Adjusted observational associations do not establish causation.

The public repository demonstrates methods and code. Restricted records, counts, and model estimates remain outside the repository, as specified in the [privacy note](data_privacy.md).

## Design and format

The marine-blue and petrol palette gives the figures a consistent clinical-research identity. Sentence-case typography and left alignment support quick review. A single highlighted matrix cell identifies the constructed outcome; connectors indicate workflow dependencies.

SVG originals remain sharp when enlarged and include accessible titles and descriptions. The README supplies text explanations alongside them. The figures contain no scripts, remote fonts, external images, or embedded study data.
