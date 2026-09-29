-- Customer Analysis
SELECT Customer_Type,
       COUNT(*) AS Total_Transactions,
       SUM(Units_Sold) AS Total_Units,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Sales)/COUNT(*),2) AS Avg_Transaction_Value,
       ROUND(SUM(Profit),2) AS Total_Profit,
       ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM TRANSACTIONS
GROUP BY Customer_Type
ORDER BY Total_Sales DESC;
