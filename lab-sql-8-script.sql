	-- 1.
select title, length, rank() over (order by length desc) from film
where length <> 0 or length is not null or length <> '';

	-- 2.
select title, length, rating, rank() over (partition by rating order by length desc) from film
where length <> 0 or length is not null or length <> '';

	-- 3.
select c.name category, count(*) number_of_films from category c
left join film_category fc on c.category_id = fc.category_id
group by category
order by number_of_films desc;

	-- 4.
select concat(first_name, ' ', last_name) actor, count(*) number_of_films
from film_actor fa
join actor a on fa.actor_id = a.actor_id
group  by fa.actor_id
order by number_of_films desc;

	-- 5.
select concat(first_name, ' ', last_name) customer, count(*) number_of_films
from rental r
join customer c on r.customer_id = c.customer_id
group by r.customer_id
order by number_of_films desc;

	-- BONUS.
select title, count(*) number_of_rentals from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
group by title
order by number_of_rentals desc;