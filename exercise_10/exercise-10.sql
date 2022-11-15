-- find the category name of all inventory items that have never been rented
-- Similar to exercise 9 with an additonal join
SELECT category.name
FROM category
LEFT JOIN film_category
ON category.category_id = film_category.category_id
LEFT JOIN film
ON film_category.film_id = film.film_id
LEFT JOIN inventory
ON inventory.film_id = film.film_id
LEFT JOIN rental
ON rental.inventory_id = inventory.inventory_id
WHERE rental.rental_id IS NULL
AND inventory.inventory_id IS NOT NULL
