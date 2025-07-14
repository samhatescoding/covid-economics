
# covid-economics

This repository contains my final project for a Databases class taken at the University of Barcelona in 2023. The project consists of MySQL database schema, queries, and analysis for a comprehensive examination of global economic trends and the impact of COVID-19 on various economic indicators. Correlations between stock prices and macroeconomic variables across five countries are also explored.

## Project Overview

**Title**: *Correlation Between Economic Indicators and Impact of COVID-19*  
**Author**: Samuel Blanco Ponce 
**Tools**: MySQL, SQL, CSV (World Bank, Yahoo Finance)

This project is divided into two parts:

### Part I: Correlation Analysis
- Compute **Pearson correlation coefficients** between:
  - Top 5 stock prices for the USA
  - Per capita GDP PPP across CHN, ESP, GBR, SWE, USA
  - U.S. economic indicators: per capita GDP PPP, poverty rate, unemployment rate, CO₂ emissions

### Part II: COVID-19 Impact
- Measure the **change in average growth** of multiple economic indicators **pre- and post-COVID**.
- Compare stock and economic performance from **2010–2019** vs **2020 onward**.

---

## Project Structure

```bash
Economy/
├── Data/                # World Bank data (e.g., GDP, Gini, Poverty)
├── Stocks/              # Raw Yahoo Finance stock price CSVs (25 total)
├── Sqls/                # All SQL scripts: table creation, queries, growth computations
├── essay.pdf            # Final project report with full analysis and results
├── economy.mwb          # MySQL Workbench schema (data model)
├── economy.mwb.bak      # Backup of the schema
```

---

## Datasets & Tables

### Economic Indicators (yearly)
- `gdp` — GDP (US$)
- `gdppc` — GDP per capita (US$)
- `gdpppp` — GDP (PPP, intl. US$)
- `gdpppppc` — GDP per capita (PPP)
- `giniindex` — Gini coefficient
- `poverty` — Poverty rate (% at $2.15/day)
- `unemployment` — Labor force unemployed (%)
- `co2` — Total CO₂ equivalent emissions
- `co2pc` — Per capita CO₂ emissions

### Stock Prices (monthly)
- `stockprices` — Open price per month, with columns:
  - `country`
  - `stock`
  - `price`

---

## Key Findings

### Part I: Correlation Insights
- Strong positive correlations between **GDP PPP per capita** of the 5 countries.
- Top 5 U.S. stocks (e.g., AAPL, AMZN, MSFT) show **highly correlated price behavior**.
- In the U.S., **GDP PPP per capita** is **negatively correlated** with:
  - Poverty (ρ ≈ -0.31)
  - Unemployment (ρ ≈ -0.77)
  - CO₂ emissions per capita (ρ ≈ -0.90)
- Surprising results:
  - **Unemployment** positively correlates with **CO₂ emissions** (ρ ≈ 0.93)
  - **Poverty and unemployment** show a mild **negative** correlation

### Part II: COVID-19 Effects
- COVID had varied impacts across countries:
  - GDP and poverty declined drastically in **Spain** and **UK**
  - Stock growth increased post-COVID in **USA** (e.g., NVIDIA, AAPL)
  - CO₂ emissions changes varied, possibly due to energy transition policies
- Tables `precovidgrowth` and `postcovidgrowth` store these averages

---

## Preview

### Correlation Between U.S. Economic Factors

![correlation-matrix](images/c18f5497-5f75-4783-b3f4-354450e78ea1.png)

### Stock Growth Pre vs Post COVID

![stock-growth](images/6f32091e-b840-4505-ba0c-91cbda739fdc.png)

---

## Sources

- [World Bank Databank](https://databank.worldbank.org/)
- [Yahoo Finance](https://finance.yahoo.com/)
- [Companies Market Cap](https://companiesmarketcap.com/)


