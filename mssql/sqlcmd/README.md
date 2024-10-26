# sqlcmd utility

It is preinstalled in
- Azure Cloud Shell
- Azure Data Studio as a syntax support in query file
  - `bcp` excluded
- SSMS


# Limit
Run a Single Statement
- It’s not sufficient to end a line with a `;`, you have to use `GO`.
```
SELECT 'Hello, World!';
GO
```

Run Multi-Line Statements
- multi-line copy/paste does not work.
- Solution: put statements into a script
  - `sqlcmd -S localhost,1433 -U SA -i foo.sql` 


