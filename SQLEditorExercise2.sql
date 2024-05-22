/* joins: select all the computers from the products table:
using the products table and the categories table, 
return the product name and the category name */
 SELECT products.Name, categories.Name
 FROM products
 INNER JOIN categories ON categories.CategoryID = products.CategoryID
 WHERE categories.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings 
that have a rating of 5 */
 SELECT *
 FROM products
 INNER JOIN reviews ON reviews.ProductID = products.ProductID
 WHERE reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  
use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, Sum(sales.Quantity) AS Total
FROM sales
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY Total DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category 
for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
INNER JOIN categories ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name ='Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name, Sum(sales.Quantity) as 'Total Sold', Sum(sales.Quantity * sales.PricePerUnit) as 'Total Price'
 FROM products
 INNER JOIN SALES on sales.ProductID = products.ProductID
 WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
(only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, MIN(reviews.Rating)
FROM products
INNER JOIN reviews ON reviews.ProductID = products.ProductID
WHERE products.ProductID = 857
GROUP BY products.ProductID, reviews.Reviewer
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity)
FROM sales
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON products.ProductID = sales.ProductID
GROUP BY employees.EmployeeID, products.ProductID
ORDER BY employees.FirstName;