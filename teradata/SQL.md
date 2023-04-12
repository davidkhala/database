# ANSI SQL Compliance note
[CAST](https://docs.teradata.com/r/kmuOwjp1zEYg98JsB8fu_A/3p451k4ev~Sx~dDp_QXM6g)
- break: CAST permits the use of data attributes, such as the FORMAT phrase that enables alternative formatting for the date data.

[Collecting Statistics](https://www.quora.com/What-does-Collect-stats-actually-do-in-SQL) is Optimizer form
- unique in Teradata
- Best practise: ensure statistics are up-to-date
- What it will do
  1. Collects demographic data for column(s) of a base table, hash index, or join index, 
  2. Computes a statistical profile from collected data
  3. Stores the synopsis in the Data Dictionary.
  4. The Optimizer uses the synopsis data when it generates its table access and join plans.

