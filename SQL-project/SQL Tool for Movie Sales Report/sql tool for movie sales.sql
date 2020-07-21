
select * from actor limit 100;
select * from film_actor limit 100;
select * from film limit 100;
select * from language limit 100;
select * from film_category limit 100;
select * from category limit 100;

select rating, 
max(rental_rate) from film group by 1;

select rating, 
count(distinct film_id) from film group by rating;

SELECT CASE WHEN length > 0 and length < 60 THEN 'short'			
		    WHEN length < 120 THEN 'standard'            
		    WHEN length >=120  THEN 'long'           
                         ELSE 'others'            
                         END as film_length, 
                         count(film_id) from film            
                         group by 1
                         order by 2;


select * from actor where last_name= 'Johansson';

select count(distinct last_name) from actor;

select last_name, 
count(*) as num from actor group by last_name 
having count(*) = 1;

select last_name, 
count(*) as num from actor group by last_name 
having count(*) > 1;

select film_id, 
count(distinct actor_id) as num_of_actor 
from film_actor group by film_id order by num_of_actor desc;

select actor_id, 
count(distinct film_id) as num_of_film 
from film_actor group by actor_id order by num_of_film desc;


select f.*,l.name as languge_name
from film as f
left join
language as l
on f.language_id=l.language_id;


select fa.*, a.first_name,a.last_name, f.title  from 
film_actor as fa,
actor as a,
film as f
where fa.actor_id = a.actor_id
and fa.film_id=f.film_id;


select f.*, c.name as category_name 
from
film as f
left join
film_category as fc
on f.film_id=fc.film_id
left join
category as c
on fc.category_id=c.category_id;


select * from film where rating in ('G','PG-13','PG')
UNION
select * from film where rental_rate > 2;



select count(rental_id) as volume from rental
where rental_date 
between '2005-05-01 00:00:00' and '2005-08-31 23:59:59';


select 
substring(rental_date, 1,7) as rental_month, 
count(rental_Id) as volume from rental
where rental_date between '2005-05-01 00:00:00' and '2005-08-31 23:59:59' group by 1;


select s.first_name, 
s.last_name, 
count(r.rental_Id) as volume from 
rental as r
left join
staff as s
on r.staff_id=s.staff_id
group by 1,2
order by volume desc;


select film_id, store_id, count(inventory_id) from inventory
group by 1,2;


select f.title as film_name, i.film_id, i.store_id, count(*)
from
inventory as i
left join
film as f on i.film_id=f.film_id
group by 1,2,3;

select f.title as film_name, 
f.film_id,  -- be careful about which film_id you are using. if you select film_id from inventory table, you will get NULL value
c.name as category, 
i.store_id, 
count(i.film_id) as num_of_stock -- be careful which column you want to count to get the inventory number. if you count(*), NULL will be counted as 1
from
film as f 
left join inventory as i
on i.film_id=f.film_id
left join
film_category as fc on f.film_id=fc.film_id
left join
category as c on fc.category_id=c.category_id
group by 1,2,3,4;


-- drop table inventory_rep;
create table inventory_rep as
select f.title as film_name, 
f.film_id, 
c.name as category, 
i.store_id, 
count(i.film_id) as num_of_stock 
from
film as f 
left join inventory as i
on i.film_id=f.film_id
left join
film_category as fc on f.film_id=fc.film_id
left join
category as c on fc.category_id=c.category_id
group by 1,2,3,4;



select * from inventory_rep where film_id in (
select film_id from inventory_rep where num_of_stock = 0);


select substring(payment_date, 1,7) as payment_month, sum(amount) as revenue from payment
where payment_date between '2005-05-01 00:00:00' and '2005-08-31 23:59:59' group by 1;


select store_id, sum(amount) as revenue from 
payment p
join
staff s
on p.staff_id=s.staff_id
where payment_date between '2005-05-01 00:00:00' and '2005-05-31 23:59:59' group by 1;



select f.film_id, f.title, c.name as category, count(distinct rental_id) as times_rented 
from 
rental r
left join inventory i
on i.inventory_id=r.inventory_id
left join film f
on i.film_id=f.film_id
left join film_category fc
on f.film_id=fc.film_id
left join category c
on fc.category_id=c.category_id
group by 1,2,3
order by 4;
