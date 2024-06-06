-- 1.ist the number of films per category.
select * from category;
select * from film;
SELECT c.name AS category_name, COUNT(f.film_id) AS film_count
FROM film f
JOIN category c ON c.category_id = f.film_id
GROUP BY c.name;

-- 2.Display the first and the last names, as well as the address, of each staff member.
select* from address;
select * from staff;
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a ON s.address_id = a.address_id;


-- 3.Display the total amount rung up by each staff member in August 2005.
select * from payment;
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.first_name, s.last_name;

-- 4.List all films and the number of actors who are listed for each film.
SELECT f.title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title
ORDER BY f.title;

-- .5 Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer.
--  List the customers alphabetically by their last names.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.last_name, c.first_name;

