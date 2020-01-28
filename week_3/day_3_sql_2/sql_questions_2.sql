#1. Return the average list price for each brand.
SELECT b.brand_name,
       AVG(p.list_price)
FROM production.products p
JOIN production.brands b
ON p.brand_id=b.brand_id
GROUP BY b.brand_name;

#2. Return the product_name, the brand_name, list price, and assign an integer 
#to each product (restarting with each brand) by list_price descending.
USE production;
SELECT p.product_name,
       b.brand_name, 
	   p.list_price,
       FIND_IN_SET(list_price ,(SELECT GROUP_CONCAT(
       DISTINCT list_price 
       ORDER BY list_price  DESC) 
       FROM production.products)) AS ranking
FROM products p
JOIN brands b
ON p.brand_id=b.brand_id 
ORDER BY ranking;

13:23:21	SELECT p.product_name,        b.brand_name,      p.list_price,        FIND_IN_SET(list_price ,(SELECT GROUP_CONCAT(        DISTINCT list_price         ORDER BY list_price  DESC)         FROM p)) AS ranking FROM products p JOIN brands b ON p.brand_id=b.brand_id  ORDER BY ranking LIMIT 0, 1000	Error Code: 1146. Table 'production.p' doesn't exist	0.026 sec


#3. Return the highest priced item for each brand (do not worry if more than one item is the most expensive). 
#Use one of the strategies we went over earlier.