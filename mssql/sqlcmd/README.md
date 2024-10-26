# sqlcmd utility

It is preinstalled in
- Azure Cloud Shell
- Azure Data Studio as a syntax support in query file
  - presented as a syntx support in query file
  - as a ![image](https://github.com/user-attachments/assets/0209858e-846f-4a49-b645-b09a693570af) button in editor toolbar 
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


