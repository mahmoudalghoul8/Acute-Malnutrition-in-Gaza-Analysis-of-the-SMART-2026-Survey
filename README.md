# Acute Malnutrition in Gaza — Analysis of the SMART 2026 Survey

## Overview
A healthcare and humanitarian data analytics project that transforms the published
Gaza SMART Survey 2026 report into a structured, transparent, and
decision-oriented analysis of acute malnutrition, chronic malnutrition, and
childhood morbidity across the Gaza Strip.

**Project type:** Healthcare & Humanitarian Data Analytics
**Geographic focus:** Gaza Strip, Palestine
**Primary source:** Gaza SMART Survey 2026 (published aggregate estimates)

## Problem Statement
Can published humanitarian health statistics be organized into a rigorous
analytical structure that supports evidence-informed decisions — while handling
statistical uncertainty, geographic comparisons, and data-quality issues
correctly?

## Data
| Metric | Value |
|:---|:---|
| Source | Gaza SMART Survey 2026 report |
| Survey period | 31 May – 15 June 2026 |
| Indicators | 28+ indicators across 9 categories |
| Domains | Gaza & North Gaza, Deir Al-Balah, Khan Younis/Rafah, Gaza Strip (weighted) |
| Coverage | 98 of 150 planned clusters; ~83% of the population (17% excluded due to access constraints) |
| Privacy | Published aggregate estimates with confidence intervals — no personal data |

### Dataset Structure
| Column | Description |
|:---|:---|
| indicator_id | Short unique identifier |
| indicator_name | Full indicator name |
| category | Health/nutrition category |
| age_group | Age group covered |
| domain | Geographic area |
| estimate_pct / ci_low / ci_high | Prevalence estimate and 95% confidence limits |
| ci_width / relative_precision / precision_flag | Survey precision measures |
| who_severity | WHO severity classification |
| highest_domain / lowest_domain | Best/worst performing area per indicator |

## Repository Structure
```
gaza-smart-survey-2026-analysis/
├── data/
│   └── smart_2026_indicators.csv      # structured analytical dataset
├── sql/
│   └── analysis_queries.sql           # indicator comparison & geographic analysis
├── dashboard/
│   ├── 01_child_health_overview.png
│   ├── 02_malnutrition_analysis.png
│   └── 03_morbidity_analysis.png
├── reports/
│   └── SMART_2026_Analysis_Report.pdf
└── README.md
```

## Methodology
1. **Excel** — extracted and structured published estimates into a consistent
   analytical dataset; built internal-consistency checks (CI width,
   weighted-within-range validation).
2. **SQL** — indicator retrieval, category summaries, geographic pivot
   comparisons (best/worst domain), WHO-severity filtering, and survey-precision
   ranking.
3. **Power BI** — three interactive dashboards: Child Health Overview,
   Malnutrition Analysis, Morbidity Analysis.

## Key Findings

### Headline Indicators (Gaza Strip, weighted)
| Indicator | Estimate | WHO Classification |
|:---|:---|:---|
| Combined GAM (cGAM) | 1.3% | Acceptable (<5%) |
| Stunting | 12.2% | Serious (10–20%) |
| Diarrhoea prevalence (2 weeks) | 37.1% | Emergency level (≥20%) |
| Minimum Acceptable Diet | 22.4% | Critical (<25%) |
| Vitamin A supplementation | 71.0% | Fair (60–80%) |

### Analytical Conclusions
- **Acute vs. chronic gap:** the stunting-to-cGAM ratio ranges from 6.3× to
  15.7× across domains — cumulative nutritional harm is an order of magnitude
  larger than what a single point-in-time survey shows.
- **A measurable access–outcome link:** acute malnutrition stayed contained
  where humanitarian aid reached displaced populations (Deir Al-Balah,
  Khan Younis/Rafah) and worsened where access was restricted
  (Gaza & North Gaza) — the same crisis, two outcomes, driven by access.
- **Treatment gap:** of children with diarrhoea, only 25.6% received ORS,
  18.9% received zinc, and 12.3% received both — compounding the disease burden.
- **Feeding cascade:** 96.5% ever-breastfed, but only 20.4% exclusively
  breastfed under 6 months — the bottleneck is conditions, not knowledge.

## Data Quality Issues Identified & Resolved
Two issues were caught through internal-consistency checks before analysis:
1. **Mislabeled indicator:** values recorded as "Minimum Dietary Diversity" were
   mathematically impossible (weighted total outside the domain range). Traced
   back to the source — they belonged to "Egg and/or flesh food consumption."
   Corrected with verified values from the report.
2. **Directional logic error:** an automated best/worst-domain SQL query applied
   a single "higher = worse" rule across all indicators, inverting protective
   indicators (e.g., Minimum Acceptable Diet). Fixed by explicitly coding each
   indicator as risk-type or protective-type before comparison.

## Limitations
- Based on published aggregate estimates — no child-level data, so weighted
  prevalence could not be independently recalculated.
- 17% of the population was outside the sampling frame; findings represent the
  accessible population only.
- Domain-level SAM estimates carry very wide confidence intervals; used
  descriptively, not for ranking.
- Single cross-sectional survey (31 May – 15 June 2026); not a time series.

## Recommendations
1. Use the access–outcome evidence to advocate for sustained humanitarian
   access to Gaza & North Gaza specifically.
2. Never report GAM alone — always pair with stunting (12.2%) and the
   stunting-to-cGAM ratio.
3. Treat the 17% excluded population as the highest-risk group in response
   planning, not as a footnote.
4. Close the diarrhoea treatment gap (ORS+zinc at 12.3%) and investigate the
   Vitamin A coverage outlier in Deir Al-Balah (46.9%).

## Tools
Microsoft Excel (data preparation & validation) | SQL (analysis queries) | Power BI (dashboards)

## Author
**Mahmoud Aref Algoul** — Data Analyst
[LinkedIn](https://www.linkedin.com/in/mahmoud-algoul-0306b2249/) | [GitHub](https://github.com/YOUR-USERNAME)
