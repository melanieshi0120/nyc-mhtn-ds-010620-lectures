#1. Return all the cites of customers located in California and the number of customers in each city.
SELECT DISTINCT city ,
       COUNT(customer_id) AS number_of_customers
FROM sales.customers
WHERE state='CA'
GROUP BY city;


#2. Return the cities in California which has more than 10 customers.
SELECT city ,
       COUNT(customer_id)
FROM sales.customers
WHERE state='CA'
GROUP BY city
HAVING COUNT(customer_id)>10
;

#3. Use the GROUP BY clause to return distinct cities together with state and zip code from the sales.customers table.
SELECT DISTINCT city,
        state,
        zip_code
FROM sales.customers
GROUP BY city
ORDER BY city ;

#4. Rewrite this query with the DISTINCT keyword.
SELECT DISTINCT city,
        state,
        zip_code
FROM sales.customers
GROUP BY city
ORDER BY city;

#5. Return the products whose list price is greater than 300 and model is 2018.
SELECT product_name 
FROM production.products
WHERE list_price > 300 
AND model_year= 2018;

#6. Return the products whose list prices are between 1,899 and 1,999.99.
SELECT product_name 
FROM production.products
WHERE list_price  BETWEEN 1899 AND 1999.99 ;

#7. Use the IN operator to find products whose list price is 299.99 or 466.99 or 489.99. Order by price descending.
SELECT product_name 
FROM production.products
WHERE list_price  IN  (299.99,466.99,489.99) ;


#8. Return the average list price in the products table of product names that include the word 'Cruiser'.
SELECT product_name ,
       AVG(list_price)
FROM production.products
WHERE  product_name LIKE '%Cruiser%';


#. Return the customer_id, first_name, last_name, and phone number of sales.customers table where phone is not null, order by last name descending.
SELECT customer_id, first_name, last_name,  phone
FROM sales.customers
WHERE phone IS NOT NULL 
ORDER BY last_name DESC;



#10. Use the cast function to explicitly filter orders from the orders table where requiredDate is greater than 2017-01-01 and 2017-01-31.

SELECT *
FROM sales.orders
WHERE required_date BETWEEN  '2017-01-01' AND '2017-01-31' ;



#11. Return the order number, order status and total sales from the orders and orderdetails tables.
SELECT 
o.order_id,
o.order_status,
(oi.quantity * oi.list_price)*oi.discount AS total_price
FROM orders  o 
JOIN order_items oi 
ON o.order_id=oi.order_id
;

#12. Return the list of customers that placed no phone numbers.
SELECT * 
FROM sales.customers
WHERE phone is NULL;

#13. Return the customer first name, last name, email, phone and the number of the orders that customers with no phone number have made.

SELECT c.first_name, 
       c.last_name, 
       c.email, 
       c.phone,
       COUNT(o.customer_id) AS order_number
FROM sales.customers c
JOIN sales.orders o
ON c.customer_id=o.customer_id
JOIN sales.order_items oi
ON o.order_id=oi.order_id
WHERE phone IS NULL 
GROUP BY o.customer_id;






