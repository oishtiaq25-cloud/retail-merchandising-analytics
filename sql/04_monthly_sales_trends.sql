-- Monthly Sales Trends and Month-over-Month Growth
WITH Monthly_Sales AS (
    SELECT MONTH(Order_Date) AS Month_Number,
           MONTHNAME(Order_Date) AS Month,
           SUM(Sales) AS Total_Sales,
           SUM(Profit) AS Total_Profit,
           SUM(Units_Sold) AS Total_Units
    FROM TRANSACTIONS
    GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
),
Monthly_With_Previous AS (
    SELECT Month_Number, Month, Total_Sales, Total_Profit, Total_Units,
           LAG(Total_Sales) OVER (ORDER BY Month_Number) AS Previous_Month_Sales
    FROM Monthly_Sales
)
SELECT Month_Number, Month,
       ROUND(Total_Sales,2) AS Total_Sales,
       ROUND(Total_Profit,2) AS Total_Profit,
       Total_Units,
       ROUND(Previous_Month_Sales,2) AS Previous_Month_Sales,
       ROUND((Total_Sales-Previous_Month_Sales)/Previous_Month_Sales*100,2) AS MoM_Growth
FROM Monthly_With_Previous
ORDER BY Month_Number;
