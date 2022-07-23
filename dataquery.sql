select * from employees

select <column> from <table> where <condition for row>

--- use LIKE with wildcard (%) to match partial strings

--- %sales% will match as long as sales appears in the job title 

--- %sales --> match if ends with sales

--- sales% ---> match if begins with sales 

-- two way join
select * from <table1> join <table2> on <table1.column> = <table2.column>


-- use left join if all rows on the left are to be included / right join if all rows on the right are to be included 
-- full outer join --> left join + right join 
select * from <table1> left join <table2> on <table1.column> = <table2.column> 


-- for each customer, show the name of the sales rep and their office number 
-- note -> all columns are available for multiple joins 
-- where is after the join 
select * from customers join employees
    on customers.salesRepEmployeeNumber = employees.employeeNumber join offices on employees.officeCode = offices.officeCode

-- if two columns with same name, use <table.column> --> applies to both select and where 

-- join -> where -> select 

-- Month, year and day functions for date time eg YEAR(paymentDate)

-- sql can join on any columns --> usually we join primary and foreign keys 

-- aggregate functions 
-- count --> how many rows are there? --> count (*) from employees eg
-- sum --> sum the values of a column across all the rows --> eg select sum(quantityOrdered) from orderdetails
-- can mix and match eg select sum(quantityOrdered) from orderdetails where productCode = <productcode>
-- can do some math select sum(quantityOrdered * priceEach) from orderdetails where productCode = <productcode>

-- count how many customers there are with sales rep 

select count(salesRepEmployeeNumber) from customers 

-- "for each" --> signal to use groupby
-- what is the criteria for each group? 
-- select <group>, <aggregate function> from <table> groupby <group> --> whatever you group by u must select 

-- get the average credit limit by country 
SELECT country, avg(creditLimit) FROM customers 
group by country

-- show the credit limit and number of customers per country 
SELECT country, avg(creditLimit) FROM customers as "avg_credit_limit", count(*)
group by country

-- where happens before group by
-- where filters the joint table 
-- having filters the group

SELECT country, firstName, lastName, email, avg(creditLimit), count(*) FROM customers
join employees on customers.salesRepEmployeeNumber = employees.employeeNumber 
where salesRepEmployeeNumber = 1504
group by country, firstName, lastName, email

-- 1 (from and join) 2 (where works on join table) 3 (group by works on filtered join table) 4 (select) 5 (order by works afterwards) 6(limit)
SELECT country, firstName, lastName, email, avg(creditLimit), count(*) FROM customers
join employees on customers.salesRepEmployeeNumber = employees.employeeNumber 
where salesRepEmployeeNumber = 1504
group by country, firstName, lastName, email
order by avg(creditLimit) desc
limit 3

-- subqueries 
--> all select statements returns a table --> possible to perform a query on a returned table 
-- eg product code of the most ordered product 
-- selecting from a temporary table 

-- when select only returns one value it is treated as a primitive 
-- the sub query is usually to provide a value needed for the outer query 
-- when something has to be calculated (eg something greater than xyz - that can be derived from the database)

-- if u select and it only returns column it is an array 

-- 
-- find sales rep whose customers payment make up more than 10% of all payment 
-- find each sales rep how much money they made for the company
select employees.employeeNumber, sum(amount) from employees join customers 
on employees.employeeNumber = customers.salesRepEmployeeNumber 
join payments on customers.customerNumber = payments.customerNumber 
group by employees.employeeNumber 
having sum(amount) > (select sum(amount) *0.1 from payments) 