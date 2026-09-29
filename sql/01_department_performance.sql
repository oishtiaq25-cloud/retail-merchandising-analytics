-- Department Performance
SELECT Department,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit,
       ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM TRANSACTIONS
GROUP BY Department
ORDER BY Profit_Margin DESC;
