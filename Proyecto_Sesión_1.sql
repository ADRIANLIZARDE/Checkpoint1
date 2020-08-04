/*1.	Dentro del mismo servidor de bases de datos, conéctate al esquema classicmodels.*/
show databases;
use classicmodels;
/*2. Dentro de la tabla employees, obtén el apellido de todos los empleados.*/
select lastname from employees;

/*3.	Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados.*/
select lastName, firstname, jobTitle from employees;

/*4.	Dentro de la tabla employees, obtén todos los datos de cada empleado.*/
select lastName, firstname, jobTitle from employees;select * from employees;

/*5.	Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos 
los empleados que tengan el puesto Sales Rep.*/
select lastName, firstname, jobTitle 
from employees
where jobTitle = "Sales Rep";

/*6.	Dentro de la tabla employees, obtén el apellido, nombre, puesto y código de oficina de todos los 
empleados que tengan el puesto Sales Rep y código de oficina 1.*/
select lastName, firstname, officeCode
from employees
where jobTitle = "Sales Rep"
and officeCode = 1;

/*9.	Dentro de la tabla employees, obten el apellido, nombre y puesto de todos los empleados 
que tengan un puesto distinto a Sales Rep.*/
select lastName, firstname, jobTitle
from employees
where jobTitle <> "Sales Rep";

/*10.	Dentro de la tabla employees, obtén el apellido, nombre y código de oficina 
de todos los empleados cuyo código de oficina sea mayor a 5.*/
select lastName, firstname, officeCode
from employees
where jobTitle = "Sales Rep"
and officeCode > 5;

/*11.	Dentro de la tabla employees, obtén el apellido, nombre y código 
de oficina de todos los empleados cuyo código de oficina sea menor o igual 4.*/
select lastName, firstname, officeCode
from employees
where jobTitle = "Sales Rep"
and officeCode <= 4;

/*12.	Dentro de la tabla customers, obtén el nombre, país y estado de todos los 
clientes cuyo país sea USA y cuyo estado sea CA.*/
select customerName, country, state
from customers
where country = "USA"
and state = "CA";

/*13.	Dentro de la tabla customers, obtén el nombre, país, estado y límite de crédito de todos 
los clientes cuyo país sea, USA, cuyo estado sea CA y cuyo límite de crédito sea mayor a 100000.*/ 
select customerName, country, state, creditLimit
from customers
where state = "CA" 
and creditLimit > 100000;

/*14.	Dentro de la tabla customers, obtén el nombre y país de todos los clientes cuyo 
país sea USA o France.*/
select customerName, country
from customers
where country = "USA" or country = "France";

/*15.	Dentro de la tabla customers, obtén el nombre, país y límite de crédito de todos los 
clientes cuyo país sea USA o France y cuyo límite de crédito sea mayor a 100000. Para este 
ejercicio ten cuidado con los paréntesis.*/
select customerName, country, creditLimit
from customers
where country = "USA" or country = "France"
and creditlimit > 100000;

/*16.	Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas 
oficinas que se encuentren en USA o France.*/
Select officeCode, city, phone, country
from offices
where country in ('USA', 'France');

/*17.	Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas 
que no se encuentren en USA o France.*/
Select officeCode, city, phone, country
from offices
where country <>"USA" and country <> "France";

/*18.	Dentro de la tabla orders, obtén el número de orden, número de cliente, estado y fecha de envío de todas las 
órdenes con el número 10165, 10287 o 10310.*/
select orderNumber, customerNumber, status, shippedDate
from orders
where orderNumber IN (10165, 10287, 10310);

/*19.	Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados 
por apellido de forma ascendente.*/
select contactLastName, contactFirstName
from customers
order by contactLastName;

/*20.	Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados 
por apellido de forma descendente.*/
select contactLastName, contactFirstName
from customers
order by contactLastName desc;

/*21.	Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados 
por apellido de forma descendente y luego por nombre de forma ascendente.*/
select contactLastName, contactFirstName
from customers
order by contactLastName desc, contactFirstName asc;

/*22.	Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de 
crédito de los cinco clientes con el límite de crédito más alto (top 5).*/
select customerNumber, customerName, creditLimit
from customers
order by creditLimit desc
limit 5;

/*23.	Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de 
crédito de los cinco clientes con el límite de crédito más bajo.*/
select customerNumber, customerName, creditLimit
from customers
order by creditLimit
limit 5;


