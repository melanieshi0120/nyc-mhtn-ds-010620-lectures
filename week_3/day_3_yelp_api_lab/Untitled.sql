#Fixing “Lock wait timeout exceeded; try restarting transaction” for a 'stuck" Mysql table?
-- SHOW PROCESSLIST;
-- KILL 'ID';
-- SET innodb_lock_wait_timeout = 5000;    to fix it 

#############################################################################
#############################################################################
-- (1) Which are the 5 most reviewed businesses?
SELECT name
FROM YELP3.businesses
ORDER BY review_count DESC
LIMIT 5;
-- -------------------------------------------------------------------------------
-- (2)What is the highest rating recieved in your data set and how many businesses have that rating?
SELECT count(*)
FROM YELP3.businesses
WHERE rating= 5;
-- -------------------------------------------------------------------------------
-- (3)What percentage of businesses have a rating greater than or 4.5?
SELECT concat((count( * )  / (SELECT count( * ) FROM  YELP3.businesses))) AS percentage 
FROM YELP3.businesses
WHERE rating >=4.5 ;
-- -------------------------------------------------------------------------------
-- (4)What percentage of businesses have a rating less than 3?
SELECT concat((count( * )  / (SELECT count( * ) FROM  YELP3.businesses))) AS percentage 
FROM YELP3.businesses
WHERE rating < 3 ;
-- -----------------------------------------------------------------------------
-- (5)What is the average rating of restaurants that have a price label of one dollar sign?
    # Two dollar signs? Three dollar signs?
SELECT AVG(rating) 
FROM YELP3.businesses
WHERE price = 1 ;  

SELECT AVG(rating) 
FROM YELP3.businesses
WHERE price = 2 ;  

SELECT AVG(rating) 
FROM YELP3.businesses
WHERE price = 3 ;  
-- -----------------------------------------------------------------------------
-- (6)Return the text of the reviews for the most reviewed restaurant.
SELECT r.text
FROM YELP3.reviews r
JOIN YELP3.businesses b
ON r.business_id_R= b.business_id
ORDER BY b.review_count DESC  
LIMIT 1;
-- -----------------------------------------------------------------------------
-- (7) Return the name of the business with the most recent review.
USE YELP3;

SELECT b.name,
       r.text
FROM businesses b
JOIN reviews r
ON b.business_id = r.business_id_R
ORDER BY  time_created DESC;
-- -----------------------------------------------------------------------------
-- (8) Find the highest rated business and return text of the most recent review. 
   #If multiple business have the same rating, select the restaurant with the most reviews.
   
SELECT b.name,
       r.text
FROM businesses b
JOIN reviews r
ON b.business_id = r.business_id_R
WHERE b.rating = 5 
AND  b.review_count = (SELECT MAX(review_count) FROM businesses WHERE rating = 5) 
# select the highest review_count who's rating is 5 and have review_count equal to it 
ORDER BY  r.time_created DESC
LIMIT 1;
-- -----------------------------------------------------------------------------

-- (9)Find the lowest rated business and return text of the most recent review. 
   #If multiple business have the same rating, select the restaurant with the least reviews.
SELECT b.name,
       r.text
FROM businesses b
JOIN reviews r
ON b.business_id = r.business_id_R
WHERE b.rating = (SELECT MIN(rating) FROM businesses)
AND  b.review_count = (SELECT MIN(review_count) FROM businesses WHERE rating = (SELECT MIN(rating) FROM businesses) ) 
# select the lowest review_count who's rating is 1 and have review_count equal to it 
ORDER BY  r.time_created DESC
LIMIT 1;  
   
