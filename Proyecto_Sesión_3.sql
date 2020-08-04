/*1.	Obten el código de producto, nombre de producto y descripción de todos los productos.*/
SELECT productCode, productName, productDescription 
FROM products;

/*2.	Obten el número de orden, estado y costo total de cada orden.*/
SELECT od.orderNumber, o.status, SUM(od.quantityOrdered * od.priceEach) AS total_cost
FROM orders o RIGHT JOIN orderdetails od
ON o.orderNumber = od.orderNumber
GROUP BY od.orderNumber
ORDER BY od.orderNumber;

/*3.	Obten el número de orden, fecha de orden, línea de orden, nombre del producto, 
cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden.*/
SELECT od.orderNumber, o.orderDate, od.orderLineNumber, 
p.productName, od.quantityOrdered, od.priceEach
FROM orderdetails od JOIN products p ON od.productCode = p.productCode
RIGHT JOIN orders o ON od.orderNumber = o.orderNumber
ORDER BY 1, 3;

/*4.	Obtén el número de orden, nombre del producto, el precio sugerido de fábrica 
(msrp) y precio de cada pieza.*/
SELECT od.orderNumber AS order_number, p.productName AS prod_name, p.MSRP 
AS price_suggested, od.priceEach AS unit_price
FROM products p
RIGHT JOIN orderdetails od
ON p.productCode = od.productCode
ORDER BY 1,2;

/*5.	Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.*/
SELECT o.customerNumber, c.customerName, o.orderNumber, c.state
FROM orders o LEFT JOIN customers c
ON o.customerNumber = c.customerNumber
ORDER BY o.customerNumber, o.orderNumber;

/*6.	Obtén los clientes que no tienen una orden asociada.*/
SELECT c.customerNumber, c.customerName
FROM customers c LEFT JOIN orders o
ON o.customerNumber = c.customerNumber
WHERE o.orderNumber IS NULL
ORDER BY o.customerNumber;

/*7.	Obtén el apellido de empleado, nombre de empleado, nombre de cliente, 
número de cheque y total, es decir, los clientes asociados a cada empleado.*/
SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM payments p RIGHT JOIN customers c ON p.customerNumber = c.customerNumber
RIGHT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
ORDER BY e.lastName, e.firstName;

