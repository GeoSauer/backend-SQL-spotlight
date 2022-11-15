-- return the title, description, release year and list of actors returned as a JSON blob
-- for the movie Airplane Sierra
    SELECT film.title, film.description, film.release_year,
COALESCE(json_agg(to_jsonb(actor))
         FILTER (WHERE actor.actor_id IS NOT NULL), '[]') AS actors
FROM film
LEFT JOIN film_actor 
ON film.film_id = film_actor.film_id
LEFT JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE film.title = 'Airplane Sierra'
GROUP BY film.title, film.description, film.release_year

