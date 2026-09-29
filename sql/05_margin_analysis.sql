-- Margin Analysis

-- Average product sales benchmark
SELECT ROUND(AVG(Total_Sales),2) AS Average_Product_Sales
FROM (
    SELECT Product, SUM(Sales) AS Total_Sales
    FROM TRANSACTIONS
    GROUP BY Product
) Product_Sales;

-- Average product margin benchmark
SELECT ROUND(AVG(Profit_Margin),2) AS Average_Margin
FROM (
    SELECT Product,
           SUM(Profit)/SUM(Sales)*100 AS Profit_Margin
    FROM TRANSACTIONS
    GROUP BY Product
) Product_Margins;

-- High-sales products below benchmark margin
-- Project benchmarks: $51,672.21 average product sales; 48.3% average margin
SELECT Department, Product,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit,
       ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin,
       ROUND((SUM(Profit)/SUM(Sales)*100)-48.3,2) AS Margin_Gap
FROM TRANSACTIONS
GROUP BY Department, Product
HAVING SUM(Sales) > 51672.21
   AND SUM(Profit)/SUM(Sales)*100 < 48.3
ORDER BY Margin_Gap ASC;
