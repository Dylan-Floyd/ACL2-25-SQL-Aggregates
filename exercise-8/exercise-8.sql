-- rank of film category by times rented
-- include the name, count, and rank
SELECT category.name, COUNT(category.category_id), RANK() OVER (ORDER BY COUNT(category.category_id) DESC)
FROM film_category
LEFT JOIN category
ON film_category.category_id = category.category_id
LEFT JOIN film
ON film.film_id = film_category.film_id
RIGHT JOIN inventory
ON film.film_id = inventory.film_id
RIGHT JOIN rental
ON rental.inventory_id = inventory.inventory_id
GROUP BY category.name