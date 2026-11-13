# Digital Wallet KYC Funnel & Retention Analytics

A portfolio project that analyses a digital wallet's customer journey:
sign-up -> KYC started -> KYC approved -> first successful transaction -> repeat transaction.

**Note:** the data is synthetic (made by `scripts/generate_data.py`, seed 42). The value of this project is the method, not real-world findings.

**Tools:** Python (data generation and cleaning), Excel (data-quality report), PostgreSQL (analysis), Power BI or Tableau (dashboard).

## Project status

- [x] Week 1: Setup and data generation
- [x] Week 2: Data cleaning (Python/pandas) and data-quality report
- [x] Week 3: SQL data model (PostgreSQL)
- [ ] Week 4: Funnel metrics
- [ ] Week 5: Retention, cohorts and segmentation
- [ ] Week 6: Dashboard
- [ ] Week 7: Insight report

## Documentation

- `docs/data_dictionary.md`: what each column means
- `docs/data_model.md`: tables, relationships and cleaning decisions
- `sql/`: SQL scripts, run in order (01 create tables, 02 clean app events, 03 keys and indexes)
