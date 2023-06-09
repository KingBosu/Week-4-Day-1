--1. How many actors are there with the last name 'Wahlberg'?

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

--Answer = 2--

--2. How many payments were made between $3.99 and $5.99?

SELECT amount
FROM payment
WHERE amount > 3.99 and amount < 5.99;

--Answer = none --

--3. What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(inventory_id) FROM inventory 
GROUP BY film_id
ORDER BY COUNT(inventory_id) DESC;
SELECT title FROM film
WHERE film_id = 193;

--Answer = Crossroads Casualities

--4. How many customers have the last name ‘William’?

SELECT last_name
FROM customer
WHERE last_name = 'William';

--Answer = none

--5. What store employee (get the id) sold the most rentals?

SELECT staff_id, SUM(amount)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) DESC;
SELECT first_name, last_name FROM staff
WHERE staff_id = 1 OR staff_id = 2;

--Answer = Mike Hillyer, and Jon Stephens 

--6. How many different district names are there?

SELECT count(DISTINCT district) FROM address;

--Answer 378--

--7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(actor_id) FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;
SELECT title FROM film
WHERE film_id = 508;

--Answer = Lambs Cincinnati --

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name), store_id FROM customer
WHERE last_name LIKE '%es'AND store_id = 1
GROUP BY store_id;

--answer = 13 --

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)

SELECT COUNT(amount), amount FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;

--answer = 3 payments, 423.01, 425.01, and 427.01--

--10. Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT DISTINCT rating FROM film
SELECT rating, COUNT(title) FROM film
GROUP BY rating;

--Answer = 5 rating categories and PG-13 has the most with 223.