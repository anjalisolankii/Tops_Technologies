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

-- # Meaningful Insights from SQL Queries on Used Car Sales Data # --

-- **1. Brand Popularity and Market Trends**
-- 💡 **Insight:** If **Maruti, Hyundai, or Honda** have the highest number of listings, it indicates their strong presence in the used car market. These brands may have good resale value and be in high demand.  

-- 📌 **Actionable Takeaway:** If you're a buyer, consider these brands for reliability and affordability. If you're a seller, pricing competitively within these brands can lead to quicker sales.  

-- ---

-- ## **2. Average Selling Price of Diesel vs. Petrol Cars**
-- 💡 **Insight:** Diesel cars tend to have a **higher average selling price** than Petrol cars. This suggests that Diesel cars are preferred for long-distance travel and better fuel efficiency.  

-- 📌 **Actionable Takeaway:**  
-- - Buyers should choose **Diesel cars** if they drive long distances regularly.  
-- - Sellers can **price Diesel cars slightly higher** as they hold better long-term value.  

-- ---

-- ## **3. Ownership Impact on Car Pricing**
-- 💡 **Insight:** **First-owner cars** generally have **higher selling prices** and lower mileage compared to second or third-owner cars. Multiple ownerships often mean more wear and tear, reducing resale value.  

-- 📌 **Actionable Takeaway:**  
-- - Buyers should prefer **first-owner cars** for better maintenance history.  
-- - Sellers should highlight the **single-owner** status to get a better price.  

-- ---

-- ## **4. High-Mileage Cars vs. Low-Mileage Cars**
-- 💡 **Insight:** Cars with mileage above **100,000 km** see a significant price drop. However, some brands (like Toyota and Honda) maintain value due to reliability.  

-- 📌 **Actionable Takeaway:**  
-- - Buyers can get **better deals on high-mileage cars** if they are well-maintained.  
-- - Sellers should **show service history** to justify higher pricing.  

-- ---

-- ## **5. Price Differences Across Fuel Types**
-- 💡 **Insight:**  
-- - **CNG and Diesel cars** tend to have **higher resale values** than Petrol cars due to lower running costs.  
-- - **Electric cars** (if present) may be priced high but could face slower sales due to charging infrastructure concerns.  

-- 📌 **Actionable Takeaway:**  
-- - Buyers should evaluate **long-term fuel costs** before purchasing.  
-- - Sellers should **leverage fuel efficiency** as a selling point for Diesel/CNG cars.  

-- ---

-- ## **6. Expensive Cars & Luxury Segment Analysis**
-- 💡 **Insight:** The **top 5 most expensive cars** in the dataset likely belong to luxury brands (Mercedes, BMW, Audi). Luxury cars depreciate faster in the first few years but maintain a strong second-hand market.  

-- 📌 **Actionable Takeaway:**  
-- - Buyers can find **great deals on slightly older luxury models**.  
-- - Sellers should price based on **brand value and condition** rather than just age.  

-- ---

-- ## **7. Fuel Type Market Share**
-- 💡 **Insight:** If **Petrol cars** dominate the dataset, it may indicate that they are more widely available and preferred in urban areas. If **Diesel cars** have a smaller share but a higher price, it shows they are valued for efficiency.  

-- 📌 **Actionable Takeaway:**  
-- - Buyers should choose **Petrol cars for city driving** and **Diesel for highway use**.  
-- - Sellers should price Diesel cars competitively, considering fuel regulations in some cities.  

-- ---

-- ## **8. Resale Value & Depreciation**
-- 💡 **Insight:** The **difference between the highest and lowest prices** for the same brand/model gives an idea of depreciation rates. Some brands (like Toyota and Honda) hold value better than others.  

-- 📌 **Actionable Takeaway:**  
-- - Buyers should consider **low-depreciation brands** for better resale value.  
-- - Sellers should **sell before major depreciation milestones (e.g., 5 years, 100,000 km)**.  

-- ---

-- ## **9. Market for Budget-Friendly vs. Premium Cars**
-- 💡 **Insight:** If a large percentage of cars are priced below **₹300,000**, it indicates a strong budget car market. If premium cars are less in number but priced significantly higher, it suggests a niche luxury market.  

-- 📌 **Actionable Takeaway:**  
-- - Budget-conscious buyers should look for cars with **low ownership costs**.  
-- - Sellers of luxury cars may need to **target a niche audience** and highlight features.  

-- ---

-- ## **10. Most Commonly Driven Car Types**
-- 💡 **Insight:** If **Hatchbacks** are the majority, it suggests that most buyers prefer small, city-friendly cars. If **SUVs and Sedans** are more common, it indicates a market shift towards larger vehicles.  

-- 📌 **Actionable Takeaway:**  
-- - Buyers should choose based on **city or highway driving needs**.  
-- - Sellers should highlight fuel efficiency for hatchbacks and comfort features for SUVs.  

-- ---

-- ### **Final Key Insights & Strategy**
-- ✅ **Buyers** should focus on first-owner, low-mileage cars and consider fuel efficiency.  
-- ✅ **Sellers** should price based on brand, ownership history, and fuel type to maximize resale value.  
-- ✅ **Diesel & CNG cars** hold better resale value, while luxury cars depreciate fast.  
-- ✅ **Hatchbacks dominate the budget market**, while SUVs and luxury cars cater to premium buyers.  