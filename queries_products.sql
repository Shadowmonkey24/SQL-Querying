-- Comments in SQL Start with dash-dash --
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('chair', 44.00, 'f');



INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('stool', 25.99, 't');



INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('table', 124.00, 'f');



SELECT * FROM products;



SELECT name FROM products;



SELECT name, price FROM products;


INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('hammock', 99.00, 't');



SELECT * FROM products WHERE can_be_returned;



SELECT * FROM products WHERE price < 44.00;


SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;


UPDATE products SET price = price - 20;

DELETE FROM products WHERE price < 25;


UPDATE products SET price = price + 20;


UPDATE products SET can_be_returned = 't';
Playstore Queries
queries_playstore.sql
-- Query 0
SELECT * FROM analytics;

-- 1. Find the entire record for the app with an ID of `1880`.
SELECT * FROM analytics 
  WHERE id = 1880;

-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name FROM analytics
   WHERE last_updated = '2018-08-01';

-- 3. Count the number of apps in each category, e.g. "Family | 1972".
SELECT category, COUNT(*) FROM analytics 
  GROUP BY category;

-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT * FROM analytics 
  ORDER BY reviews DESC 
  LIMIT 5;

-- 5. Find the full record of the app that has the most reviews 
SELECT * FROM analytics 
  WHERE rating >= 4.8 
  ORDER BY reviews DESC
  LIMIT 1;

-- 6. Find the average rating for each category ordered 
SELECT category, AVG(rating) FROM analytics 
  GROUP BY category 
  ORDER BY avg DESC;

-- 7. Find the name, price, and rating of the most 
SELECT app_name, price, rating FROM analytics 
  WHERE rating < 3 
  ORDER BY price DESC 
  LIMIT 1;

-- 8. Find all records with a min install not exceeding 50, that have a rating. 
SELECT * FROM analytics 
  WHERE min_installs <= 50 
    AND rating IS NOT NULL 
  ORDER BY rating DESC;

-- 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name FROM analytics
  WHERE rating < 3 AND reviews >= 10000;

-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics
  WHERE price BETWEEN 0.1 and 1 
  ORDER BY reviews DESC 
  LIMIT 10;

-- 11. Find the most out of date app. 

SELECT * FROM analytics
  ORDER BY last_updated LIMIT 1;

-- 12. Find the most expensive app (the query is very similar to #11).

SELECT * FROM analytics
  ORDER BY price DESC LIMIT 1;

-- 13. Count all the reviews in the Google Play Store.
SELECT SUM(reviews) AS "All the Reviews" FROM analytics;

-- 14. Find all the categories that have more than 300 apps in them.
SELECT category FROM analytics 
  GROUP BY category 
  HAVING COUNT(*) > 300;

-- 15. Find the app that has the highest proportion of reviews to min_installs,

SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion
  FROM analytics
  WHERE min_installs >= 100000
  ORDER BY proportion DESC
  LIMIT 1;