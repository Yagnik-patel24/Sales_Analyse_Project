-- SALES ANALYZE:                                                                                                 ------Yagnik Patel------                       
-- What are the total sales, percentage of overall sales, total profit, and profit margin percentage for each product category ranked by sales?
select 
Category,
sum(Sales) total_sale_amount,
round(sum(Sales)*100 / (select sum(Sales) Total_sales from sample_superstore_orders),2) as Percentage,
ROUND(SUM(Profit),2) Total_Profit,
ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Percentage
from sample_superstore_orders
group by Category
order by total_sale_amount desc;
-- What are the total sales, percentage of overall sales, total profit, and profit margin percentage for each product Region ranked by sales?
 select 
 Region,
 sum(Sales) Total_sales,
 round(sum(Sales)*100 / (select sum(Sales) Total_sales from sample_superstore_orders),2) as Percentage,
 ROUND(SUM(Profit),2) Total_Profit,
 ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Percentage
from sample_superstore_orders
group by Region
order by Total_sales desc;
-- What are the total sales, percentage of overall sales, total profit, and profit margin percentage for each product Segment ranked by sales?
select 
Segment,
sum(Sales) Total_sale_amount,
round(sum(Sales)*100 / (select sum(Sales) Total_sales from sample_superstore_orders),2) as Sales_Margin_Percentage,
ROUND(SUM(Profit),2) Total_Profit,
ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Percentage
from sample_superstore_orders
group by Segment
order by total_sale_amount desc;
--  What are the total sales, percentage of overall sales, total profit, and profit margin percentage for each product State ranked by sales?
 select 
 State,
 sum(Sales) Total_sales,
 round(sum(Sales)*100 / (select sum(Sales) Total_sales from sample_superstore_orders),2) as Percentage,
 ROUND(SUM(Profit),2) Total_Profit,
 ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Percentage
from sample_superstore_orders
group by State
order by Total_sales desc;
-- What are the total sales, percentage of overall sales, total profit, and profit margin percentage for each product Sub-category ranked by sales?
 select Category,
 Sub_Category,
 sum(Sales) Total_sales,
 round(sum(Sales)*100 / (select sum(Sales) Total_sales from sample_superstore_orders),2) as Percentage,
 ROUND(SUM(Profit),2) Total_Profit,
 ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Percentage
from sample_superstore_orders
group by Sub_Category,Category
order by Total_sales desc;
-- What is the average sales amount Per Customer for each product category?
with Customer_Sales AS(
    SELECT 
        Customer_ID,
        Category,
        SUM(Sales) AS Total_Sales
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID, Category
) 
SELECT 
    Category,
    ROUND(AVG(Total_Sales), 2) AS Average_Sale_Per_Customer
FROM Customer_Sales
GROUP BY Category
ORDER BY Average_Sale_Per_Customer DESC;
-- What is the average sales amount per customer for each product sub-category?
with Customer_Sales AS(
    SELECT 
        Customer_ID,
        Sub_Category,
        SUM(Sales) AS Total_Sales
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID, Sub_Category
) 
SELECT 
    Sub_Category,
    ROUND(AVG(Total_Sales), 2) AS Average_Sale_Per_Customer
FROM Customer_Sales
GROUP BY Sub_Category
ORDER BY Average_Sale_Per_Customer DESC;
-- What is the average sales amount per customer for each product Region?
with Customer_Sales AS(
    SELECT 
        Customer_ID,
        Region,
        SUM(Sales) AS Total_Sales
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID, Region
) 
SELECT 
    Region,
    ROUND(AVG(Total_Sales), 2) AS Average_Sale_Per_Customer
FROM Customer_Sales
GROUP BY Region
ORDER BY Average_Sale_Per_Customer DESC;
-- What is the average sales amount per customer for each product Segment?
with Customer_Sales AS(
    SELECT 
        Customer_ID,
        Segment,
        SUM(Sales) AS Total_Sales
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID, Segment
) 
SELECT 
    Segment,
    ROUND(AVG(Total_Sales), 2) AS Average_Sale_Per_Customer
FROM Customer_Sales
GROUP BY Segment
ORDER BY Average_Sale_Per_Customer DESC;
-- What is the average sales amount per customer for each product State?
with Customer_Sales AS(
    SELECT 
        Customer_ID,
        State,
        SUM(Sales) AS Total_Sales
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID, State
) 
SELECT 
    State,
    ROUND(AVG(Total_Sales), 2) AS Average_Sale_Per_Customer
FROM Customer_Sales
GROUP BY State
ORDER BY Average_Sale_Per_Customer DESC;
-- Identify the top 10 products with the highest sales with profit category and sub-category wise.
select Product_Name,
Category,
Sub_Category,
sum(Sales) total_sale_amount,
sum(Profit) total_profit_amount
from sample_superstore_orders
group by Product_Name,Sub_Category,Category
order by total_sale_amount desc
limit 10;
-- Identify the top 10 products with the highest sales with profit state,city,category,subcatesory wise.
select Product_Name,
State,
city,
Category,
Sub_Category,
sum(Sales) total_sale_amount,
sum(Profit) total_profit_amount
from sample_superstore_orders
group by State,City,Product_Name,Sub_Category,Category
order by total_sale_amount desc
limit 10;
-- Identify the top 10 products with the highest Profit with sales category and sub-category wise.
select Product_Name,
Category,
Sub_Category,
sum(Profit) total_Profit_amount,
sum(Sales) total_sale_amount
from sample_superstore_orders
group by Product_Name,Sub_Category,Category
order by total_Profit_amount desc
limit 10;
-- Identify the top 10 products with the highest profit with sales state,city,category,subcatesory wise.
select Product_Name,
State,city,
Category,
Sub_Category,
sum(Profit) total_Profit_amount,
sum(Sales) total_sale_amount
from sample_superstore_orders
group by State,City,Product_Name,Sub_Category,Category
order by total_Profit_amount desc
limit 10;
-- What is the trend of total sales and profit over time?
-- Weekly total sales and profit
SELECT 
    date_format(Order_Date, '%Y-%u') AS Years_week,
    SUM(Sales) AS Total_Sales,
    Sum(Profit) Total_Profit
FROM Sample_Superstore_Orders
GROUP BY Years_week
ORDER BY Years_week;
-- Monthly total sales and profit
select
 year(Order_Date) Years,
 month(Order_Date) Months,
 sum(Sales) Total_sales,
 Sum(Profit) Total_Profit
from sample_superstore_orders
group by Months,Years
order by Years,Months;
-- Quarterly total sales and profit
select
 year(Order_Date) Years,
 Quarter(Order_Date) Quarter,
 sum(Sales) Total_sales,
 Sum(Profit) Total_Profit
from sample_superstore_orders
group by Quarter,Years
order by Years,Quarter;
-- Yearly total sales and profit 
select
 year(Order_Date) Years,
 sum(Sales) Total_sales,
 Sum(Profit) Total_Profit
from sample_superstore_orders
group by Years
order by Years;
-- How does the forecasted sales compare to actual sales?
select 
 sum(Sales_Forecast) Total_forecast_sales,
 sum(Sales) Total_actual_sales,
 (sum(Sales_Forecast) - sum(Sales) ) Difference
from sample_superstore_orders;
-- Which customers generate the highest revenue(Sales) with profit for the company?
select 
Customer_Name,
sum(Sales) Total_revenue,
sum(Profit) Total_Profit
from sample_superstore_orders
group by Customer_Name
order by Total_revenue desc
limit 10;
-- Which customers generate the highest Profit with revenue(sales) for the company?
select 
Customer_Name,
sum(Sales) Total_revenue,
sum(Profit) Total_Profit
from sample_superstore_orders
group by Customer_Name
order by Total_Profit desc
limit 10;
-- How many unique customers does the company serve?
select count(distinct Customer_ID) unique_customers
from sample_superstore_orders;
-- How many repeat customers does the company have?
 with  Repeat_Customers_List AS(
    SELECT 
        Customer_ID
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID
    HAVING COUNT(Order_ID) > 1
) 
SELECT 
    COUNT(Customer_ID) AS Repeat_Customers
FROM Repeat_Customers_List;
-- Identify customers who placed orders only once.
 with  placed_orders_only_once_List AS(
    SELECT 
        Customer_ID
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID
    HAVING COUNT(Order_ID) = 1
) 
SELECT 
    COUNT(Customer_ID) AS placed_orders_only_once
FROM placed_orders_only_once_List;
-- What is the average order size (sales) per customer with Profit but Highest Sales? Top 10 Customers
select 
Customer_Name,
round(avg(Sales),2) average_order_sales,
round(avg(Profit),2) average_Profit
from sample_superstore_orders
group by Customer_Name
order by average_order_sales desc
limit 10;
-- What is the average order size (sales) per customer with Profit but Highest Profit? Top 10 Customers
select 
Customer_Name,
round(avg(Sales),2) average_order_sales,
round(avg(Profit),2) average_Profit
from sample_superstore_orders
group by Customer_Name
order by average_Profit desc
limit 10;
-- What is the average profit per customer across all segments?
with Customer_Profit AS(
    SELECT 
        Customer_ID,
        Segment,
        SUM(Profit) AS Total_Profit
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID, Segment
) 
SELECT 
    Segment,
    ROUND(AVG(Total_Profit), 2) AS Average_Profit_Per_Customer
FROM Customer_Profit
GROUP BY Segment
ORDER BY Average_Profit_Per_Customer DESC;
-- What is the average profit per customer across all Region?
with Customer_Profit AS(
    SELECT 
        Customer_ID,
        Region,
        SUM(Profit) AS Total_Profit
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID, Region
) 
SELECT 
    Region,
    ROUND(AVG(Total_Profit), 2) AS Average_Profit_Per_Customer
FROM Customer_Profit
GROUP BY Region
ORDER BY Average_Profit_Per_Customer DESC;
-- What is the average profit per customer across all State?
with Customer_Profit AS(
    SELECT 
        Customer_ID,
        State,
        SUM(Profit) AS Total_Profit
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID,State
) 
SELECT 
    State,
    ROUND(AVG(Total_Profit), 2) AS Average_Profit_Per_Customer
FROM Customer_Profit
GROUP BY State
ORDER BY Average_Profit_Per_Customer DESC;
-- What is the average profit per customer across all Category?
with Customer_Profit AS(
    SELECT 
        Customer_ID,
        Category,
        SUM(Profit) AS Total_Profit
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID,Category
) 
SELECT 
    Category,
    ROUND(AVG(Total_Profit), 2) AS Average_Profit_Per_Customer
FROM Customer_Profit
GROUP BY Category
ORDER BY Average_Profit_Per_Customer DESC;
-- What is the average profit per customer across all Sub-Category?
with Customer_Profit AS(
    SELECT 
        Customer_ID,
        Sub_Category,
        SUM(Profit) AS Total_Profit
    FROM Sample_Superstore_Orders
    GROUP BY Customer_ID,Sub_Category
) 
SELECT 
    Sub_Category,
    ROUND(AVG(Total_Profit), 2) AS Average_Profit_Per_Customer
FROM Customer_Profit
GROUP BY Sub_Category
ORDER BY Average_Profit_Per_Customer DESC;
-- Identify the most Saleable customer in each region.
WITH Customer_Sales AS (
    SELECT 
        Region,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Region, Customer_Name
),
Ranked_Sales AS (
    SELECT 
        Region,
        Customer_Name,
        Total_Sales,
        RANK() OVER (PARTITION BY Region ORDER BY Total_Sales DESC) AS Rank1
    FROM 
        Customer_Sales
)
SELECT 
    Region,
    Customer_Name,
    Total_Sales
FROM 
    Ranked_Sales
WHERE 
    Rank1 = 1
ORDER BY 
    Total_Sales desc;
-- Identify the most Saleable customer in each Segment.
WITH Customer_Sales AS (
    SELECT 
        Segment,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Segment, Customer_Name
),
Ranked_Sales AS (
    SELECT 
        Segment,
        Customer_Name,
        Total_Sales,
        RANK() OVER (PARTITION BY Segment ORDER BY Total_Sales DESC) AS Rank1
    FROM 
        Customer_Sales
)
SELECT 
    Segment,
    Customer_Name,
    Total_Sales
FROM 
    Ranked_Sales
WHERE 
    Rank1 = 1
ORDER BY 
    Total_Sales desc;
-- Identify the most Saleable customer in each category.
WITH Customer_Sales AS (
    SELECT 
        Category,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Category, Customer_Name
),
Ranked_Sales AS (
    SELECT 
        Category,
        Customer_Name,
        Total_Sales,
        RANK() OVER (PARTITION BY Category ORDER BY Total_Sales DESC) AS Rank1
    FROM 
        Customer_Sales
)
SELECT 
    Category,
    Customer_Name,
    Total_Sales
FROM Ranked_Sales
WHERE Rank1 = 1
ORDER BY  Total_Sales desc ;
 -- Identify the most Saleable customer in each sub-category.
WITH Customer_Sales AS (
    SELECT 
       Sub_Category,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Sub_Category, Customer_Name
),
Ranked_Sales AS (
    SELECT 
        Sub_Category,
        Customer_Name,
        Total_Sales,
        RANK() OVER (PARTITION BY Sub_Category ORDER BY Total_Sales DESC) AS Rank1
    FROM 
        Customer_Sales
)
SELECT 
    Sub_Category,
    Customer_Name,
    Total_Sales
FROM Ranked_Sales
WHERE Rank1 = 1
ORDER BY  Total_Sales desc ;
-- Identify the most Saleable customer in each states.
WITH Customer_Sales AS (
    SELECT 
        State,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        State, Customer_Name
),
Ranked_Sales AS (
    SELECT 
        State,
        Customer_Name,
        Total_Sales,
        RANK() OVER (PARTITION BY State ORDER BY Total_Sales DESC) AS Rank1
    FROM 
        Customer_Sales
)
SELECT 
    State,
    Customer_Name,
    Total_Sales
FROM Ranked_Sales
WHERE Rank1 = 1
ORDER BY  Total_Sales desc ;
-- Identify the most profitable customer in each region.
WITH Customer_Profit AS (
    SELECT 
        Region,
        Customer_Name,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Region, Customer_Name
),
Ranked_Profits AS (
    SELECT 
        Region,
        Customer_Name,
        Total_Profit,
        RANK() OVER (PARTITION BY Region ORDER BY Total_Profit DESC) AS Rank1
    FROM 
        Customer_Profit
)
SELECT 
    Region,
    Customer_Name,
    Total_Profit
FROM 
    Ranked_Profits
WHERE 
    Rank1 = 1
ORDER BY 
    Total_Profit desc;
-- Identify the most profitable customer in each Segment.
WITH Customer_Profit AS (
    SELECT 
        Segment,
        Customer_Name,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Segment, Customer_Name
),
Ranked_Profits AS (
    SELECT 
        Segment,
        Customer_Name,
        Total_Profit,
        RANK() OVER (PARTITION BY Segment ORDER BY Total_Profit DESC) AS Rank1
    FROM 
        Customer_Profit
)
SELECT 
    Segment,
    Customer_Name,
    Total_Profit
FROM 
    Ranked_Profits
WHERE 
    Rank1 = 1
ORDER BY 
    Total_Profit desc;
-- Identify the most profitable customer in each category.
WITH Customer_Profit AS (
    SELECT 
        Category,
        Customer_Name,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Category, Customer_Name
),
Ranked_Profits AS (
    SELECT 
        Category,
        Customer_Name,
        Total_Profit,
        RANK() OVER (PARTITION BY Category ORDER BY Total_Profit DESC) AS Rank1
    FROM 
        Customer_Profit
)
SELECT 
    Category,
    Customer_Name,
    Total_Profit
FROM Ranked_Profits
WHERE Rank1 = 1
ORDER BY  Total_Profit desc ;
 -- Identify the most profitable customer in each sub-category.
WITH Customer_Profit AS (
    SELECT 
       Sub_Category,
        Customer_Name,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Sub_Category, Customer_Name
),
Ranked_Profits AS (
    SELECT 
        Sub_Category,
        Customer_Name,
        Total_Profit,
        RANK() OVER (PARTITION BY Sub_Category ORDER BY Total_Profit DESC) AS Rank1
    FROM 
        Customer_Profit
)
SELECT 
    Sub_Category,
    Customer_Name,
    Total_Profit
FROM Ranked_Profits
WHERE Rank1 = 1
ORDER BY  Total_Profit desc ;
-- Identify the most profitable customer in each states.
WITH Customer_Profit AS (
    SELECT 
        State,
        Customer_Name,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        State, Customer_Name
),
Ranked_Profits AS (
    SELECT 
        State,
        Customer_Name,
        Total_Profit,
        RANK() OVER (PARTITION BY State ORDER BY Total_Profit DESC) AS Rank1
    FROM 
        Customer_Profit
)
SELECT 
    State,
    Customer_Name,
    Total_Profit
FROM Ranked_Profits
WHERE Rank1 = 1
ORDER BY  Total_Profit desc ;
-- Which customers have the highest sales growth over time ?
-- Years on growth
WITH Sales_Per_Period AS (
    SELECT 
        Customer_Name,
        YEAR(Order_Date) AS Year,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Customer_Name, Year
),
Sales_Growth AS (
    SELECT 
        Customer_Name,
        Year,
        Total_Sales,
        LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Year) AS Previous_Year_Sales,
        ROUND(
            (Total_Sales - LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Year)) 
            * 100.0 / LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Year),
            2
        ) AS Growth_Percentage
    FROM 
        Sales_Per_Period
)
SELECT 
    Customer_Name,
    Year,
    Total_Sales,
    Growth_Percentage
FROM 
    Sales_Growth
WHERE 
    Growth_Percentage IS NOT NULL
ORDER BY 
    Growth_Percentage DESC
LIMIT 10;
-- Quarters on growth
WITH Sales_Per_Period AS (
    SELECT 
        Customer_Name,
        Quarter(Order_Date) AS Quarter,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Customer_Name, Quarter
),
Sales_Growth AS (
    SELECT 
        Customer_Name,
        Quarter,
        Total_Sales,
        LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Quarter) AS Previous_Quarter_Sales,
        ROUND(
            (Total_Sales - LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Quarter)) 
            * 100.0 / LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Quarter),
            2
        ) AS Growth_Percentage
    FROM 
        Sales_Per_Period
)
SELECT 
    Customer_Name,
    Quarter,
    Total_Sales,
    Growth_Percentage
FROM 
    Sales_Growth
WHERE 
    Growth_Percentage IS NOT NULL
ORDER BY 
    Growth_Percentage DESC
LIMIT 10;
-- Months on growth
WITH Sales_Per_Period AS (
    SELECT 
        Customer_Name,
        Month(Order_Date) AS Month,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Customer_Name, Month
),
Sales_Growth AS (
    SELECT 
        Customer_Name,
        Month,
        Total_Sales,
        LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Month) AS Previous_Month_Sales,
        ROUND(
            (Total_Sales - LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Month)) 
            * 100.0 / LAG(Total_Sales) OVER (PARTITION BY Customer_Name ORDER BY Month),
            2
        ) AS Growth_Percentage
    FROM 
        Sales_Per_Period
)
SELECT 
    Customer_Name,
    Month,
    Total_Sales,
    Growth_Percentage
FROM 
    Sales_Growth
WHERE 
    Growth_Percentage IS NOT NULL
ORDER BY 
    Growth_Percentage DESC
LIMIT 10;
-- Which customers have the highest Profit growth over time?
-- Years on growth
WITH Profit_Per_Period AS (
    SELECT 
        Customer_Name,
        YEAR(Order_Date) AS Year,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Customer_Name, Year
),
Profit_Growth AS (
    SELECT 
        Customer_Name,
        Year,
        Total_Profit,
        LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Year) AS Previous_Year_Profit,
        ROUND(
            (Total_Profit - LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Year)) 
            * 100.0 / LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Year),
            2
        ) AS Growth_Percentage
    FROM 
        Profit_Per_Period
)
SELECT 
    Customer_Name,
    Year,
    Total_Profit,
    Growth_Percentage
FROM 
    Profit_Growth
WHERE 
    Growth_Percentage IS NOT NULL
ORDER BY 
    Growth_Percentage DESC
LIMIT 10;
-- Quarters on growth
WITH Profit_Per_Period AS (
    SELECT 
        Customer_Name,
        Quarter(Order_Date) AS Quarter,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Customer_Name, Quarter(Order_Date)
),
Profit_Growth AS (
    SELECT 
        Customer_Name,
        Quarter,
        Total_Profit,
        LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Quarter) AS Previous_Quarter_Profit,
        ROUND(
            (Total_Profit - LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Quarter)) 
            * 100.0 / LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Quarter),
            2
        ) AS Growth_Percentage
    FROM 
        Profit_Per_Period
)
SELECT 
    Customer_Name,
    Quarter,
    Total_Profit,
    Growth_Percentage
FROM 
    Profit_Growth
WHERE 
    Growth_Percentage IS NOT NULL
ORDER BY 
    Growth_Percentage DESC
LIMIT 10;
-- Months on growth
WITH Profit_Per_Period AS (
    SELECT 
        Customer_Name,
        Month(Order_Date) AS Month,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Customer_Name, Month(Order_Date)
),
Profit_Growth AS (
    SELECT 
        Customer_Name,
        Month,
        Total_Profit,
        LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Month) AS Previous_Month_Profit,
        ROUND(
            (Total_Profit - LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Month)) 
            * 100.0 / LAG(Total_Profit) OVER (PARTITION BY Customer_Name ORDER BY Month),
            2
        ) AS Growth_Percentage
    FROM 
        Profit_Per_Period
)
SELECT 
    Customer_Name,
    Month,
    Total_Profit,
    Growth_Percentage
FROM 
    Profit_Growth
WHERE 
    Growth_Percentage IS NOT NULL
ORDER BY 
    Growth_Percentage DESC
LIMIT 10;
-- Identify the most frequently sold products.
SELECT 
    Product_Name,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Sample_Superstore_Orders
GROUP BY Product_Name
ORDER BY 
Total_Orders DESC
LIMIT 10;
-- Which products exceed their sales targets the most?
SELECT 
    o.Product_Name,
    o.Category,
    o.Sub_Category,
    SUM(o.Sales) AS Total_Actual_Sales,
    SUM(t.Sales_Target) AS Total_Sales_Target,
    SUM(o.Sales - t.Sales_Target) AS Sales_Excess
FROM sample_superstore_orders o
join sales_target_full_data t
on o.Order_Date=t.Order_Date
GROUP BY Product_Name,Category,Sub_Category
HAVING Sales_Excess > 0
ORDER BY Sales_Excess DESC
LIMIT 10;
-- What is the sales forecast accuracy by product category?
SELECT 
    Category,
    ROUND(AVG(100.0 - (ABS(Sales - Sales_Forecast) * 100.0 / Sales)), 2) AS Forecast_Accuracy_Percentage
FROM sample_superstore_orders
GROUP BY Category
ORDER BY Forecast_Accuracy_Percentage DESC;
-- What is the sales forecast accuracy by product Sub-category?
SELECT 
    Sub_Category,
    ROUND(AVG(100.0 - (ABS(Sales - Sales_Forecast) * 100.0 / Sales)), 2) AS Forecast_Accuracy_Percentage
FROM sample_superstore_orders
GROUP BY Sub_Category
ORDER BY Forecast_Accuracy_Percentage DESC;
-- What is the sales forecast accuracy by product Segment?
    SELECT 
    Segment,
    ROUND(AVG(100.0 - (ABS(Sales - Sales_Forecast) * 100.0 / Sales)), 2) AS Forecast_Accuracy_Percentage
FROM sample_superstore_orders
GROUP BY Segment
ORDER BY Forecast_Accuracy_Percentage DESC;
-- What is the sales forecast accuracy by product Region?
SELECT 
    Region,
    ROUND(AVG(100.0 - (ABS(Sales - Sales_Forecast) * 100.0 / Sales)), 2) AS Forecast_Accuracy_Percentage
FROM sample_superstore_orders
GROUP BY Region
ORDER BY Forecast_Accuracy_Percentage DESC;
-- What is the sales forecast accuracy by product State?
SELECT 
    State,
    ROUND(AVG(100.0 - (ABS(Sales - Sales_Forecast) * 100.0 / Sales)), 2) AS Forecast_Accuracy_Percentage
FROM sample_superstore_orders
GROUP BY State
ORDER BY Forecast_Accuracy_Percentage DESC;
-- Identify products with declining sales trends.
-- Month wise declining sales
WITH Sales_Per_Period AS (
    SELECT 
        Product_Name,
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        SUM(Sales) AS Total_Sales
    FROM Sample_Superstore_Orders
    GROUP BY Product_Name, YEAR, MONTH
),
Sales_Trend AS (
    SELECT 
        Product_Name,
        Year,
        Month,
        Total_Sales,
        LAG(Total_Sales) OVER (PARTITION BY Product_Name ORDER BY Year, Month) AS Previous_Sales
    FROM Sales_Per_Period
),
Declining_Products AS (
    SELECT 
        Product_Name,
        COUNT(*) AS Declining_Months,
        sum(Previous_Sales -  Total_Sales) AS Declining_Sales
    FROM Sales_Trend
    WHERE Total_Sales < Previous_Sales 
    AND Previous_Sales IS NOT NULL
    GROUP BY Product_Name
)
SELECT 
    Product_Name,
    Declining_Months,
    Declining_Sales
FROM Declining_Products
ORDER BY Declining_Sales desc
LIMIT 10;
-- Quarter wise declining sales
 WITH Sales_Per_Period AS (
    SELECT 
        Product_Name,
        Quarter(Order_Date) AS Quarter,
        SUM(Sales) AS Total_Sales
    FROM Sample_Superstore_Orders
    GROUP BY Product_Name, Quarter
),
Sales_Trend AS (
    SELECT 
        Product_Name,
        Quarter
        Total_Sales,
        LAG(Total_Sales) OVER (PARTITION BY Product_Name ORDER BY Quarter) AS Previous_Sales
    FROM 
        Sales_Per_Period
),
Declining_Products AS (
    SELECT 
        Product_Name,
        COUNT(*) AS Declining_Quarter,
        sum(Previous_Sales -  Total_Sales) AS Declining_Sales
    FROM 
        Sales_Trend
    WHERE 
        Total_Sales < Previous_Sales AND Previous_Sales IS NOT NULL
    GROUP BY 
        Product_Name
)
SELECT 
    Product_Name,
    Declining_Quarter,
    Declining_Sales
FROM 
    Declining_Products
ORDER BY 
    Declining_Sales desc
LIMIT 10;
-- Year wise declining sales
 WITH Sales_Per_Period AS (
    SELECT 
        Product_Name,
        YEAR(Order_Date) AS Year,
        SUM(Sales) AS Total_Sales
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        Product_Name, YEAR(Order_Date)
),
Sales_Trend AS (
    SELECT 
        Product_Name,
        Year,
        Total_Sales,
        LAG(Total_Sales) OVER (PARTITION BY Product_Name ORDER BY Year) AS Previous_Sales
    FROM 
        Sales_Per_Period
),
Declining_Products AS (
    SELECT 
        Product_Name,
        COUNT(*) AS Declining_Years,
        sum(Previous_Sales -  Total_Sales) AS Declining_Sales
    FROM 
        Sales_Trend
    WHERE 
        Total_Sales < Previous_Sales AND Previous_Sales IS NOT NULL
    GROUP BY 
        Product_Name
)
SELECT 
    Product_Name,
    Declining_Years,
    Declining_Sales
FROM 
    Declining_Products
ORDER BY 
    Declining_Sales desc
LIMIT 10;
-- What is the average shipping time for each product category?
select Category,round(avg(Days_to_Ship_Actual),2) average_shipping_time 
from sample_superstore_orders
group by Category;
-- What is the average shipping time for each product sub_category?
select Sub_Category,round(avg(Days_to_Ship_Actual),2) average_shipping_time 
from sample_superstore_orders
group by Sub_Category;
-- What is the average shipping time for each product Region?
select Region,round(avg(Days_to_Ship_Actual),2) average_shipping_time 
from sample_superstore_orders
group by Region;
-- What is the average shipping time for each product Segment?
select Segment,round(avg(Days_to_Ship_Actual),2) average_shipping_time 
from sample_superstore_orders
group by Segment;
-- What is the average shipping time for each product State?
select State,round(avg(Days_to_Ship_Actual),2) average_shipping_time 
from sample_superstore_orders
group by State;
-- What is the Count and percentage of Ship_Status?
select Ship_Status, 
Count(Ship_Status) Count_Ship_Status, 
Round(Count(Ship_Status)*100.0/ (Select count(*) from sample_superstore_orders),2) Percentage_ship_status 
from sample_superstore_orders
group by Ship_Status
order by Percentage_ship_status DESC;
-- What is the Count and percentage of ShipMode?
select Distinct ShipMode, 
Count(ShipMode) Count_ShipMode, 
Round(Count(ShipMode)*100.0/ (Select count(*) from sample_superstore_orders),2) Percentage_ShipMode 
from sample_superstore_orders
group by ShipMode
order by Percentage_ShipMode DESC;
-- Which regions have the most delayed shipments?
SELECT 
    Region,
    ROUND(
        (sum(CASE WHEN Days_to_Ship_Actual > Days_to_Ship_Scheduled THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Late_Orders
FROM 
    Sample_Superstore_Orders
    group by Region
    order by Percentage_Late_Orders desc;
-- Which Category have the most delayed shipments?
    SELECT 
    Category,
    ROUND(
        (sum(CASE WHEN Days_to_Ship_Actual > Days_to_Ship_Scheduled THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Late_Orders
FROM 
    Sample_Superstore_Orders
    group by Category
    order by Percentage_Late_Orders desc;
-- Which Sub-Category have the most delayed shipments?
    SELECT 
    Sub_Category,
    ROUND(
        (sum(CASE WHEN Days_to_Ship_Actual > Days_to_Ship_Scheduled THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Late_Orders
FROM 
    Sample_Superstore_Orders
    group by Sub_Category
    order by Percentage_Late_Orders desc;
-- Which Segment have the most delayed shipments?
    SELECT 
    Segment,
    ROUND(
        (sum(CASE WHEN Days_to_Ship_Actual > Days_to_Ship_Scheduled THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Late_Orders
FROM 
    Sample_Superstore_Orders
    group by Segment
    order by Percentage_Late_Orders desc;
-- Which State have the most delayed shipments?
    SELECT 
    State,
    ROUND(
        (sum(CASE WHEN Days_to_Ship_Actual > Days_to_Ship_Scheduled THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Late_Orders
FROM 
    Sample_Superstore_Orders
    group by State
    order by Percentage_Late_Orders desc;
-- How many orders meet their scheduled shipping time?
select count(*) orders_meet_their_scheduled_shipping_time
from sample_superstore_orders
where Days_to_Ship_Actual = Days_to_Ship_Scheduled;
-- How many orders meet their scheduled shipping time before?
select count(*) orders_meet_their_scheduled_shipping_time
from sample_superstore_orders
where Days_to_Ship_Actual < Days_to_Ship_Scheduled;
-- How many orders meet their scheduled shipping time after?
select count(*) orders_meet_their_scheduled_shipping_time
from sample_superstore_orders
where Days_to_Ship_Actual > Days_to_Ship_Scheduled;
-- What percentage of sales targets are met for each segment?
SELECT 
    o.Segment,
    ROUND(
        (SUM(CASE WHEN o.Sales >= t.Sales_Target THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Targets_Met
FROM sample_superstore_orders o
join sales_target_full_data t  
on o.Order_Date = t.Order_Date  
GROUP BY Segment
ORDER BY Percentage_Targets_Met DESC;
-- What percentage of sales targets are met for each Region?
SELECT 
    o.Region,
    ROUND(
        (SUM(CASE WHEN o.Sales >= t.Sales_Target THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Targets_Met
FROM sample_superstore_orders o
join sales_target_full_data t  
on o.Order_Date = t.Order_Date  
GROUP BY Region
ORDER BY Percentage_Targets_Met DESC;
-- What percentage of sales targets are met for each Category?
SELECT 
    o.Category,
    ROUND(
        (SUM(CASE WHEN o.Sales >= t.Sales_Target THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Targets_Met
FROM sample_superstore_orders o
join sales_target_full_data t  
on o.Order_Date = t.Order_Date  
GROUP BY Category
ORDER BY Percentage_Targets_Met DESC;
-- What percentage of sales targets are met for each Sub-Category?
SELECT 
    o.Sub_Category,
    ROUND(
        (SUM(CASE WHEN o.Sales >= t.Sales_Target THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Targets_Met
FROM sample_superstore_orders o
join sales_target_full_data t  
on o.Order_Date = t.Order_Date  
GROUP BY Sub_Category
ORDER BY Percentage_Targets_Met DESC;
-- What percentage of sales targets are met for each State?
SELECT 
    o.State,
    ROUND(
        (SUM(CASE WHEN o.Sales >= t.Sales_Target THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS Percentage_Targets_Met
FROM sample_superstore_orders o
join sales_target_full_data t  
on o.Order_Date = t.Order_Date  
GROUP BY State
ORDER BY Percentage_Targets_Met DESC;
-- How does profit vary by segment over time?
-- Month
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        Segment,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, MONTH, Segment
)
SELECT 
    Year,
    Month,
    Segment,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Month, Segment;
-- Quarter
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        QUARTER(Order_Date) AS Quarter,
        Segment,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, Quarter, Segment
)
SELECT 
    Year,
    Quarter,
    Segment,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Quarter, Segment;
-- Year 
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        Segment,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR,  Segment
)
SELECT 
    Year,
    Segment,
	Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year,Segment;
-- How does profit vary by Category over time?	
-- Month
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        Category,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, MONTH, Category
)
SELECT 
    Year,
    Month,
    Category,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Month, Category;
-- Quarter
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        QUARTER(Order_Date) AS Quarter,
        Category,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, Quarter, Category
)
SELECT 
    Year,
    Quarter,
    Category,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Quarter, Category;
-- Year 
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        Category,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR,Category
)
SELECT 
    Year,
    Category,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year,Category;
-- How does profit vary by Sub-Category over time?
-- Month
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        Sub_Category ,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, MONTH, Sub_Category 
)
SELECT 
    Year,
    Month,
    Sub_Category ,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Month, Sub_Category ;
-- Quarter
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        QUARTER(Order_Date) AS Quarter,
        Sub_Category ,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, Quarter, Sub_Category 
)
SELECT 
    Year,
    Quarter,
    Sub_Category ,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Quarter, Sub_Category ;
-- Year 
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        Sub_Category ,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR,Sub_Category 
)
SELECT 
    Year,
    Sub_Category ,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year,Sub_Category ;
-- How does profit vary by Region over time?
-- Month
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        Region ,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, MONTH, Region 
)
SELECT 
    Year,
    Month,
    Region,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Month, Region ;
-- Quarter
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        QUARTER(Order_Date) AS Quarter,
        Region,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, Quarter, Region
)
SELECT 
    Year,
    Quarter,
    Region ,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Quarter, Region ;
-- Year 
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        Region ,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR,Region 
)
SELECT 
    Year,
    Region ,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year,Region ;
-- How does profit vary by State over time?
-- Month
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        State ,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, MONTH, State 
)
SELECT 
    Year,
    Month,
    State,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Month, State;
-- Quarter
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        QUARTER(Order_Date) AS Quarter,
        State,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR, Quarter, State
)
SELECT 
    Year,
    Quarter,
    State,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year, Quarter, State ;
-- Year 
WITH Profit_By_Period AS (
    SELECT 
        YEAR(Order_Date) AS Year,
        State,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM 
        Sample_Superstore_Orders
    GROUP BY 
        YEAR,State
)
SELECT 
    Year,
    State,
    Total_Sales,
    Total_Profit
FROM 
    Profit_By_Period
ORDER BY 
    Year,State;
    

    