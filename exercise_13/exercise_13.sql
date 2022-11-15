-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount
SELECT country.country,
AVG(payment.amount)
AS avg
FROM payment
LEFT JOIN customer
ON customer.customer_id = payment.customer_id
LEFT JOIN address
ON address.address_id = customer.address_id
LEFT JOIN city
ON city.city_id = address.city_id
LEFT JOIN country
ON country.country_id = city.country_id
GROUP BY country.country_id
ORDER BY avg DESC
LIMIT 10