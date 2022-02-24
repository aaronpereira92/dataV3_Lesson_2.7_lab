-- Lab | SQL Join (Part 1) BY Aaron Pereria

USE sakila;

-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.
/*
Which tables are needed: category and film_category
Do they have a common column: category_id
Lets do inner join
*/

SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;

SELECT scat.category_id, scat.name as Category , count(fcat.film_id) FROM sakila.category as scat
JOIN film_category as fcat
ON scat.category_id = fcat.category_id
GROUP BY scat.name;

-- 2. Display the total amount rung up by each staff member in August of 2005.
/*
Which tables are needed: staff an payment
Do they have a common column: staff_id
Lets do inner join
*/
SELECT * FROM sakila.staff;
SELECT * FROM payment;

SELECT s.staff_id, s.first_name, SUM(p.amount) AS "TOTAL AMOUNT" FROM sakila.staff AS s
JOIN sakila.payment AS p
ON s.staff_id = p.staff_id
GROUP BY staff_id; 

-- 3. Which actor has appeared in the most films?
-- Answer: Gina Degeneres
/*
Which tables are needed: actor and film_actor
Do they have a common column: actor_id
Lets do inner join
*/
SELECT * FROM actor;
SELECT * FROM film_actor;

SELECT fa.actor_id, a.first_name, a.last_name, COUNT(fa.actor_id) AS total_films FROM film_actor AS fa
JOIN sakila.actor AS a
ON fa.actor_id = a.actor_id
GROUP by a.actor_id
ORDER BY total_films DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
-- Answer: Eleanor Hunt with 46 rentals
/*
Which tables are needed: customer and rental
Do they have a common column: customer_id
Lets do inner join
*/

SELECT c.customer_id, c.first_name, c.last_name, count(r.customer_id) AS total_no_rentals FROM sakila.customer AS c
JOIN sakila.rental AS r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY total_no_rentals DESC; 

-- 5 . Display the first and last names, as well as the address, of each staff member.
/*
Which tables are needed: staff and address
Do they have a common column: address_id
Lets do inner join
*/
SELECT * FROM staff;
SELECT  * FROM address;

SELECT ss.staff_id, ss.first_name, ss.last_name, sa.address  FROM staff AS ss
JOIN sakila.address AS sa
ON ss.address_id = sa.address_id;

-- 6. List each film and the number of actors who are listed for that film.
/*
Which tables are needed: film and film_actor
Do they have a common column: film_id
Lets do inner join
*/
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT f.film_id, f.title, count(a.actor_id) AS number_of_actors FROM sakila.film as f
JOIN sakila.film_actor as a
ON f.film_id = a.film_id
GROUP BY f.film_id
ORDER BY number_of_actors desc;

-- 7. Using the tables payment and customer and the JOIN command, 
-- list the total paid by each customer. List the customers alphabetically by last name.
/*
Which tables are needed: payment and customer
Do they have a common column: customer_id
Lets do inner join
*/
SELECT * FROM payment;
SELECT * FROM customer;

SELECT c.customer_id, c.last_name, SUM(p.amount) AS "Total Paid" FROM sakila.customer as c
JOIN sakila.payment as p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
order by c.last_name;

-- 8. List number of films per category
-- Answer: same as question no. 1
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;

SELECT scat.category_id, scat.name as Category , count(fcat.film_id) FROM sakila.category as scat
JOIN film_category as fcat
ON scat.category_id = fcat.category_id
GROUP BY scat.name;

