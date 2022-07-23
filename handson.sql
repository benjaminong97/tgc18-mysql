1
select city, phone, country from offices

2
select * from orders where comments like "%fedex%"

3
select customerName, contactFirstName, contactLastName from customers order by customerName desc

4
SELECT * FROM employees where jobTitle = "Sales Rep" and (officeCode =1 or officeCode =2 or officeCode = 3)
	and (firstName like "%son%" or lastName like "%son%");

5
SELECT orderNumber, customerName, contactFirstName, contactLastName FROM 
    orders join customers on orders.customerNumber=customers.customerNumber
    where orders.customerNumber = "124";

6
SELECT productName, orderdetails.orderNumber, orderdetails.productCode, 
orderdetails.quantityOrdered, orderdetails.priceEach, orderdetails.orderLineNumber FROM orderdetails
join products on orderdetails.productCode=products.productCode;

-- orderdetails.* to show from a certain table <table.*>

-- in class exercise
-- count how many customers there are with sales rep 

select count(salesRepEmployeeNumber) from customers 

SELECT sum(amount) FROM payments where year(paymentDate) = 2003 and month(paymentDate) = 06;

-- find the total amount paid by customers in the month of june 2013

7
-- Display sum of all the payments made by each company from the USA. 
SELECT customerName, sum(amount) FROM payments
join customers on payments.customerNumber = customers.customerNumber
where country = "USA"
group by customerName

8
-- Show how many employees are there for each state in the USA
SELECT state, count(*) FROM employees join offices
on employees.officeCode = offices.officeCode
where country = "USA"
group by state

9
SELECT customerName, avg(amount) FROM payments join customers on payments.customerNumber = 
customers.customerNumber 
group by customerName, customer.customerNumber

10
select customerNumber, avg(amount) from payments
group by customerNumber 
having sum(amount) > 10000

11
SELECT productName, orderdetails.productCode, count(*) as "times_ordered" FROM products
join orderdetails on products.productCode = orderdetails.productCode
group by productName, orderdetails.productCode
order by times_ordered (can still use count(*)) desc
limit 10;

12
SELECT * FROM orders
where orderDate > "2003-01-01" and orderDate < "2003-12-31";

13
SELECT month(orderDate), count(*) FROM orders
where orderDate > "2003-01-01" and orderDate < "2003-12-31"
group by month(orderDate);