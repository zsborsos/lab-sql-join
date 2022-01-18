-- Lab | SQL Join
-- Zsanett Borsos
-- 1. List number of films per category.
SELECT sakila.category.category_id, sakila.category.name, COUNT(sakila.film_category.film_id) AS 'Number of movies' FROM sakila.category
JOIN sakila.film_category ON
sakila.film_category.category_id = sakila.category.category_id
GROUP BY sakila.film_category.category_id, sakila.category.name
ORDER BY COUNT(sakila.film_category.film_id);

-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT sakila.staff.first_name, sakila.staff.last_name, sakila.address.address FROM sakila.staff
JOIN sakila.address ON 
sakila.staff.address_id =  sakila.address.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
SELECT sakila.payment.staff_id, sakila.staff.first_name, sakila.staff.last_name, SUM(sakila.payment.amount) FROM sakila.payment
JOIN sakila.staff ON
sakila.payment.staff_id = sakila.staff.staff_id
WHERE sakila.payment.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY sakila.payment.staff_id;

-- 4. List each film and the number of actors who are listed for that film.
SELECT sakila.film.title, COUNT(sakila.film_actor.actor_id) AS 'Number of actors' FROM sakila.film_actor
JOIN sakila.film ON
sakila.film.film_id = sakila.film_actor.film_id
GROUP BY sakila.film.title
ORDER BY COUNT(sakila.film_actor.actor_id) DESC;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT sakila.customer.first_name, sakila.customer.last_name, SUM(sakila.payment.amount) AS 'Total paid by customer' FROM sakila.payment
JOIN sakila.customer ON
sakila.customer.customer_id = sakila.payment.customer_id
GROUP BY sakila.payment.customer_id
ORDER BY sakila.customer.last_name;