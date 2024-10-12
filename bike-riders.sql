use bike_data;
WITH cte AS (
  SELECT * FROM bike_share_yr_0
  UNION ALL
  SELECT * FROM bike_share_yr_1
)
SELECT 
  cte.dteday,
  cte.season,
  cte.yr,
  cte.weekday,
  cte.hr,
  cte.rider_type,
  cte.riders,
  cost_table.price,
  cost_table.COGS,
  cte.riders * cost_table.price AS revenue,
  cte.riders * cost_table.price - cost_table.COGS AS profit
FROM cte
LEFT JOIN cost_table
  ON cte.yr = cost_table.yr;
