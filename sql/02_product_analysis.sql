-- Product Analysis

-- Join transaction and product/category data
SELECT t.Product_ID, t.Product, p.Category, t.Department, t.Sales, t.Profit
FROM TRANSACTIONS t
JOIN PRODUCTS p ON t.Product_ID = p.Product_ID
LIMIT 10;

-- Product performance
SELECT Department, Product,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit,
       ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin
FROM TRANSACTIONS
GROUP BY Department, Product
ORDER BY Total_Sales DESC;

-- Top three products by profit within each department
SELECT Department, Product, Total_Profit, Profit_Rank
FROM (
    SELECT Department, Product,
           ROUND(SUM(Profit),2) AS Total_Profit,
           RANK() OVER (PARTITION BY Department ORDER BY SUM(Profit) DESC) AS Profit_Rank
    FROM TRANSACTIONS
    GROUP BY Department, Product
) Ranked_Products
WHERE Profit_Rank <= 3
ORDER BY Department, Profit_Rank;
