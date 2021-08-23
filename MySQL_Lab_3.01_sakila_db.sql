use sakila;

-- ACTIVITY 1.
-- 1. Drop column picture from staff.

alter table sakila.staff 
drop column picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
-- 	  Update the database accordingly.
--  Get information on Tammy Sanders
select * from customer c where c.first_name = 'Tammy' and c.last_name = 'Sanders';

insert into sakila.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password,last_update)
values (3,'TAMMY', 'SANDERS',79, 'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy',null,current_timestamp);

update staff set 
staff_id = 3,
first_name = 'Tammy',
last_name = 'Sanders',
address_id = 79,
email = 'TAMMY.SANDERS@sakilacustomer.org',
store_id = 2,
active = 1,
username = 'Tammy',
password = null ,
last_update = current_timestamp
where staff_id = 3
; 

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
--    You can use current date for the rental_date column in the rental table. 
--    Hint: Check the columns in the table rental and see what information you would need to add there. 
--    You can query those pieces of information. For eg.
--    you would notice that you need customer_id information as well. 
--    To get that you can use the following query: select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

-- 1. Get information about 'Academy Dinosaur', customer charlotte hunter and Mike Hillyer
select * from film f where f.title = 'Academy Dinosaur';
select * from customer c where c.first_name = 'Charlotte' and c.last_name = 'Hunter';
select * from staff s where s.first_name  = 'Mike' and s.last_name  = 'Hillyer';

-- insert rental information into rental table.
insert into sakila.rental(rental_date, inventory_id,customer_id,return_date,staff_id, last_update)
values (current_date, 1, 130, null,1, current_timestamp);