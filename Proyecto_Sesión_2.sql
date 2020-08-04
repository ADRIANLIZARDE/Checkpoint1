use classicmodels;
/*1.	Dentro de la tabla employees, obten el número de empleado, apellido y nombre de 
todos los empleados cuyo nombre empiece con a.*/
select employeeNumber, lastName, firstName
from employees
where firstName Like "a%";

/*2.	Dentro de la tabla employees, obten el número de empleado, apellido y nombre de 
todos los empleados cuyo nombre termina con on.*/
select employeeNumber, lastName, firstName
from employees
where firstName like "%on";

/*3.	Dentro de la tabla employees, obten el número de empleado, apellido y nombre de 
todos los empleados cuyo nombre incluye la cadena on.*/
select employeeNumber, lastName, firstName
from employees
where firstName like "%on%";

/*4.	Dentro de la tabla employees, obten el número de empleado, apellido y nombre de 
todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.*/
select employeeNumber, lastName, firstName
from employees
where length(firstName)=3
and firstName LIKE "t%"
and firstName LIKE "%m";

/*5.	Dentro de la tabla employees, obten el número de empleado, apellido y nombre de 
todos los empleados cuyo nombre no inicia con B.*/
select employeeNumber, lastName, firstName
from employees
where firstName not like "b%";

/*6.	Dentro de la tabla products, obten el código de producto y nombre de los productos 
cuyo código incluye la cadena _20.*/
select productCode, productName
from products
where productCode like '%_20';

/*7.	Dentro de la tabla orderdetails, obten el total de cada orden.*/
select orderNumber, ROUND(SUM(total), 2) as total_orden
from (select orderNumber, quantityOrdered * priceEach as total
	from orderdetails) as subquery
group by orderNumber
order by orderNumber;

/*8.	Dentro de la tabla orders obten el número de órdenes por año*/
select EXTRACT(year from orderDate) as año, COUNT(*)
from orders
group by año;

/*9.	Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.*/
select lastName, firstName
from employees
where officeCode in (
select officeCode 
from offices 
where country like 'USA');

/*10.	Obten el número de cliente, número de cheque y cantidad del cliente que ha 
realizado el pago más alto.*/
select customerNumber, checkNumber, amount
from payments
where amount = (select MAX(amount)
from payments);

/*11.	Obten el número de cliente, número de cheque y cantidad de aquellos clientes 
cuyo pago es más alto que el promedio.*/
select customerNumber, checkNumber, amount
from payments
where amount > (select avg(amount)
from payments);

/*12.	Obten el nombre de aquellos clientes que no han hecho ninguna orden.*/
select customerNumber
from customers
where customerNumber not in (select distinct(customerNumber)
from payments);

/*13.	Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.*/
SELECT AVG(cuenta) AS prom_productos, MAX(cuenta) AS max_productos, MIN(cuenta) AS min_productos
FROM (SELECT orderNumber, COUNT(*) as cuenta
FROM orderdetails
GROUP BY orderNumber) AS sq;

/*14.	Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.*/
select estado, SUM(cuenta) as ordenes_estado
from (select customerNumber, COUNT(*) as cuenta, (select c.state from customers c 
where c.customerNumber = o.customerNumber) as estado
from orders o
group by estado, 1) sq
group by estado
order by 2;

