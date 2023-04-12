[Teradata has Common-Table-Expressions(CTE) support](https://forgetcode.com/Teradata/1298-Common-Table-Expressions-CTE)

```
WITH CTE_name(column list) AS
(
SELECT column list FROM table [(WHERE condition)]
)
SELECT * FROM CTE_name;
```
