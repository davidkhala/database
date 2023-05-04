-- support subsequently definition (defer define)

WITH multiple_order_totals AS (
   SELECT customer_id, SUM(total_cost) AS total_spend
   FROM orders
   WHERE customer_id IN (SELECT customer_id FROM multiple_orders) 
   GROUP BY customer_id
),
multiple_orders AS (
   SELECT customer_id, COUNT(*) AS order_count
   FROM orders
   GROUP BY customer_id
   HAVING COUNT(*) > 1
)
SELECT * FROM multiple_order_totals
ORDER BY total_spend DESC;
