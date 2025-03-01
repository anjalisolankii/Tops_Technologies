use mwf_evening;

create table cars(
brand varchar(30),
km_drive int,
fuel varchar(15),
owner varchar(20),
selling_price int);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cars.csv'
into table cars
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select *from cars;

-- 1. Retrieve all cars that are of the brand "Maruti".
SELECT * FROM cars 
WHERE brand = 'Maruti';

-- 2. Find the total number of cars available in the dataset.
SELECT COUNT(*) AS total_cars 
FROM cars;

-- 3. Get the average selling price of Diesel cars.
SELECT AVG(selling_price) AS avg_diesel_price 
FROM cars 
WHERE fuel = 'Diesel';

-- 4. List the top 5 most expensive cars.
SELECT * FROM cars 
ORDER BY selling_price 
DESC LIMIT 5;

-- 5. Count how many cars are "First Owner".
SELECT COUNT(*) AS first_owner_count 
FROM cars 
WHERE owner = 'First Owner';

-- 6. Find the car brand with the highest average selling price.
SELECT brand, AVG(selling_price) AS avg_price 
FROM cars 
GROUP BY brand 
ORDER BY avg_price DESC 
LIMIT 1;

-- 7. Retrieve all Petrol cars that have been driven more than 100,000 km.
SELECT * FROM cars 
WHERE fuel = 'Petrol' AND km_driven > 100000;

-- 8. Find the minimum, maximum, and average selling price for each fuel type.
SELECT fuel, 
       MIN(selling_price) AS min_price, 
       MAX(selling_price) AS max_price, 
       AVG(selling_price) AS avg_price
FROM cars 
GROUP BY fuel;

-- 9. Get the number of cars per brand.
SELECT brand, COUNT(*) AS car_count 
FROM cars 
GROUP BY brand;

-- 10. List all cars sorted by `km_driven` in descending order.
SELECT * FROM cars 
ORDER BY km_driven DESC;

-- 11. Find the most common fuel type in the dataset.
SELECT fuel, COUNT(*) AS count 
FROM cars 
GROUP BY fuel 
ORDER BY count DESC 
LIMIT 1;

-- 12. Retrieve all cars where the selling price is above 500,000.
SELECT * FROM cars
 WHERE selling_price > 500000;

-- 13. Count the number of cars that have been driven more than 150,000 km.
SELECT COUNT(*) AS high_mileage_cars 
FROM cars 
WHERE km_driven > 150000;

-- 14. Get the distinct car brands available in the dataset.
SELECT DISTINCT brand
 FROM cars;

-- 15. Find the average number of kilometers driven for each ownership type.
SELECT owner, 
AVG(km_driven) AS avg_km 
FROM cars GROUP BY owner;

-- 16. List the brands with more than 10 cars in the dataset.
SELECT brand, COUNT(*) AS car_count 
FROM cars 
GROUP BY brand 
HAVING COUNT(*) > 10;

-- 17. Find the cheapest Diesel car in the dataset.
SELECT * FROM cars 
WHERE fuel = 'Diesel' 
ORDER BY selling_price ASC LIMIT 1;

-- 18. Get the second most expensive Petrol car.
SELECT * FROM cars 
WHERE fuel = 'Petrol' 
ORDER BY selling_price DESC LIMIT 1 OFFSET 1;

-- 19. Retrieve all cars that are either "First Owner" or "Second Owner" and have a selling price below 300,000.
SELECT * FROM cars 
WHERE (owner = 'First Owner' OR owner = 'Second Owner') 
AND selling_price < 300000;

-- 20. Find the percentage of cars that use Petrol versus Diesel.
SELECT 
    (COUNT(CASE WHEN fuel = 'Petrol' THEN 1 END) * 100.0 / COUNT(*)) AS petrol_percentage,
    (COUNT(CASE WHEN fuel = 'Diesel' THEN 1 END) * 100.0 / COUNT(*)) AS diesel_percentage
FROM cars;

-- 21. Get the top 3 brands with the highest average selling price.
SELECT brand, AVG(selling_price) AS avg_price 
FROM cars 
GROUP BY brand 
ORDER BY avg_price DESC 
LIMIT 3;

-- 22. Count the number of cars per ownership type.
SELECT owner, COUNT(*) AS owner_count 
FROM cars GROUP BY owner;

-- 23. Find the fuel type that has the highest average selling price.
SELECT fuel, AVG(selling_price) AS avg_price 
FROM cars 
GROUP BY fuel 
ORDER BY avg_price DESC 
LIMIT 1;

-- 24. Retrieve all cars that have the word "Honda" in their brand name.
SELECT * FROM cars 
WHERE brand LIKE '%Honda%';

-- 25. List all cars grouped by owner type, showing the total number of cars and their average selling price.
SELECT owner, COUNT(*) AS total_cars, 
AVG(selling_price) AS avg_price 
FROM cars 
GROUP BY owner;

-- 26. Get the difference between the highest and lowest selling prices in the dataset.
SELECT (MAX(selling_price) - 
MIN(selling_price)) AS price_difference 
FROM cars;

-- 27. Find the brand with the most "Third Owner" cars.
SELECT brand, COUNT(*) AS third_owner_count 
FROM cars 
WHERE owner = 'Third Owner' 
GROUP BY brand 
ORDER BY third_owner_count DESC 
LIMIT 1;

-- 28. Retrieve cars where the `selling_price` is at least double the number of kilometers driven.
SELECT * FROM cars 
WHERE selling_price >= (2 * km_driven);

-- 29. List the five least driven cars in the dataset.
SELECT * FROM cars 
ORDER BY km_driven 
ASC LIMIT 5;

-- 30. Find the number of cars that have the same `km_driven` value.\
DESC cars;
SHOW COLUMNS FROM cars;
SELECT km_driven, COUNT(*) AS count 
FROM cars 
GROUP BY km_driven 
HAVING COUNT(*) > 1;
