USE sakila;
# 1 List the number of films per category.
SELECT name, COUNT(film_id) AS Total_Films
FROM category c
INNER JOIN film_category fc
ON c.category_id = fc.category_id	
GROUP BY name;
# 2 Retrieve the store ID, city, and country for each store.
SELECT s.store_id, c.city, ct.country 
FROM store as s
	JOIN address as a
		ON s.address_id = a.address_id
	JOIN city AS c
		ON a.city_id = c.city_id
	JOIN country AS ct
        ON c.country_id = ct.country_id;
# 3 Calculate the total revenue generated by each store in dollars.
SELECT s.store_id, COUNT(amount) AS Total_Revenue_$
FROM STORE AS s
	JOIN inventory AS i
		ON s.store_id = i.store_id
	JOIN rental AS r
		ON i.inventory_id = r.inventory_id
	JOIN payment AS p
		ON r.rental_id = p.rental_id
GROUP BY s.store_id;
# 4 Determine the average running time of films for each category.
SELECT c.name, AVG(f.length) AS Average_Time
FROM category AS c
	JOIN film_category AS fc
		ON c.category_id = fc.category_id
	JOIN film AS f
		ON fc.film_id = f.film_id
GROUP BY c.name;
