-- 1) Statement to create the Contact table 
create database Assignment;

create table Contact(
contactID int, CompanyID int,
firstNAME varchar(45), lastNAME varchar(45), Street varchar(45), City varchar(45),
State varchar (2), Zip varchar(10), IsMain boolean, Email varchar (45), Phone varchar(12)
);

INSERT INTO Contact (contactID, CompanyID, firstNAME, lastNAME, Street, City, State, Zip, IsMain, Email, Phone)
VALUES
(1, 101, 'John', 'Doe', '123 Elm St', 'Springfield', 'IL', '62701', TRUE, 'john.doe@example.com', '555-1234'),
(2, 102, 'Jane', 'Smith', '456 Oak St', 'Chicago', 'IL', '60601', FALSE, 'jane.smith@example.com', '555-5678'),
(3, 103, 'Emily', 'Johnson', '789 Pine St', 'Aurora', 'IL', '60505', TRUE, 'emily.johnson@example.com', '555-8765'),
(4, 104, 'Michael', 'Brown', '101 Maple St', 'Peoria', 'IL', '61602', FALSE, 'michael.brown@example.com', '555-4321'),
(5, 105, 'Sarah', 'Davis', '202 Cedar St', 'Champaign', 'IL', '61820', TRUE, 'sarah.davis@example.com', '555-6789');

select * from Contact;

-- 2) Statement to create the Employee table 


CREATE TABLE employee (
    EmployeeID INT,
    firstNAME VARCHAR(45),
    lastNAME VARCHAR(45),
    salary DECIMAL(10, 2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

INSERT INTO Employee (EmployeeID, firstNAME, lastNAME, salary, HireDate, JobTitle, Email, Phone)
VALUES
(1, 'Alice', 'Green', 55000.00, '2021-03-01', 'Manager', 'alice.green@example.com', '555-2233'),
(2, 'Bob', 'White', 45000.00, '2020-05-15', 'Developer', 'bob.white@example.com', '555-4455'),
(3, 'Charlie', 'Black', 40000.00, '2019-07-30', 'Designer', 'charlie.black@example.com', '555-6789'),
(4, 'Diana', 'Blue', 60000.00, '2022-02-20', 'Engineer', 'diana.blue@example.com', '555-1122'),
(5, 'Eve', 'Red', 35000.00, '2023-01-05', 'Intern', 'eve.red@example.com', '555-3344');
select * from employee;

-- 3) Statement to create the ContactEmployee table 
 CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY, 
    contactID INT, 
    EmployeeID INT, 
    ContactDate DATE, 
    Description VARCHAR(100), 
    EmployeeName VARCHAR(45)
);
 
INSERT INTO ContactEmployee
VALUES
(1, 1, 1, '2025-02-01', 'Meeting about new project.','Sarah Thompson'),
(2, 2, 2, '2025-02-02', 'Discussing website update requirements.','John Mitchell'),
(3, 3, 3, '2025-02-03', 'Reviewing design drafts.',' Dianne Connor'),
(4, 4, 4, '2025-02-04', 'Discussing engineering tasks for the new product.','Jack Lee'),
(5, 5, 5, '2025-02-05', 'Internship evaluation and feedback.','Olivia Martinez');

 select * from ContactEmployee;
 
 
 INSERT INTO Company (companyID, companyNAME, Street, City, State, Zip)
VALUES
(101, 'Tech Solutions', '123 Tech St', 'Springfield', 'IL', '62701'),
(102, 'Creative Designs', '456 Creative Ave', 'Chicago', 'IL', '60601'),
(103, 'Innovative Systems', '789 Innovation Blvd', 'Aurora', 'IL', '60505'),
(104, 'Global Enterprises', '101 Global Rd', 'Peoria', 'IL', '61602'),
(105, 'NextGen Technologies', '202 Future St', 'Champaign', 'IL', '61820');
 
 create table company(
 companyID int, companyNAME varchar (45), Street varchar(45), City varchar(45),
State varchar (2), Zip varchar(10)
);


select * from company;

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number
-- to 215-555-8800 


UPDATE Employee
SET Phone = '215-555-8800'
WHERE firstNAME = 'Lesley' AND lastNAME = 'Bland';

-- 5) In the Company table, the statement that changes the name of “Urban
-- Outfitters, Inc.” to “Urban Outfitters”
SET SQL_SAFE_UPDATES = 1;
UPDATE Company
SET companyNAME = 'Urban Outfitters'
WHERE companyNAME = 'Urban Outfitters, Inc.';


-- 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
-- event with Jack Lee (one statement).

DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 3; 

 
--  7) Write the SQL SELECT query that displays the names of the employees that
-- have contacted Toll Brothers (one statement). Run the SQL SELECT query in
-- MySQL Workbench. Copy the results below as well. 

SELECT e.firstNAME, e.lastNAME
FROM ContactEmployee ce
JOIN Employee e ON ce.EmployeeID = e.EmployeeID
JOIN Contact c ON ce.contactID = c.contactID
JOIN Company co ON c.CompanyID = co.companyID
WHERE co.companyNAME = 'Toll Brothers';

 
--  8) What is the significance of “%” and “_” operators in the LIKE statement? 
-- %: The % symbol is used to represent any sequence of characters
--  (including an empty sequence) in the LIKE pattern. 
-- For example, 'A%' would match any string that starts with 'A'.
-- _: The _ symbol represents a single character in the LIKE pattern. 
-- For example, 'A__' would match any string that starts with 
-- 'A' and is followed by exactly two characters.

-- 9) Explain normalization in the context of databases
-- Normalization is the process of organizing data in a database to 
-- reduce redundancy and dependency. It involves dividing a 
-- database into multiple related tables and ensuring that 
-- data is stored in a way that reduces duplication. 
-- There are several normal forms (1NF, 2NF, 3NF, etc.) 
-- that guide how the database should be structured to 
-- achieve the most efficient and logical design.

-- 10) What does a join in MySQL mean? 

-- A join in MySQL is an operation used to combine rows from two 
-- or more tables based on a related column. There are different 
-- types of joins (e.g., INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN),
-- each serving different use cases 
-- for how data from multiple tables should be combined.


-- 11) 19.What do you understand about DDL, DCL, and DML in MySQL? 
-- DDL (Data Definition Language): This refers to SQL commands that define the structure of a database.
--  Examples include CREATE, ALTER, DROP, etc.
-- DCL (Data Control Language): This refers to SQL commands used to control access to data in a database. 
-- Examples include GRANT and REVOKE.
-- DML (Data Manipulation Language): This refers to SQL commands used to manipulate data within tables. 
-- Examples include INSERT, UPDATE, DELETE, and SELECT.


-- 12) What is the role of the MySQL JOIN clause in a query, and what are some
-- common types of joins? 

-- The JOIN clause in MySQL allows you to combine rows from two or more tables based on a related column between them. 
-- It helps in querying data from multiple tables that are logically related.
-- Common types of joins:
-- INNER JOIN: Returns only the rows where there is a match in both tables.
-- LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table and matching rows from the right table. 
-- If no match is found, NULL is returned for columns from the right table.
-- RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table and matching rows from the left table. 
-- If no match is found, NULL is returned for columns from the left table.
-- FULL OUTER JOIN: Returns rows when there is a match in one of the tables. 
-- (Note: MySQL does not support FULL OUTER JOIN natively, but it 
-- can be simulated using a combination of LEFT JOIN and RIGHT JOIN).
