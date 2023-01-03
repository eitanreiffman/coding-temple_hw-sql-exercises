-- Homework Exercises --

--========================================================================================

-- 1. How many actors are there with the last name ‘Wahlberg’? --

select count(*)
from actor
where last_name = 'Wahlberg';

-- Answer: 2

--========================================================================================

-- 2. How many payments were made between $3.99 and $5.99? --

select count(*)
from payment
where amount > 3.99 and amount < 5.99;

-- Answer: 3,431 (not including 3.99 and 5.99)
-- Answer: 5,607 (including 3.99 and 5.99)

--========================================================================================

-- 3. What films have exactly 7 copies? (search in inventory) --

select count(*), film_id
from inventory
group by film_id
having count(*) = 7;

-- Answer: See Code

--========================================================================================

-- 4. How many customers have the first name ‘Willie’? --

select count(*)
from customer
where first_name = 'Willie';

-- Answer: 2

--========================================================================================

-- 5. What store employee (get the id) sold the most rentals (use the rental table)? --

select count(*), staff_id
from rental
group by staff_id;

-- Answer: Store Employee #1

--========================================================================================

-- 6. How many unique district names are there? --

select count(distinct district)
from address;

-- Answer: 378

--========================================================================================

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

select count(*), film_id
from film_actor
group by film_id
order by count(*) desc;

-- Answer: Film ID 508

--========================================================================================

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) --

select count(*)
from customer
where last_name like '%es'
and store_id = 1;

-- Answer: 13

--========================================================================================

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--    with ids between 380 and 430? (use group by and having > 250) --

select count(*) from (
	select count(*), amount
	from payment
	where customer_id > 380 and customer_id < 430
	group by amount
	having count(*) > 250
) as a;

-- Answer: 3

--========================================================================================

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total? --

select count(distinct rating)
from film;

select rating, count(*) 
from film
group by rating
order by count(*) desc;

-- Answer: 5 rating categories; PG-13 has the most movies

--========================================================================================