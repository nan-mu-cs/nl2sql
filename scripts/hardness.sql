
-------------------------medium-----------------------
SELECT sum(grant_amount) FROM Grants AS T1 JOIN Organisations AS T2 ON T1.organisation_id  =  T2.organisation_id JOIN organisation_Types AS T3 ON T2.organisation_type  =  T3.organisation_type WHERE T3.organisation_type_description  =  'Research'
SELECT sum(grant_amount) FROM Grants AS T1 JOIN Organisations AS T2 ON T1.organisation_id  =  T2.organisation_id JOIN organisation_Types AS T3 ON T2.organisation_type  =  T3.organisation_type WHERE T3.organisation_type_description  =  'Research'
SELECT T1.sent_date FROM documents AS T1 JOIN Grants AS T2 ON T1.grant_id  =  T2.grant_id JOIN Organisations AS T3 ON T2.organisation_id  =  T3.organisation_id JOIN organisation_Types AS T4 ON T3.organisation_type  =  T4.organisation_type WHERE T2.grant_amount  >  5000 AND T4.organisation_type_description  =  'Research'
SELECT T1.sent_date FROM documents AS T1 JOIN Grants AS T2 ON T1.grant_id  =  T2.grant_id JOIN Organisations AS T3 ON T2.organisation_id  =  T3.organisation_id JOIN organisation_Types AS T4 ON T3.organisation_type  =  T4.organisation_type WHERE T2.grant_amount  >  5000 AND T4.organisation_type_description  =  'Research'
SELECT date_from ,  date_to FROM Project_Staff WHERE role_code  =  'researcher'
SELECT date_from ,  date_to FROM Project_Staff WHERE role_code  =  'researcher'
SELECT sum(grant_amount) ,  organisation_id FROM Grants GROUP BY organisation_id
SELECT sum(grant_amount) ,  organisation_id FROM Grants GROUP BY organisation_id
SELECT date_from FROM Project_Staff ORDER BY date_from ASC LIMIT 1
SELECT date_from FROM Project_Staff ORDER BY date_from ASC LIMIT 1
SELECT document_type_code FROM Document_Types WHERE document_description LIKE 'Initial%'
SELECT document_type_code FROM Document_Types WHERE document_description LIKE 'Initial%'
SELECT T1.organisation_type_description FROM organisation_Types AS T1 JOIN Organisations AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_details  =  'quo'
SELECT T1.organisation_type_description FROM organisation_Types AS T1 JOIN Organisations AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_details  =  'quo'
SELECT count(*) FROM Project_Staff WHERE role_code  =  'leader' OR date_from  <  '1989-04-24 23:51:54'
SELECT count(*) FROM Project_Staff WHERE role_code  =  'leader' OR date_from  <  '1989-04-24 23:51:54'
SELECT date_to FROM Project_Staff ORDER BY date_to DESC LIMIT 1
SELECT date_to FROM Project_Staff ORDER BY date_to DESC LIMIT 1
SELECT T1.outcome_description FROM Research_outcomes AS T1 JOIN Project_outcomes AS T2 ON T1.outcome_code  =  T2.outcome_code JOIN Projects AS T3 ON T2.project_id  =  T3.project_id WHERE T3.project_details  =  'sint'
SELECT T1.outcome_description FROM Research_outcomes AS T1 JOIN Project_outcomes AS T2 ON T1.outcome_code  =  T2.outcome_code JOIN Projects AS T3 ON T2.project_id  =  T3.project_id WHERE T3.project_details  =  'sint'
SELECT count(*) ,  T1.project_details FROM Projects AS T1 JOIN Tasks AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.project_id
SELECT count(*) ,  T1.project_details FROM Projects AS T1 JOIN Tasks AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.project_id
SELECT role_code FROM Project_Staff WHERE date_from  >  '2003-04-19 15:06:20' AND date_to  <  '2016-03-15 00:33:18'
SELECT role_code FROM Project_Staff WHERE date_from  >  '2003-04-19 15:06:20' AND date_to  <  '2016-03-15 00:33:18'
SELECT model FROM headphone ORDER BY price DESC LIMIT 1
SELECT model FROM headphone ORDER BY price DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  >  2
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  >  2
SELECT count(*) ,  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(*) ,  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT model ,  CLASS ,  construction FROM headphone ORDER BY price LIMIT 1
SELECT model ,  CLASS ,  construction FROM headphone ORDER BY price LIMIT 1
SELECT construction ,  avg(price) FROM headphone GROUP BY construction
SELECT construction ,  avg(price) FROM headphone GROUP BY construction
SELECT name ,  parking FROM store WHERE neighborhood  =  'Tarzana'
SELECT name ,  parking FROM store WHERE neighborhood  =  'Tarzana'
SELECT count(*) ,  neighborhood FROM store GROUP BY neighborhood
SELECT count(*) ,  neighborhood FROM store GROUP BY neighborhood
SELECT sum(t2.quantity) FROM store AS t1 JOIN stock AS t2 ON t1.store_id  =  t2.store_id WHERE t1.name  =  'Woodman'
SELECT sum(t2.quantity) FROM store AS t1 JOIN stock AS t2 ON t1.store_id  =  t2.store_id WHERE t1.name  =  'Woodman'
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T1.gender_code ,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code
SELECT T1.gender_code ,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code
SELECT T1.gender_code ,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT T1.gender_code ,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name ,  T2.Payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name ,  T2.Payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.invoice_status_code ,  T1.invoice_date ,  T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T1.invoice_status_code ,  T1.invoice_date ,  T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T1.product_name ,  T4.shipment_date FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id
SELECT T1.product_name ,  T4.shipment_date FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id
SELECT T1.order_item_status_code ,  T3.shipment_tracking_number FROM Order_items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id  =  T3.shipment_id
SELECT T1.order_item_status_code ,  T3.shipment_tracking_number FROM Order_items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id  =  T3.shipment_id
SELECT T1.product_name ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id
SELECT T1.product_name ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id
SELECT DISTINCT T1.product_name ,  T1.product_price ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id JOIN Customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  'Female'
SELECT DISTINCT T1.product_name ,  T1.product_price ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id JOIN Customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  'Female'
SELECT T1.order_id ,  T1.date_order_placed ,  sum(T3.product_price) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id JOIN Products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T1.order_id
SELECT T1.order_id ,  T1.date_order_placed ,  sum(T3.product_price) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id JOIN Products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T1.order_id
SELECT login_name ,  login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name ,  login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT order_status_code ,  date_order_placed FROM Orders
SELECT order_status_code ,  date_order_placed FROM Orders
SELECT address_line_1 ,  town_city ,  county FROM Customers WHERE Country  =  'USA'
SELECT address_line_1 ,  town_city ,  county FROM Customers WHERE Country  =  'USA'
SELECT T1.customer_first_name ,  T4.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id JOIN Products AS T4 ON T3.product_id  =  T4.product_id
SELECT T1.customer_first_name ,  T4.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id JOIN Products AS T4 ON T3.product_id  =  T4.product_id
SELECT shipment_tracking_number ,  shipment_date FROM Shipments
SELECT shipment_tracking_number ,  shipment_date FROM Shipments
SELECT make ,  count(*) FROM driver WHERE points  >  150 GROUP BY make
SELECT make ,  count(*) FROM driver WHERE points  >  150 GROUP BY make
SELECT avg(age) ,  Make FROM driver GROUP BY make
SELECT avg(age) ,  Make FROM driver GROUP BY make
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner
SELECT make FROM team GROUP BY team HAVING count(*)  >  1
SELECT make FROM team GROUP BY team HAVING count(*)  >  1
SELECT max(Points) ,  min(Points) FROM driver
SELECT max(Points) ,  min(Points) FROM driver
SELECT T2.Driver ,  T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country
SELECT T2.Driver ,  T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Capital  =  "Dublin"
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Capital  =  "Dublin"
SELECT avg(T2.age) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Official_native_language  =  "English"
SELECT avg(T2.age) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Official_native_language  =  "English"
SELECT T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T2.Points  >  150
SELECT T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T2.Points  >  150
SELECT Make ,  COUNT(*) FROM driver GROUP BY Make
SELECT Make ,  COUNT(*) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT sum(Points) ,  avg(Points) FROM driver
SELECT sum(Points) ,  avg(Points) FROM driver
SELECT name FROM races ORDER BY date DESC LIMIT 1
SELECT name FROM races ORDER BY date DESC LIMIT 1
SELECT name ,  date FROM races ORDER BY date DESC LIMIT 1
SELECT name ,  date FROM races ORDER BY date DESC LIMIT 1
SELECT DISTINCT name FROM races WHERE YEAR BETWEEN 2014 AND 2017
SELECT DISTINCT name FROM races WHERE YEAR BETWEEN 2014 AND 2017
SELECT DISTINCT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds < 93000
SELECT DISTINCT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds < 93000
SELECT DISTINCT T1.driverid ,  T1.nationality FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds >  100000
SELECT DISTINCT T1.driverid ,  T1.nationality FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.milliseconds >  100000
SELECT count(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = "Australian Grand Prix" AND YEAR = 2009
SELECT count(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = "Australian Grand Prix" AND YEAR = 2009
SELECT T2.name ,  T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T3.forename = "Lewis"
SELECT T2.name ,  T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T3.forename = "Lewis"
SELECT forename ,  surname FROM drivers WHERE nationality = "German"
SELECT forename ,  surname FROM drivers WHERE nationality = "German"
SELECT DISTINCT T1.forename FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.wins = 1
SELECT DISTINCT T1.forename FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.wins = 1
SELECT DISTINCT T1.forename FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.wins = 1 AND T2.points > 20
SELECT DISTINCT T1.forename FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T2.wins = 1 AND T2.points > 20
SELECT count(*) ,  nationality FROM constructors GROUP BY nationality
SELECT count(*) ,  nationality FROM constructors GROUP BY nationality
SELECT count(*) ,  constructorid FROM constructorStandings GROUP BY constructorid
SELECT count(*) ,  constructorid FROM constructorStandings GROUP BY constructorid
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Spain" AND T1.year > 2017
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Spain" AND T1.year > 2017
SELECT DISTINCT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Spain" AND T1.year > 2000
SELECT DISTINCT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Spain" AND T1.year > 2000
SELECT name FROM races WHERE YEAR BETWEEN 2009 AND 2011
SELECT name FROM races WHERE YEAR BETWEEN 2009 AND 2011
SELECT name FROM races WHERE TIME > "12:00:00" OR TIME < "09:00:00"
SELECT name FROM races WHERE TIME > "12:00:00" OR TIME < "09:00:00"
SELECT name FROM circuits WHERE country = "UK" OR country = "Malaysia"
SELECT name FROM circuits WHERE country = "UK" OR country = "Malaysia"
SELECT T1.name FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = "Japanese" AND T2.points > 5
SELECT T1.name FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = "Japanese" AND T2.points > 5
SELECT avg(T2.fastestlapspeed) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = "Monaco Grand Prix"
SELECT avg(T2.fastestlapspeed) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = "Monaco Grand Prix"
SELECT max(T2.fastestlapspeed) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = "Monaco Grand Prix"
SELECT max(T2.fastestlapspeed) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = "Monaco Grand Prix"
SELECT Title ,  Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title ,  Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Platform_name ,  Market_district FROM platform
SELECT Platform_name ,  Market_district FROM platform
SELECT Platform_name ,  Platform_ID FROM platform WHERE Download_rank  =  1
SELECT Platform_name ,  Platform_ID FROM platform WHERE Download_rank  =  1
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player
SELECT Player_name ,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name ,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT T3.Player_name ,  T3.rank_of_the_year FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T1.Title  =  "Super Mario World"
SELECT T3.Player_name ,  T3.rank_of_the_year FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T1.Title  =  "Super Mario World"
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT avg(Units_sold_Millions) FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT avg(Units_sold_Millions) FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT T1.Title ,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT T1.Title ,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT OWNER FROM channel ORDER BY rating_in_percent DESC LIMIT 1
SELECT OWNER FROM channel ORDER BY rating_in_percent DESC LIMIT 1
SELECT name ,  origin ,  OWNER FROM program
SELECT name ,  origin ,  OWNER FROM program
SELECT name FROM program ORDER BY launch DESC LIMIT 1
SELECT name FROM program ORDER BY launch DESC LIMIT 1
SELECT t1.name FROM channel AS t1 JOIN broadcast AS t2 ON t1.channel_id  =  t2.channel_id WHERE t2.time_of_day  =  'Morning'
SELECT t1.name FROM channel AS t1 JOIN broadcast AS t2 ON t1.channel_id  =  t2.channel_id WHERE t2.time_of_day  =  'Morning'
SELECT count(*) ,  time_of_day FROM broadcast GROUP BY time_of_day
SELECT count(*) ,  time_of_day FROM broadcast GROUP BY time_of_day
SELECT name FROM channel WHERE OWNER  =  'CCTV' OR OWNER  =  'HBS'
SELECT name FROM channel WHERE OWNER  =  'CCTV' OR OWNER  =  'HBS'
SELECT sum(Rating_in_percent) ,  OWNER FROM channel GROUP BY OWNER
SELECT sum(Rating_in_percent) ,  OWNER FROM channel GROUP BY OWNER
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT T1.title ,  T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT T1.title ,  T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT rating FROM movies WHERE title LIKE '%Citizen%'
SELECT rating FROM movies WHERE title LIKE '%Citizen%'
SELECT title FROM movies WHERE rating  =  'G' OR rating  =  'PG'
SELECT title FROM movies WHERE rating  =  'G' OR rating  =  'PG'
SELECT count(*) ,  rating FROM movies GROUP BY rating
SELECT count(*) ,  rating FROM movies GROUP BY rating
SELECT count(*) ,  rating FROM movies WHERE rating IS NOT NULL GROUP BY rating
SELECT count(*) ,  rating FROM movies WHERE rating IS NOT NULL GROUP BY rating
SELECT name FROM movietheaters GROUP BY name HAVING count(*)  >=  1
SELECT name FROM movietheaters GROUP BY name HAVING count(*)  >=  1
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'
SELECT name ,  distance FROM Aircraft
SELECT name ,  distance FROM Aircraft
SELECT count(*) FROM Aircraft WHERE distance BETWEEN 1000 AND 5000
SELECT count(*) FROM Aircraft WHERE distance BETWEEN 1000 AND 5000
SELECT name ,  distance FROM Aircraft WHERE aid  =  12
SELECT name ,  distance FROM Aircraft WHERE aid  =  12
SELECT min(distance) ,  avg(distance) ,  max(distance) FROM Aircraft
SELECT min(distance) ,  avg(distance) ,  max(distance) FROM Aircraft
SELECT aid ,  name FROM Aircraft ORDER BY distance DESC LIMIT 1
SELECT aid ,  name FROM Aircraft ORDER BY distance DESC LIMIT 1
SELECT name FROM Aircraft ORDER BY distance LIMIT 3
SELECT name FROM Aircraft ORDER BY distance LIMIT 3
SELECT name ,  salary FROM Employee ORDER BY salary
SELECT name ,  salary FROM Employee ORDER BY salary
SELECT count(*) FROM Employee WHERE salary BETWEEN 100000 AND 200000
SELECT count(*) FROM Employee WHERE salary BETWEEN 100000 AND 200000
SELECT name ,  salary FROM Employee WHERE eid  =  242518965
SELECT name ,  salary FROM Employee WHERE eid  =  242518965
SELECT avg(salary) ,  max(salary) FROM Employee
SELECT avg(salary) ,  max(salary) FROM Employee
SELECT eid ,  name FROM Employee ORDER BY salary DESC LIMIT 1
SELECT eid ,  name FROM Employee ORDER BY salary DESC LIMIT 1
SELECT name FROM Employee ORDER BY salary ASC LIMIT 3
SELECT name FROM Employee ORDER BY salary ASC LIMIT 3
SELECT eid ,  salary FROM Employee WHERE name  =  'Mark Young'
SELECT eid ,  salary FROM Employee WHERE name  =  'Mark Young'
SELECT flno ,  origin ,  destination FROM Flight ORDER BY origin
SELECT flno ,  origin ,  destination FROM Flight ORDER BY origin
SELECT departure_date ,  arrival_date FROM Flight WHERE origin  =  "Los Angeles" AND destination  =  "Honolulu"
SELECT departure_date ,  arrival_date FROM Flight WHERE origin  =  "Los Angeles" AND destination  =  "Honolulu"
SELECT avg(price) FROM Flight WHERE origin  =  "Los Angeles" AND destination  =  "Honolulu"
SELECT avg(price) FROM Flight WHERE origin  =  "Los Angeles" AND destination  =  "Honolulu"
SELECT origin ,  destination FROM Flight WHERE price  >  300
SELECT origin ,  destination FROM Flight WHERE price  >  300
SELECT flno ,  distance FROM Flight ORDER BY price DESC LIMIT 1
SELECT flno ,  distance FROM Flight ORDER BY price DESC LIMIT 1
SELECT flno FROM Flight ORDER BY distance ASC LIMIT 3
SELECT flno FROM Flight ORDER BY distance ASC LIMIT 3
SELECT avg(distance) ,  avg(price) FROM Flight WHERE origin  =  "Los Angeles"
SELECT avg(distance) ,  avg(price) FROM Flight WHERE origin  =  "Los Angeles"
SELECT origin ,  count(*) FROM Flight GROUP BY origin
SELECT origin ,  count(*) FROM Flight GROUP BY origin
SELECT destination ,  count(*) FROM Flight GROUP BY destination
SELECT destination ,  count(*) FROM Flight GROUP BY destination
SELECT T2.name FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid WHERE T1.flno  =  99
SELECT T2.name FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid WHERE T1.flno  =  99
SELECT T1.flno FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid WHERE T2.name  =  "Airbus A340-300"
SELECT T1.flno FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid WHERE T2.name  =  "Airbus A340-300"
SELECT T2.name ,  count(*) FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid GROUP BY T1.aid
SELECT T2.name ,  count(*) FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid GROUP BY T1.aid
SELECT T3.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T1.name  =  "John Williams"
SELECT T3.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T1.name  =  "John Williams"
SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  "Boeing 737-800"
SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  "Boeing 737-800"
SELECT host_city FROM hosting_city ORDER BY YEAR DESC LIMIT 1
SELECT host_city FROM hosting_city ORDER BY YEAR DESC LIMIT 1
SELECT T1.city FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id = T2.host_city WHERE T2.year  >  2010
SELECT T1.city FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id = T2.host_city WHERE T2.year  >  2010
SELECT T3.venue FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id = T2.host_city JOIN MATCH AS T3 ON T2.match_id = T3.match_id WHERE T1.city = "Nanjing ( Jiangsu )" AND T3.competition = "1994 FIFA World Cup qualification"
SELECT T3.venue FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id = T2.host_city JOIN MATCH AS T3 ON T2.match_id = T3.match_id WHERE T1.city = "Nanjing ( Jiangsu )" AND T3.competition = "1994 FIFA World Cup qualification"
SELECT T2.Jan FROM city AS T1 JOIN temperature AS T2 ON T1.city_id = T2.city_id WHERE T1.city = "Shanghai"
SELECT T2.Jan FROM city AS T1 JOIN temperature AS T2 ON T1.city_id = T2.city_id WHERE T1.city = "Shanghai"
SELECT T2.year FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city WHERE T1.city  =  "Taizhou ( Zhejiang )"
SELECT T2.year FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city WHERE T1.city  =  "Taizhou ( Zhejiang )"
SELECT city FROM city ORDER BY regional_population DESC LIMIT 3
SELECT city FROM city ORDER BY regional_population DESC LIMIT 3
SELECT city ,  GDP FROM city ORDER BY GDP LIMIT 1
SELECT city ,  GDP FROM city ORDER BY GDP LIMIT 1
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Mar  <  T2.Jul OR T2.Mar  >  T2.Oct
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Mar  <  T2.Jul OR T2.Mar  >  T2.Oct
SELECT count(*) ,  Competition FROM MATCH GROUP BY Competition
SELECT count(*) ,  Competition FROM MATCH GROUP BY Competition
SELECT gdp FROM city ORDER BY Regional_Population DESC LIMIT 1
SELECT gdp FROM city ORDER BY Regional_Population DESC LIMIT 1
SELECT address_id ,  address_details FROM Addresses
SELECT address_id ,  address_details FROM Addresses
SELECT product_id ,  product_type_code ,  product_name FROM Products
SELECT product_id ,  product_type_code ,  product_name FROM Products
SELECT min(product_price) ,  avg(product_price) ,  max(product_price) FROM Products
SELECT min(product_price) ,  avg(product_price) ,  max(product_price) FROM Products
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC
SELECT product_type_code ,  count(*) FROM Products GROUP BY product_type_code
SELECT product_type_code ,  count(*) FROM Products GROUP BY product_type_code
SELECT product_type_code ,  avg(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code ,  avg(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT customer_id ,  customer_name FROM Customers
SELECT customer_id ,  customer_name FROM Customers
SELECT customer_address ,  customer_phone ,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"
SELECT customer_address ,  customer_phone ,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code ,  count(*) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code ,  count(*) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code ,  customer_number FROM Customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code ,  customer_number FROM Customers WHERE customer_name  =  "Jeromy"
SELECT product_id ,  product_type_code FROM Products ORDER BY product_name
SELECT product_id ,  product_type_code FROM Products ORDER BY product_name
SELECT order_id ,  order_date ,  order_status_code FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"
SELECT order_id ,  order_date ,  order_status_code FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"
SELECT T2.customer_name ,  T1.customer_id ,  count(*) FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T2.customer_name ,  T1.customer_id ,  count(*) FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT order_status_code ,  count(*) FROM Customer_orders GROUP BY order_status_code
SELECT order_status_code ,  count(*) FROM Customer_orders GROUP BY order_status_code
SELECT sum(order_quantity) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id WHERE T2.product_name  =  "Monitor"
SELECT sum(order_quantity) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id WHERE T2.product_name  =  "Monitor"
SELECT count(DISTINCT T3.customer_id) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id JOIN Customer_orders AS T3 ON T3.order_id  =  T1.order_id WHERE T2.product_name  =  "Monitor"
SELECT count(DISTINCT T3.customer_id) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id JOIN Customer_orders AS T3 ON T3.order_id  =  T1.order_id WHERE T2.product_name  =  "Monitor"
SELECT Shop_Name ,  LOCATION FROM shop ORDER BY Shop_Name ASC
SELECT Shop_Name ,  LOCATION FROM shop ORDER BY Shop_Name ASC
SELECT Open_Date ,  Open_Year FROM shop WHERE Shop_Name  =  "Apple"
SELECT Open_Date ,  Open_Year FROM shop WHERE Shop_Name  =  "Apple"
SELECT Shop_Name FROM shop ORDER BY Open_Year DESC LIMIT 1
SELECT Shop_Name FROM shop ORDER BY Open_Year DESC LIMIT 1
SELECT T3.Shop_Name ,  T2.Carrier FROM stock AS T1 JOIN device AS T2 ON T1.Device_ID  =  T2.Device_ID JOIN shop AS T3 ON T1.Shop_ID  =  T3.Shop_ID
SELECT T3.Shop_Name ,  T2.Carrier FROM stock AS T1 JOIN device AS T2 ON T1.Device_ID  =  T2.Device_ID JOIN shop AS T3 ON T1.Shop_ID  =  T3.Shop_ID
SELECT Software_Platform ,  COUNT(*) FROM device GROUP BY Software_Platform
SELECT Software_Platform ,  COUNT(*) FROM device GROUP BY Software_Platform
SELECT Software_Platform FROM device GROUP BY Software_Platform ORDER BY COUNT(*) DESC
SELECT Software_Platform FROM device GROUP BY Software_Platform ORDER BY COUNT(*) DESC
SELECT support_rate FROM candidate ORDER BY support_rate DESC LIMIT 3
SELECT support_rate FROM candidate ORDER BY support_rate DESC LIMIT 3
SELECT Candidate_ID FROM candidate ORDER BY oppose_rate LIMIT 1
SELECT Candidate_ID FROM candidate ORDER BY oppose_rate LIMIT 1
SELECT Support_rate ,  Consider_rate ,  Oppose_rate FROM candidate ORDER BY unsure_rate
SELECT Support_rate ,  Consider_rate ,  Oppose_rate FROM candidate ORDER BY unsure_rate
SELECT poll_source FROM candidate ORDER BY oppose_rate DESC LIMIT 1
SELECT poll_source FROM candidate ORDER BY oppose_rate DESC LIMIT 1
SELECT avg(height) ,  avg(weight) FROM people WHERE sex  =  'M'
SELECT avg(height) ,  avg(weight) FROM people WHERE sex  =  'M'
SELECT avg(weight) ,  min(weight) ,  sex FROM people GROUP BY sex
SELECT avg(weight) ,  min(weight) ,  sex FROM people GROUP BY sex
SELECT t1.name FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id WHERE t2.support_rate  <  t2.oppose_rate
SELECT t1.name FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id WHERE t2.support_rate  <  t2.oppose_rate
SELECT count(*) ,  sex FROM people WHERE weight  >  85 GROUP BY sex
SELECT count(*) ,  sex FROM people WHERE weight  >  85 GROUP BY sex
SELECT max(support_rate) ,  min(consider_rate) ,  min(oppose_rate) FROM candidate
SELECT max(support_rate) ,  min(consider_rate) ,  min(oppose_rate) FROM candidate
SELECT building ,  room_number FROM classroom WHERE capacity BETWEEN 50 AND 100
SELECT building ,  room_number FROM classroom WHERE capacity BETWEEN 50 AND 100
SELECT dept_name ,  building FROM department ORDER BY budget DESC LIMIT 1
SELECT dept_name ,  building FROM department ORDER BY budget DESC LIMIT 1
SELECT sum(budget) FROM department WHERE dept_name  =  'Marketing' OR dept_name  =  'Finance'
SELECT sum(budget) FROM department WHERE dept_name  =  'Marketing' OR dept_name  =  'Finance'
SELECT dept_name FROM instructor WHERE name LIKE '%Soisalon%'
SELECT dept_name FROM instructor WHERE name LIKE '%Soisalon%'
SELECT count(*) FROM classroom WHERE building  =  'Lamberton' AND capacity  <  50
SELECT count(*) FROM classroom WHERE building  =  'Lamberton' AND capacity  <  50
SELECT DISTINCT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE YEAR  =  2009 OR YEAR  =  2010
SELECT DISTINCT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE YEAR  =  2009 OR YEAR  =  2010
SELECT dept_name FROM department ORDER BY budget LIMIT 1
SELECT dept_name FROM department ORDER BY budget LIMIT 1
SELECT dept_name ,  building FROM department ORDER BY budget DESC
SELECT dept_name ,  building FROM department ORDER BY budget DESC
SELECT name FROM instructor ORDER BY salary DESC LIMIT 1
SELECT name FROM instructor ORDER BY salary DESC LIMIT 1
SELECT name ,  dept_name FROM student ORDER BY tot_cred
SELECT name ,  dept_name FROM student ORDER BY tot_cred
SELECT count(*) ,  building FROM classroom WHERE capacity  >  50 GROUP BY building
SELECT count(*) ,  building FROM classroom WHERE capacity  >  50 GROUP BY building
SELECT max(capacity) ,  avg(capacity) ,  building FROM classroom GROUP BY building
SELECT max(capacity) ,  avg(capacity) ,  building FROM classroom GROUP BY building
SELECT title FROM course GROUP BY title HAVING count(*)  >  1
SELECT title FROM course GROUP BY title HAVING count(*)  >  1
SELECT sum(credits) ,  dept_name FROM course GROUP BY dept_name
SELECT sum(credits) ,  dept_name FROM course GROUP BY dept_name
SELECT count(*) ,  semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR
SELECT count(*) ,  semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR
SELECT count(*) ,  dept_name FROM student GROUP BY dept_name
SELECT count(*) ,  dept_name FROM student GROUP BY dept_name
SELECT i_id FROM advisor AS T1 JOIN student AS T2 ON T1.s_id  =  T2.id WHERE T2.dept_name  =  'History'
SELECT i_id FROM advisor AS T1 JOIN student AS T2 ON T1.s_id  =  T2.id WHERE T2.dept_name  =  'History'
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'History'
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'History'
SELECT T1.title FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE building  =  'Chandler' AND semester  =  'Fall' AND YEAR  =  2010
SELECT T1.title FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE building  =  'Chandler' AND semester  =  'Fall' AND YEAR  =  2010
SELECT T1.name FROM instructor AS T1 JOIN teaches AS T2 ON T1.id  =  T2.id JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T3.title  =  'C Programming'
SELECT T1.name FROM instructor AS T1 JOIN teaches AS T2 ON T1.id  =  T2.id JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T3.title  =  'C Programming'
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math'
SELECT T2.name ,  T2.salary FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math'
SELECT T3.name FROM course AS T1 JOIN takes AS T2 ON T1.course_id  =  T2.course_id JOIN student AS T3 ON T2.id  =  T3.id WHERE T1.dept_name  =  'Statistics'
SELECT T3.name FROM course AS T1 JOIN takes AS T2 ON T1.course_id  =  T2.course_id JOIN student AS T3 ON T2.id  =  T3.id WHERE T1.dept_name  =  'Statistics'
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'  AND salary  >  80000
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'  AND salary  >  80000
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID WHERE T1.dept_name  =  'Art'
SELECT name ,  course_id FROM instructor AS T1 JOIN teaches AS T2 ON T1.ID  =  T2.ID WHERE T1.dept_name  =  'Art'
SELECT name FROM instructor WHERE name LIKE '%dar%'
SELECT name FROM instructor WHERE name LIKE '%dar%'
SELECT COUNT (DISTINCT ID) FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT COUNT (DISTINCT ID) FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT dept_name ,  AVG (salary) FROM instructor GROUP BY dept_name HAVING AVG (salary)  >  42000
SELECT dept_name ,  AVG (salary) FROM instructor GROUP BY dept_name HAVING AVG (salary)  >  42000
SELECT DISTINCT T1.stageposition FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id WHERE Firstname  =  "Solveig"
SELECT DISTINCT T1.stageposition FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id WHERE Firstname  =  "Solveig"
SELECT T3.Title FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T2.Lastname  =  "Heilo"
SELECT T3.Title FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T2.Lastname  =  "Heilo"
SELECT count(*) FROM performance AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id JOIN songs AS T3 ON T3.songid  =  T1.songid WHERE T3.Title  =  "Flash"
SELECT count(*) FROM performance AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id JOIN songs AS T3 ON T3.songid  =  T1.songid WHERE T3.Title  =  "Flash"
SELECT T3.Title FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T2.firstname  =  "Marianne"
SELECT T3.Title FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T2.firstname  =  "Marianne"
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  "Badlands"
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  "Badlands"
SELECT title FROM songs WHERE title LIKE '% the %'
SELECT title FROM songs WHERE title LIKE '% the %'
SELECT T4.instrument FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId JOIN Instruments AS T4 ON T4.songid  =  T3.songid AND T4.bandmateid  =  T2.id WHERE T2.lastname  =  "Heilo" AND T3.title  =  "Le Pop"
SELECT T4.instrument FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId JOIN Instruments AS T4 ON T4.songid  =  T3.songid AND T4.bandmateid  =  T2.id WHERE T2.lastname  =  "Heilo" AND T3.title  =  "Le Pop"
SELECT instrument FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Le Pop"
SELECT instrument FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Le Pop"
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Le Pop"
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Le Pop"
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN Band AS T2 ON T1.bandmateid  =  T2.id WHERE T2.lastname  =  "Heilo"
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN Band AS T2 ON T1.bandmateid  =  T2.id WHERE T2.lastname  =  "Heilo"
SELECT instrument FROM instruments AS T1 JOIN Band AS T2 ON T1.bandmateid  =  T2.id WHERE T2.lastname  =  "Heilo"
SELECT instrument FROM instruments AS T1 JOIN Band AS T2 ON T1.bandmateid  =  T2.id WHERE T2.lastname  =  "Heilo"
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Le Pop"
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Le Pop"
SELECT count(*) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Demon Kitty Rag"
SELECT count(*) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Demon Kitty Rag"
SELECT count(DISTINCT title) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE TYPE  =  "lead"
SELECT count(DISTINCT title) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE TYPE  =  "lead"
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid JOIN band AS T3 ON T1.bandmate  =  T3.id WHERE T3.firstname  =  "Solveig" AND T2.title  =  "A Bar In Amsterdam"
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid JOIN band AS T3 ON T1.bandmate  =  T3.id WHERE T3.firstname  =  "Solveig" AND T2.title  =  "A Bar In Amsterdam"
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  "Le Pop"
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  "Le Pop"
SELECT T4.instrument FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId JOIN Instruments AS T4 ON T4.songid  =  T3.songid AND T4.bandmateid  =  T2.id WHERE T2.lastname  =  "Heilo" AND T3.title  =  "Badlands"
SELECT T4.instrument FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId JOIN Instruments AS T4 ON T4.songid  =  T3.songid AND T4.bandmateid  =  T2.id WHERE T2.lastname  =  "Heilo" AND T3.title  =  "Badlands"
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Badlands"
SELECT count(DISTINCT instrument) FROM instruments AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Badlands"
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Badlands"
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Badlands"
SELECT count(*) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Le Pop"
SELECT count(*) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE title  =  "Le Pop"
SELECT count(DISTINCT title) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE TYPE  =  "shared"
SELECT count(DISTINCT title) FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid WHERE TYPE  =  "shared"
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid JOIN band AS T3 ON T1.bandmate  =  T3.id WHERE T3.lastname  =  "Heilo" AND T2.title  =  "Der Kapitan"
SELECT TYPE FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid JOIN band AS T3 ON T1.bandmate  =  T3.id WHERE T3.lastname  =  "Heilo" AND T2.title  =  "Der Kapitan"
SELECT T3.title FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE T1.title  =  "A Kiss Before You Go: Live in Hamburg"
SELECT T3.title FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE T1.title  =  "A Kiss Before You Go: Live in Hamburg"
SELECT T3.title FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE t1.label  =  "Universal Music Group"
SELECT T3.title FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE t1.label  =  "Universal Music Group"
SELECT count(DISTINCT T3.title) FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE t1.type  =  "Studio"
SELECT count(DISTINCT T3.title) FROM albums AS T1 JOIN tracklists AS T2 ON T1.aid  =  T2.albumid JOIN songs AS T3 ON T2.songid  =  T3.songid WHERE t1.type  =  "Studio"
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press
SELECT name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT avg(age) ,  gender FROM author GROUP BY gender
SELECT avg(age) ,  gender FROM author GROUP BY gender
SELECT count(*) ,  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT count(*) ,  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT count(*) ,  book_series FROM book GROUP BY book_series
SELECT count(*) ,  book_series FROM book GROUP BY book_series
SELECT title ,  release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT title ,  release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT sum(t1.sale_amount) ,  t2.name FROM book AS t1 JOIN press AS t2 ON t1.press_id  =  t2.press_id GROUP BY t1.press_id
SELECT sum(t1.sale_amount) ,  t2.name FROM book AS t1 JOIN press AS t2 ON t1.press_id  =  t2.press_id GROUP BY t1.press_id
SELECT name FROM languages WHERE name LIKE "%ish%"
SELECT name FROM languages WHERE name LIKE "%ish%"
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name ! =  "Norway"
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name ! =  "Norway"
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT T1.name ,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T1.name ,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T2.name ,  COUNT(*) FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.name
SELECT T2.name ,  COUNT(*) FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.name
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  "English"
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  "English"
SELECT document_id ,  document_name ,  document_description FROM Documents
SELECT document_id ,  document_name ,  document_description FROM Documents
SELECT document_name ,  template_id FROM Documents WHERE Document_Description LIKE "%w%"
SELECT document_name ,  template_id FROM Documents WHERE Document_Description LIKE "%w%"
SELECT document_id ,  template_id ,  Document_Description FROM Documents WHERE document_name  =  "Robbin CV"
SELECT document_id ,  template_id ,  Document_Description FROM Documents WHERE document_name  =  "Robbin CV"
SELECT count(*) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID  =  T2.Template_ID WHERE T2.Template_Type_Code  =  'PPT'
SELECT count(*) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID  =  T2.Template_ID WHERE T2.Template_Type_Code  =  'PPT'
SELECT template_id ,  count(*) FROM Documents GROUP BY template_id
SELECT template_id ,  count(*) FROM Documents GROUP BY template_id
SELECT template_id FROM Documents GROUP BY template_id HAVING count(*)  >  1
SELECT template_id FROM Documents GROUP BY template_id HAVING count(*)  >  1
SELECT template_id ,  version_number ,  template_type_code FROM Templates
SELECT template_id ,  version_number ,  template_type_code FROM Templates
SELECT template_id FROM Templates WHERE template_type_code  =  "PP" OR template_type_code  =  "PPT"
SELECT template_id FROM Templates WHERE template_type_code  =  "PP" OR template_type_code  =  "PPT"
SELECT version_number ,  template_type_code FROM Templates WHERE version_number  >  5
SELECT version_number ,  template_type_code FROM Templates WHERE version_number  >  5
SELECT template_type_code ,  count(*) FROM Templates GROUP BY template_type_code
SELECT template_type_code ,  count(*) FROM Templates GROUP BY template_type_code
SELECT template_type_code FROM Templates GROUP BY template_type_code HAVING count(*)  <  3
SELECT template_type_code FROM Templates GROUP BY template_type_code HAVING count(*)  <  3
SELECT min(Version_Number) ,  template_type_code FROM Templates
SELECT min(Version_Number) ,  template_type_code FROM Templates
SELECT T1.template_type_code FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id WHERE T2.document_name  =  "Data base"
SELECT T1.template_type_code FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id WHERE T2.document_name  =  "Data base"
SELECT T2.document_name FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id WHERE T1.template_type_code  =  "BK"
SELECT T2.document_name FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id WHERE T1.template_type_code  =  "BK"
SELECT T1.template_type_code ,  count(*) FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_type_code
SELECT T1.template_type_code ,  count(*) FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_type_code
SELECT template_type_code ,  template_type_description FROM Ref_template_types
SELECT template_type_code ,  template_type_description FROM Ref_template_types
SELECT T2.template_id FROM Ref_template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code  = T2.template_type_code WHERE T1.template_type_description  =  "Presentation"
SELECT T2.template_id FROM Ref_template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code  = T2.template_type_code WHERE T1.template_type_description  =  "Presentation"
SELECT count(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_ID  =  T2.document_ID WHERE T2.document_name  =  'Summer Show'
SELECT count(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_ID  =  T2.document_ID WHERE T2.document_name  =  'Summer Show'
SELECT T1.paragraph_id ,   T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.Document_Name  =  'Welcome to NY'
SELECT T1.paragraph_id ,   T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.Document_Name  =  'Welcome to NY'
SELECT T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.document_name  =  "Customer reviews"
SELECT T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.document_name  =  "Customer reviews"
SELECT document_id ,  count(*) FROM Paragraphs GROUP BY document_id ORDER BY document_id
SELECT document_id ,  count(*) FROM Paragraphs GROUP BY document_id ORDER BY document_id
SELECT T1.document_id ,  T2.document_name ,  count(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.document_id
SELECT T1.document_id ,  T2.document_name ,  count(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.document_id
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*)  >=  2
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*)  >=  2
SELECT title ,  Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT title ,  Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti";
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti";
SELECT count(DISTINCT series_name) ,  count(DISTINCT content) FROM TV_Channel;
SELECT count(DISTINCT series_name) ,  count(DISTINCT content) FROM TV_Channel;
SELECT LANGUAGE ,  count(*) FROM TV_Channel GROUP BY LANGUAGE
SELECT LANGUAGE ,  count(*) FROM TV_Channel GROUP BY LANGUAGE
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = "The Rise of the Blue Beetle!";
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = "The Rise of the Blue Beetle!";
SELECT T2.Title FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = "Sky Radio";
SELECT T2.Title FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = "Sky Radio";
SELECT Episode ,  Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;
SELECT Episode ,  Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;
SELECT max(SHARE) , min(SHARE) FROM TV_series;
SELECT max(SHARE) , min(SHARE) FROM TV_series;
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = "A Love of a Lifetime";
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = "A Love of a Lifetime";
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = "Sky Radio";
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = "Sky Radio";
SELECT count(*) ,  Directed_by FROM cartoon GROUP BY Directed_by
SELECT count(*) ,  Directed_by FROM cartoon GROUP BY Directed_by
SELECT production_code ,  channel FROM cartoon ORDER BY original_air_date LIMIT 1
SELECT production_code ,  channel FROM cartoon ORDER BY original_air_date LIMIT 1
SELECT package_option ,  series_name FROM TV_Channel WHERE hight_definition_TV  =  "yes"
SELECT package_option ,  series_name FROM TV_Channel WHERE hight_definition_TV  =  "yes"
SELECT T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.written_by  =  'Todd Casey'
SELECT T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.written_by  =  'Todd Casey'
SELECT Pixel_aspect_ratio_PAR ,  country FROM tv_channel WHERE LANGUAGE ! =  'English'
SELECT Pixel_aspect_ratio_PAR ,  country FROM tv_channel WHERE LANGUAGE ! =  'English'
SELECT id FROM tv_channel GROUP BY country HAVING count(*)  >  2
SELECT id FROM tv_channel GROUP BY country HAVING count(*)  >  2
SELECT DISTINCT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T2.Receipt  =  T3.ReceiptNumber WHERE T1.Flavor  =  "Lemon" AND T1.Food  =  "Cake"
SELECT DISTINCT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T2.Receipt  =  T3.ReceiptNumber WHERE T1.Flavor  =  "Lemon" AND T1.Food  =  "Cake"
SELECT T1.food ,  count(DISTINCT T3.CustomerId) FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T2.Receipt  =  T3.ReceiptNumber GROUP BY T1.food
SELECT T1.food ,  count(DISTINCT T3.CustomerId) FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T2.Receipt  =  T3.ReceiptNumber GROUP BY T1.food
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING count(*)  >=  15
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING count(*)  >=  15
SELECT DISTINCT T1.item FROM items AS T1 JOIN receipts AS T2 ON T1.receipt  =  T2.ReceiptNumber WHERE T2.CustomerId  =  15
SELECT DISTINCT T1.item FROM items AS T1 JOIN receipts AS T2 ON T1.receipt  =  T2.ReceiptNumber WHERE T2.CustomerId  =  15
SELECT food ,  avg(price) ,  max(price) ,  min(price) FROM goods GROUP BY food
SELECT food ,  avg(price) ,  max(price) ,  min(price) FROM goods GROUP BY food
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id JOIN customers AS T4 ON T4.Id  =  T1.CustomerId WHERE T3.food  =  "Croissant" AND T4.LastName  =  'LOGAN'
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id JOIN customers AS T4 ON T4.Id  =  T1.CustomerId WHERE T3.food  =  "Croissant" AND T4.LastName  =  'LOGAN'
SELECT count(*) ,  food FROM goods GROUP BY food
SELECT count(*) ,  food FROM goods GROUP BY food
SELECT avg(price) ,  food FROM goods GROUP BY food
SELECT avg(price) ,  food FROM goods GROUP BY food
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT flavor FROM goods WHERE food  =  "Cake" AND price  >  10
SELECT flavor FROM goods WHERE food  =  "Cake" AND price  >  10
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  13
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  13
SELECT DISTINCT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  15
SELECT DISTINCT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  15
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT id ,  price FROM goods WHERE id LIKE "%70%"
SELECT id ,  price FROM goods WHERE id LIKE "%70%"
SELECT avg(price) FROM goods WHERE flavor  =  "Blackberry" OR flavor  =  "Blueberry"
SELECT avg(price) FROM goods WHERE flavor  =  "Blackberry" OR flavor  =  "Blueberry"
SELECT date ,  COUNT (DISTINCT CustomerId) FROM receipts GROUP BY date
SELECT date ,  COUNT (DISTINCT CustomerId) FROM receipts GROUP BY date
SELECT id FROM goods WHERE food  =  "Cake" AND price  >=  3 * (SELECT avg(price) FROM goods WHERE food  =  "Tart")
SELECT id FROM goods WHERE food  =  "Cake" AND price  >=  3 * (SELECT avg(price) FROM goods WHERE food  =  "Tart")
SELECT id ,  flavor ,  food FROM goods ORDER BY price
SELECT id ,  flavor ,  food FROM goods ORDER BY price
SELECT id ,  flavor FROM goods WHERE food  =  "Cake" ORDER BY flavor
SELECT id ,  flavor FROM goods WHERE food  =  "Cake" ORDER BY flavor
SELECT policy_type_code FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t2.customer_details  =  "Dayana Robel"
SELECT policy_type_code FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t2.customer_details  =  "Dayana Robel"
SELECT policy_type_code FROM policies GROUP BY policy_type_code HAVING count(*)  >  2
SELECT policy_type_code FROM policies GROUP BY policy_type_code HAVING count(*)  >  2
SELECT sum(amount_piad) ,  avg(amount_piad) FROM claim_headers
SELECT sum(amount_piad) ,  avg(amount_piad) FROM claim_headers
SELECT customer_details FROM customers WHERE customer_details LIKE "%Diana%"
SELECT customer_details FROM customers WHERE customer_details LIKE "%Diana%"
SELECT DISTINCT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.policy_type_code  =  "Deputy"
SELECT DISTINCT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.policy_type_code  =  "Deputy"
SELECT policy_type_code ,  count(*) FROM policies GROUP BY policy_type_code
SELECT policy_type_code ,  count(*) FROM policies GROUP BY policy_type_code

-------------------------hard-----------------------
SELECT T1.organisation_details FROM Organisations AS T1 JOIN Projects AS T2 ON T1.organisation_id  =  T2.organisation_id EXCEPT SELECT T1.organisation_details FROM Organisations AS T1 JOIN organisation_Types AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_type_description  =  'Sponsor'
SELECT T1.organisation_details FROM Organisations AS T1 JOIN Projects AS T2 ON T1.organisation_id  =  T2.organisation_id EXCEPT SELECT T1.organisation_details FROM Organisations AS T1 JOIN organisation_Types AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_type_description  =  'Sponsor'
SELECT T2.organisation_id ,  T2.organisation_details FROM Grants AS T1 JOIN Organisations AS T2 ON T1.organisation_id  =  T2.organisation_id GROUP BY T2.organisation_id HAVING sum(T1.grant_amount)  >  6000
SELECT T2.organisation_id ,  T2.organisation_details FROM Grants AS T1 JOIN Organisations AS T2 ON T1.organisation_id  =  T2.organisation_id GROUP BY T2.organisation_id HAVING sum(T1.grant_amount)  >  6000
SELECT T1.response_received_date FROM Documents AS T1 JOIN Document_Types AS T2 ON T1.document_type_code  =  T2.document_type_code JOIN Grants AS T3 ON T1.grant_id  =  T3.grant_id WHERE T2.document_description  =  'Regular' OR T3.grant_amount  >  100
SELECT T1.response_received_date FROM Documents AS T1 JOIN Document_Types AS T2 ON T1.document_type_code  =  T2.document_type_code JOIN Grants AS T3 ON T1.grant_id  =  T3.grant_id WHERE T2.document_description  =  'Regular' OR T3.grant_amount  >  100
SELECT project_details FROM Projects WHERE project_id NOT IN ( SELECT project_id FROM Project_Staff WHERE role_code  =  'researcher' )
SELECT project_details FROM Projects WHERE project_id NOT IN ( SELECT project_id FROM Project_Staff WHERE role_code  =  'researcher' )
SELECT T1.project_details FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id JOIN Research_outcomes AS T3 ON T2.outcome_code  =  T3.outcome_code WHERE T3.outcome_description LIKE '%Published%'
SELECT T1.project_details FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id JOIN Research_outcomes AS T3 ON T2.outcome_code  =  T3.outcome_code WHERE T3.outcome_description LIKE '%Published%'
SELECT T1.project_id ,  count(*) FROM Project_Staff AS T1 JOIN Projects AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.project_id ORDER BY count(*) ASC
SELECT T1.project_id ,  count(*) FROM Project_Staff AS T1 JOIN Projects AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.project_id ORDER BY count(*) ASC
SELECT project_details FROM Projects WHERE project_id NOT IN ( SELECT project_id FROM Project_outcomes )
SELECT project_details FROM Projects WHERE project_id NOT IN ( SELECT project_id FROM Project_outcomes )
SELECT grant_id ,  count(*) FROM Documents GROUP BY grant_id ORDER BY count(*) DESC LIMIT 1
SELECT grant_id ,  count(*) FROM Documents GROUP BY grant_id ORDER BY count(*) DESC LIMIT 1
SELECT organisation_details FROM Organisations AS T1 JOIN organisation_Types AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_type_description  =  'Sponsor' ORDER BY organisation_details
SELECT organisation_details FROM Organisations AS T1 JOIN organisation_Types AS T2 ON T1.organisation_type  =  T2.organisation_type WHERE T2.organisation_type_description  =  'Sponsor' ORDER BY organisation_details
SELECT project_details FROM Projects WHERE organisation_id IN ( SELECT organisation_id FROM Projects GROUP BY organisation_id ORDER BY count(*) DESC LIMIT 1 )
SELECT project_details FROM Projects WHERE organisation_id IN ( SELECT organisation_id FROM Projects GROUP BY organisation_id ORDER BY count(*) DESC LIMIT 1 )
SELECT role_code FROM Project_Staff GROUP BY role_code ORDER BY count(*) DESC LIMIT 1
SELECT role_code FROM Project_Staff GROUP BY role_code ORDER BY count(*) DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS ORDER BY count(*) DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS ORDER BY count(*) DESC LIMIT 1
SELECT earpads FROM headphone GROUP BY earpads ORDER BY count(*) DESC LIMIT 2
SELECT earpads FROM headphone GROUP BY earpads ORDER BY count(*) DESC LIMIT 2
SELECT CLASS FROM headphone WHERE earpads  =  'Bowls' INTERSECT SELECT CLASS FROM headphone WHERE earpads  =  'Comfort Pads'
SELECT CLASS FROM headphone WHERE earpads  =  'Bowls' INTERSECT SELECT CLASS FROM headphone WHERE earpads  =  'Comfort Pads'
SELECT earpads FROM headphone EXCEPT SELECT earpads FROM headphone WHERE construction  =  'Plastic'
SELECT earpads FROM headphone EXCEPT SELECT earpads FROM headphone WHERE construction  =  'Plastic'
SELECT model FROM headphone WHERE price  <  (SELECT avg(price) FROM headphone)
SELECT model FROM headphone WHERE price  <  (SELECT avg(price) FROM headphone)
SELECT name FROM store WHERE store_id NOT IN (SELECT store_id FROM stock)
SELECT name FROM store WHERE store_id NOT IN (SELECT store_id FROM stock)
SELECT model FROM headphone WHERE headphone_id NOT IN (SELECT headphone_id FROM stock)
SELECT model FROM headphone WHERE headphone_id NOT IN (SELECT headphone_id FROM stock)
SELECT Neighborhood FROM store EXCEPT SELECT t1.Neighborhood FROM store AS t1 JOIN stock AS t2 ON t1.store_id  =  t2.store_id
SELECT Neighborhood FROM store EXCEPT SELECT t1.Neighborhood FROM store AS t1 JOIN stock AS t2 ON t1.store_id  =  t2.store_id
SELECT min(date_order_placed) FROM Orders UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1
SELECT min(date_order_placed) FROM Orders UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1
SELECT T1.order_id ,  T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT T1.order_id ,  T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT Payment_method_code FROM Customer_Payment_Methods GROUP BY Payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT Payment_method_code FROM Customer_Payment_Methods GROUP BY Payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN ( SELECT invoice_number FROM Shipments )
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN ( SELECT invoice_number FROM Shipments )
SELECT date_order_placed FROM Orders WHERE customer_id IN ( SELECT T1.customer_id FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 )
SELECT date_order_placed FROM Orders WHERE customer_id IN ( SELECT T1.customer_id FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 )
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY count(*) LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY count(*) LIMIT 1
SELECT T1.product_id ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT T1.product_id ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT T1.invoice_date ,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT T1.invoice_date ,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT T1.Capital FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT T1.Capital FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT country FROM country WHERE country_id NOT IN (SELECT country FROM driver)
SELECT country FROM country WHERE country_id NOT IN (SELECT country FROM driver)
SELECT t1.manager ,  t1.car_owner FROM team AS t1 JOIN team_driver AS t2 ON t1.team_id  =  t2.team_id GROUP BY t2.team_id HAVING count(*)  >=  2
SELECT t1.manager ,  t1.car_owner FROM team AS t1 JOIN team_driver AS t2 ON t1.team_id  =  t2.team_id GROUP BY t2.team_id HAVING count(*)  >=  2
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds LIMIT 1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds LIMIT 1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds DESC LIMIT 1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.milliseconds DESC LIMIT 1
SELECT T1.driverid ,  T1.forename ,  count(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid HAVING count(*)  >=  2
SELECT T1.driverid ,  T1.forename ,  count(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid HAVING count(*)  >=  2
SELECT T1.driverid ,  count(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid HAVING count(*)  <=  30
SELECT T1.driverid ,  count(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid HAVING count(*)  <=  30
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  "Asia" OR T2.Market_district  =  "USA"
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  "Asia" OR T2.Market_district  =  "USA"
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT Title FROM game EXCEPT SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT Title FROM game EXCEPT SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT name FROM program EXCEPT SELECT t1.name FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id WHERE t2.Time_of_day  =  "Morning"
SELECT name FROM program EXCEPT SELECT t1.name FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id WHERE t2.Time_of_day  =  "Morning"
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' OR T2.name  =  'Imperial'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' OR T2.name  =  'Imperial'
SELECT title FROM movies EXCEPT SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT title FROM movies EXCEPT SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT name FROM movietheaters GROUP BY name ORDER BY count(*) DESC LIMIT 1
SELECT name FROM movietheaters GROUP BY name ORDER BY count(*) DESC LIMIT 1
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Movie IS NOT NULL)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Movie IS NOT NULL)
SELECT name FROM Aircraft WHERE distance  >  (SELECT avg(distance) FROM Aircraft)
SELECT name FROM Aircraft WHERE distance  >  (SELECT avg(distance) FROM Aircraft)
SELECT name FROM Employee WHERE salary  >  (SELECT avg(salary) FROM Employee)
SELECT name FROM Employee WHERE salary  >  (SELECT avg(salary) FROM Employee)
SELECT origin FROM Flight GROUP BY origin ORDER BY count(*) DESC LIMIT 1
SELECT origin FROM Flight GROUP BY origin ORDER BY count(*) DESC LIMIT 1
SELECT destination FROM Flight GROUP BY destination ORDER BY count(*) LIMIT 1
SELECT destination FROM Flight GROUP BY destination ORDER BY count(*) LIMIT 1
SELECT T2.name FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid GROUP BY T1.aid HAVING count(*)  >= 2
SELECT T2.name FROM Flight AS T1 JOIN Aircraft AS T2 ON T1.aid  =  T2.aid GROUP BY T1.aid HAVING count(*)  >= 2
SELECT eid FROM Employee EXCEPT SELECT eid FROM Certificate
SELECT eid FROM Employee EXCEPT SELECT eid FROM Certificate
SELECT name FROM Employee EXCEPT SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  "Boeing 737-800"
SELECT name FROM Employee EXCEPT SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  "Boeing 737-800"
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id ORDER BY T2.Feb DESC LIMIT 1
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id ORDER BY T2.Feb DESC LIMIT 1
SELECT city FROM city WHERE regional_population  >  10000000 UNION SELECT city FROM city WHERE regional_population  <  5000000
SELECT city FROM city WHERE regional_population  >  10000000 UNION SELECT city FROM city WHERE regional_population  <  5000000
SELECT t1.gdp ,  t1.Regional_Population FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city GROUP BY t2.Host_City HAVING count(*)  >  1
SELECT t1.gdp ,  t1.Regional_Population FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city GROUP BY t2.Host_City HAVING count(*)  >  1
SELECT product_name FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_id ,  product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT product_id ,  product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code  =  ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1)
SELECT customer_name FROM Customers WHERE payment_method_code  =  ( SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1)
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT order_status_code FROM Customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT product_name FROM Products EXCEPT SELECT T1.product_name FROM Products AS t1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT product_name FROM Products EXCEPT SELECT T1.product_name FROM Products AS t1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Customer_orders
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Customer_orders
SELECT T2.Shop_Name FROM stock AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID HAVING COUNT(*)  >  1
SELECT T2.Shop_Name FROM stock AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID HAVING COUNT(*)  >  1
SELECT Software_Platform FROM device GROUP BY Software_Platform ORDER BY COUNT(*) DESC LIMIT 1
SELECT Software_Platform FROM device GROUP BY Software_Platform ORDER BY COUNT(*) DESC LIMIT 1
SELECT Shop_Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM stock)
SELECT Shop_Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM stock)
SELECT LOCATION FROM shop WHERE Open_Year  >  2012 INTERSECT SELECT LOCATION FROM shop WHERE Open_Year  <  2008
SELECT LOCATION FROM shop WHERE Open_Year  >  2012 INTERSECT SELECT LOCATION FROM shop WHERE Open_Year  <  2008
SELECT Carrier FROM device WHERE Device_ID NOT IN (SELECT Device_ID FROM stock)
SELECT Carrier FROM device WHERE Device_ID NOT IN (SELECT Device_ID FROM stock)
SELECT T2.Carrier FROM stock AS T1 JOIN device AS T2 ON T1.Device_ID  =  T2.Device_ID GROUP BY T1.Device_ID HAVING COUNT(*)  >  1
SELECT T2.Carrier FROM stock AS T1 JOIN device AS T2 ON T1.Device_ID  =  T2.Device_ID GROUP BY T1.Device_ID HAVING COUNT(*)  >  1
SELECT poll_source FROM candidate GROUP BY poll_source ORDER BY count(*) DESC LIMIT 1
SELECT poll_source FROM candidate GROUP BY poll_source ORDER BY count(*) DESC LIMIT 1
SELECT t1.name ,  t1.sex FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id ORDER BY t2.support_rate DESC LIMIT 1
SELECT t1.name ,  t1.sex FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id ORDER BY t2.support_rate DESC LIMIT 1
SELECT t1.name ,  t1.sex FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id GROUP BY t1.sex HAVING oppose_rate  =  min(oppose_rate)
SELECT t1.name ,  t1.sex FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id GROUP BY t1.sex HAVING oppose_rate  =  min(oppose_rate)
SELECT name FROM people WHERE people_id NOT IN (SELECT people_id FROM candidate)
SELECT name FROM people WHERE people_id NOT IN (SELECT people_id FROM candidate)
SELECT t1.name FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id WHERE t1.sex  =  'F' ORDER BY t1.name
SELECT t1.name FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id WHERE t1.sex  =  'F' ORDER BY t1.name
SELECT name FROM people WHERE height  <  (SELECT avg(height) FROM people)
SELECT name FROM people WHERE height  <  (SELECT avg(height) FROM people)
SELECT name FROM student WHERE dept_name  =  'History' ORDER BY tot_cred DESC LIMIT 1
SELECT name FROM student WHERE dept_name  =  'History' ORDER BY tot_cred DESC LIMIT 1
SELECT T1.title FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  =  2
SELECT T1.title FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  =  2
SELECT T1.title ,  T1.credits , T1.dept_name FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  >  1
SELECT T1.title ,  T1.credits , T1.dept_name FROM course AS T1 JOIN prereq AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_id HAVING count(*)  >  1
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)
SELECT name FROM instructor WHERE dept_name  =  'Statistics' ORDER BY salary LIMIT 1
SELECT name FROM instructor WHERE dept_name  =  'Statistics' ORDER BY salary LIMIT 1
SELECT title FROM course WHERE dept_name  =  'Statistics' INTERSECT SELECT title FROM course WHERE dept_name  =  'Psychology'
SELECT title FROM course WHERE dept_name  =  'Statistics' INTERSECT SELECT title FROM course WHERE dept_name  =  'Psychology'
SELECT title FROM course WHERE dept_name  =  'Statistics' EXCEPT SELECT title FROM course WHERE dept_name  =  'Psychology'
SELECT title FROM course WHERE dept_name  =  'Statistics' EXCEPT SELECT title FROM course WHERE dept_name  =  'Psychology'
SELECT dept_name FROM course GROUP BY dept_name ORDER BY count(*) DESC LIMIT 3
SELECT dept_name FROM course GROUP BY dept_name ORDER BY count(*) DESC LIMIT 3
SELECT dept_name FROM course GROUP BY dept_name ORDER BY sum(credits) DESC LIMIT 1
SELECT dept_name FROM course GROUP BY dept_name ORDER BY sum(credits) DESC LIMIT 1
SELECT T1.title ,  T3.name FROM course AS T1 JOIN teaches AS T2 ON T1.course_id  =  T2.course_id JOIN instructor AS T3 ON T2.id  =  T3.id WHERE YEAR  =  2008 ORDER BY T1.title
SELECT T1.title ,  T3.name FROM course AS T1 JOIN teaches AS T2 ON T1.course_id  =  T2.course_id JOIN instructor AS T3 ON T2.id  =  T3.id WHERE YEAR  =  2008 ORDER BY T1.title
SELECT T1.name FROM instructor AS T1 JOIN advisor AS T2 ON T1.id  =  T2.i_id GROUP BY T2.i_id HAVING count(*)  >  1
SELECT T1.name FROM instructor AS T1 JOIN advisor AS T2 ON T1.id  =  T2.i_id GROUP BY T2.i_id HAVING count(*)  >  1
SELECT T1.name FROM student AS T1 JOIN advisor AS T2 ON T1.id  =  T2.s_id GROUP BY T2.s_id HAVING count(*)  >  1
SELECT T1.name FROM student AS T1 JOIN advisor AS T2 ON T1.id  =  T2.s_id GROUP BY T2.s_id HAVING count(*)  >  1
SELECT YEAR FROM SECTION GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1
SELECT YEAR FROM SECTION GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1
SELECT semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR ORDER BY count(*) DESC LIMIT 1
SELECT semester ,  YEAR FROM SECTION GROUP BY semester ,  YEAR ORDER BY count(*) DESC LIMIT 1
SELECT dept_name FROM student GROUP BY dept_name ORDER BY count(*) DESC LIMIT 1
SELECT dept_name FROM student GROUP BY dept_name ORDER BY count(*) DESC LIMIT 1
SELECT semester ,  YEAR FROM takes GROUP BY semester ,  YEAR ORDER BY count(*) LIMIT 1
SELECT semester ,  YEAR FROM takes GROUP BY semester ,  YEAR ORDER BY count(*) LIMIT 1
SELECT course_id FROM course EXCEPT SELECT course_id FROM prereq
SELECT course_id FROM course EXCEPT SELECT course_id FROM prereq
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)
SELECT title FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'International Finance')
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'International Finance')
SELECT title FROM course WHERE course_id IN (SELECT T1.course_id FROM prereq AS T1 JOIN course AS T2 ON T1.prereq_id  =  T2.course_id WHERE T2.title  =  'Differential Geometry')
SELECT title FROM course WHERE course_id IN (SELECT T1.course_id FROM prereq AS T1 JOIN course AS T2 ON T1.prereq_id  =  T2.course_id WHERE T2.title  =  'Differential Geometry')
SELECT name FROM student WHERE id IN (SELECT id FROM takes WHERE semester  =  'Fall' AND YEAR  =  2003)
SELECT name FROM student WHERE id IN (SELECT id FROM takes WHERE semester  =  'Fall' AND YEAR  =  2003)
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math' ORDER BY T3.tot_cred
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id WHERE T3.dept_name  =  'Math' ORDER BY T3.tot_cred
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'Mobile Computing')
SELECT title FROM course WHERE course_id IN (SELECT T1.prereq_id FROM prereq AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.title  =  'Mobile Computing')
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id ORDER BY T3.tot_cred DESC LIMIT 1
SELECT T2.name FROM advisor AS T1 JOIN instructor AS T2 ON T1.i_id  =  T2.id JOIN student AS T3 ON T1.s_id  =  T3.id ORDER BY T3.tot_cred DESC LIMIT 1
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches)
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches)
SELECT id FROM instructor EXCEPT SELECT id FROM teaches
SELECT id FROM instructor EXCEPT SELECT id FROM teaches
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches WHERE semester  =  'Spring')
SELECT name FROM instructor WHERE id NOT IN (SELECT id FROM teaches WHERE semester  =  'Spring')
SELECT dept_name FROM instructor GROUP BY dept_name ORDER BY avg(salary) DESC LIMIT 1
SELECT dept_name FROM instructor GROUP BY dept_name ORDER BY avg(salary) DESC LIMIT 1
SELECT avg(T1.salary) ,  count(*) FROM instructor AS T1 JOIN department AS T2 ON T1.dept_name  =  T2.dept_name ORDER BY T2.budget DESC LIMIT 1
SELECT avg(T1.salary) ,  count(*) FROM instructor AS T1 JOIN department AS T2 ON T1.dept_name  =  T2.dept_name ORDER BY T2.budget DESC LIMIT 1
SELECT name FROM student WHERE id NOT IN (SELECT T1.id FROM takes AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.dept_name  =  'Biology')
SELECT name FROM student WHERE id NOT IN (SELECT T1.id FROM takes AS T1 JOIN course AS T2 ON T1.course_id  =  T2.course_id WHERE T2.dept_name  =  'Biology')
SELECT T2.building ,  T2.room_number ,  T2.semester ,  T2.year FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE T1.dept_name  =  'Psychology' ORDER BY T1.title
SELECT T2.building ,  T2.room_number ,  T2.semester ,  T2.year FROM course AS T1 JOIN SECTION AS T2 ON T1.course_id  =  T2.course_id WHERE T1.dept_name  =  'Psychology' ORDER BY T1.title
SELECT DISTINCT salary FROM instructor WHERE salary  <  (SELECT max(salary) FROM instructor)
SELECT DISTINCT salary FROM instructor WHERE salary  <  (SELECT max(salary) FROM instructor)
SELECT name FROM instructor WHERE salary  >  (SELECT min(salary) FROM instructor WHERE dept_name  =  'Biology')
SELECT name FROM instructor WHERE salary  >  (SELECT min(salary) FROM instructor WHERE dept_name  =  'Biology')
SELECT name FROM instructor WHERE salary  >  (SELECT max(salary) FROM instructor WHERE dept_name  =  'Biology')
SELECT name FROM instructor WHERE salary  >  (SELECT max(salary) FROM instructor WHERE dept_name  =  'Biology')
SELECT label FROM albums GROUP BY label ORDER BY count(*) DESC LIMIT 1
SELECT label FROM albums GROUP BY label ORDER BY count(*) DESC LIMIT 1
SELECT instrument FROM instruments GROUP BY instrument ORDER BY count(*) DESC LIMIT 1
SELECT instrument FROM instruments GROUP BY instrument ORDER BY count(*) DESC LIMIT 1
SELECT TYPE FROM vocals GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1
SELECT TYPE FROM vocals GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  "lead"
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  "lead"
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  "back"
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  "back"
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  "back"
SELECT DISTINCT title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid EXCEPT SELECT t2.title FROM vocals AS t1 JOIN songs AS t2 ON t1.songid  =  t2.songid WHERE TYPE  =  "back"
SELECT book_series FROM book WHERE sale_amount  >  1000 INTERSECT SELECT book_series FROM book WHERE sale_amount  <  500
SELECT book_series FROM book WHERE sale_amount  >  1000 INTERSECT SELECT book_series FROM book WHERE sale_amount  <  500
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id GROUP BY t2.author_id HAVING count(*)  >  1
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id GROUP BY t2.author_id HAVING count(*)  >  1
SELECT t1.name ,  t2.title ,  t3.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id JOIN press AS t3 ON t2.press_id  =  t3.press_id ORDER BY t2.sale_amount DESC LIMIT 3
SELECT t1.name ,  t2.title ,  t3.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id JOIN press AS t3 ON t2.press_id  =  t3.press_id ORDER BY t2.sale_amount DESC LIMIT 3
SELECT count(*) ,  t2.name FROM book AS t1 JOIN press AS t2 ON t1.press_id  =  t2.press_id WHERE sale_amount  >  1000 GROUP BY t2.name
SELECT count(*) ,  t2.name FROM book AS t1 JOIN press AS t2 ON t1.press_id  =  t2.press_id WHERE sale_amount  >  1000 GROUP BY t2.name
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id ORDER BY t2.sale_amount DESC LIMIT 1
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id ORDER BY t2.sale_amount DESC LIMIT 1
SELECT name FROM author EXCEPT SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id JOIN press AS t3 ON t2.press_id  =  t3.press_id WHERE t3.name  =  'Accor'
SELECT name FROM author EXCEPT SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id JOIN press AS t3 ON t2.press_id  =  t3.press_id WHERE t3.name  =  'Accor'
SELECT t2.name ,  t2.Year_Profits_billion FROM book AS t1 JOIN press AS t2 ON t1.press_id  =  t2.press_id GROUP BY t2.press_id HAVING count(*)  >  2
SELECT t2.name ,  t2.Year_Profits_billion FROM book AS t1 JOIN press AS t2 ON t1.press_id  =  t2.press_id GROUP BY t2.press_id HAVING count(*)  >  2
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.id HAVING COUNT(*)  >=  2
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.id HAVING COUNT(*)  >=  2
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id GROUP BY T3.id ORDER BY avg(T1.overall_score) DESC
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id GROUP BY T3.id ORDER BY avg(T1.overall_score) DESC
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT template_id FROM Templates EXCEPT SELECT template_id FROM Documents
SELECT template_id FROM Templates EXCEPT SELECT template_id FROM Documents
SELECT template_type_code FROM Templates GROUP BY template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT template_type_code FROM Templates GROUP BY template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT template_type_code FROM Templates EXCEPT SELECT template_type_code FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id
SELECT template_type_code FROM Templates EXCEPT SELECT template_type_code FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id
SELECT document_id FROM Paragraphs GROUP BY document_id ORDER BY count(*) ASC LIMIT 1
SELECT document_id FROM Paragraphs GROUP BY document_id ORDER BY count(*) ASC LIMIT 1
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2
SELECT document_id FROM Paragraphs WHERE paragraph_text  =  'Brazil' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text  =  'Ireland'
SELECT document_id FROM Paragraphs WHERE paragraph_text  =  'Brazil' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text  =  'Ireland'
SELECT Country ,  count(*) FROM TV_Channel GROUP BY Country ORDER BY count(*) DESC LIMIT 1;
SELECT Country ,  count(*) FROM TV_Channel GROUP BY Country ORDER BY count(*) DESC LIMIT 1;
SELECT LANGUAGE ,  count(*) FROM TV_Channel GROUP BY LANGUAGE ORDER BY count(*) ASC LIMIT 1;
SELECT LANGUAGE ,  count(*) FROM TV_Channel GROUP BY LANGUAGE ORDER BY count(*) ASC LIMIT 1;
SELECT country FROM TV_Channel EXCEPT SELECT T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.written_by  =  'Todd Casey'
SELECT country FROM TV_Channel EXCEPT SELECT T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.written_by  =  'Todd Casey'
SELECT id FROM TV_Channel EXCEPT SELECT channel FROM cartoon WHERE directed_by  =  'Ben Jones'
SELECT id FROM TV_Channel EXCEPT SELECT channel FROM cartoon WHERE directed_by  =  'Ben Jones'
SELECT package_option FROM TV_Channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by  =  'Ben Jones')
SELECT package_option FROM TV_Channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by  =  'Ben Jones')
SELECT id ,  flavor FROM goods WHERE food  =  "Cake" ORDER BY price DESC LIMIT 1
SELECT id ,  flavor FROM goods WHERE food  =  "Cake" ORDER BY price DESC LIMIT 1
SELECT id ,  flavor FROM goods WHERE food  =  "Cookie" ORDER BY price LIMIT 1
SELECT id ,  flavor FROM goods WHERE food  =  "Cookie" ORDER BY price LIMIT 1
SELECT T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.id GROUP BY T2.id HAVING count(*)  >  10
SELECT T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.id GROUP BY T2.id HAVING count(*)  >  10
SELECT T1.ReceiptNumber ,  T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id ORDER BY T3.price DESC LIMIT 1
SELECT T1.ReceiptNumber ,  T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id ORDER BY T3.price DESC LIMIT 1
SELECT item FROM items GROUP BY item ORDER BY count(*) LIMIT 1
SELECT item FROM items GROUP BY item ORDER BY count(*) LIMIT 1
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT max(price) FROM goods WHERE food  =  "Tart")
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT max(price) FROM goods WHERE food  =  "Tart")
SELECT id FROM goods WHERE food  =  "Cookie" OR food  =  "Cake" AND price BETWEEN 3 AND 7
SELECT id FROM goods WHERE food  =  "Cookie" OR food  =  "Cake" AND price BETWEEN 3 AND 7
SELECT T1.FirstName ,  T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.CustomerId ORDER BY T2.date LIMIT 1
SELECT T1.FirstName ,  T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.CustomerId ORDER BY T2.date LIMIT 1
SELECT date FROM receipts GROUP BY date ORDER BY count(*) DESC LIMIT 3
SELECT date FROM receipts GROUP BY date ORDER BY count(*) DESC LIMIT 3
SELECT CustomerId ,  count(*) FROM receipts GROUP BY CustomerId ORDER BY count(*) DESC LIMIT 1
SELECT CustomerId ,  count(*) FROM receipts GROUP BY CustomerId ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT flavor FROM goods WHERE food  =  "Cake" EXCEPT SELECT DISTINCT flavor FROM goods WHERE food  =  "Tart"
SELECT DISTINCT flavor FROM goods WHERE food  =  "Cake" EXCEPT SELECT DISTINCT flavor FROM goods WHERE food  =  "Tart"
SELECT item FROM items GROUP BY item ORDER BY COUNT (*) DESC LIMIT 3
SELECT item FROM items GROUP BY item ORDER BY COUNT (*) DESC LIMIT 3
SELECT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.CustomerId HAVING sum(T1.price)  >  150
SELECT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.CustomerId HAVING sum(T1.price)  >  150
SELECT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.CustomerId HAVING avg(T1.price)  >  5
SELECT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.CustomerId HAVING avg(T1.price)  >  5
SELECT T3.date FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.date HAVING sum(T1.price)  >  100
SELECT T3.date FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.date HAVING sum(T1.price)  >  100
SELECT policy_type_code FROM policies GROUP BY policy_type_code ORDER BY count(*) DESC LIMIT 1
SELECT policy_type_code FROM policies GROUP BY policy_type_code ORDER BY count(*) DESC LIMIT 1
SELECT customer_details FROM customers EXCEPT SELECT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id
SELECT customer_details FROM customers EXCEPT SELECT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id
SELECT DISTINCT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.policy_type_code  =  "Deputy" OR t1.policy_type_code  =  "Uniform"
SELECT DISTINCT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.policy_type_code  =  "Deputy" OR t1.policy_type_code  =  "Uniform"
SELECT customer_details FROM customers UNION SELECT staff_details FROM staff
SELECT customer_details FROM customers UNION SELECT staff_details FROM staff

-------------------------easy-----------------------
SELECT count(DISTINCT role_code) FROM Project_Staff
SELECT count(DISTINCT role_code) FROM Project_Staff
SELECT role_description FROM Staff_Roles WHERE role_code  =  'researcher'
SELECT role_description FROM Staff_Roles WHERE role_code  =  'researcher'
SELECT count(*) FROM Project_outcomes WHERE outcome_code  =  'Patent'
SELECT count(*) FROM Project_outcomes WHERE outcome_code  =  'Patent'
SELECT staff_details FROM Research_Staff ORDER BY staff_details ASC
SELECT staff_details FROM Research_Staff ORDER BY staff_details ASC
SELECT count(*) FROM Tasks
SELECT count(*) FROM Tasks
SELECT T1.outcome_description FROM Research_outcomes AS T1 JOIN Project_outcomes AS T2 ON T1.outcome_code  =  T2.outcome_code
SELECT T1.outcome_description FROM Research_outcomes AS T1 JOIN Project_outcomes AS T2 ON T1.outcome_code  =  T2.outcome_code
SELECT DISTINCT model FROM headphone ORDER BY model
SELECT DISTINCT model FROM headphone ORDER BY model
SELECT count(DISTINCT earpads) FROM headphone
SELECT count(DISTINCT earpads) FROM headphone
SELECT name FROM store ORDER BY date_opened
SELECT name FROM store ORDER BY date_opened
SELECT count(DISTINCT neighborhood) FROM store
SELECT count(DISTINCT neighborhood) FROM store
SELECT count(DISTINCT customer_id) FROM Orders
SELECT count(DISTINCT customer_id) FROM Orders
SELECT count(DISTINCT order_item_status_code) FROM Order_items
SELECT count(DISTINCT order_item_status_code) FROM Order_items
SELECT count(DISTINCT Payment_method_code) FROM Customer_Payment_Methods
SELECT count(DISTINCT Payment_method_code) FROM Customer_Payment_Methods
SELECT count(*) FROM Shipment_Items
SELECT count(*) FROM Shipment_Items
SELECT avg(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT avg(T1.product_price) FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT avg(T1.product_price) FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT count(*) FROM driver
SELECT count(*) FROM driver
SELECT avg(Laps) FROM driver WHERE age  <  20
SELECT avg(Laps) FROM driver WHERE age  <  20
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT count(*) FROM driver WHERE Points  <  150
SELECT count(*) FROM driver WHERE Points  <  150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT name FROM races WHERE YEAR = 2017
SELECT name FROM races WHERE YEAR = 2017
SELECT DISTINCT forename FROM drivers ORDER BY forename ASC
SELECT DISTINCT forename FROM drivers ORDER BY forename ASC
SELECT DISTINCT name FROM races ORDER BY name DESC
SELECT DISTINCT name FROM races ORDER BY name DESC
SELECT count(*) FROM game
SELECT count(*) FROM game
SELECT avg(Units_sold_Millions) FROM game WHERE developers ! =  'Nintendo'
SELECT avg(Units_sold_Millions) FROM game WHERE developers ! =  'Nintendo'
SELECT count(*) FROM player WHERE Rank_of_the_year  <=  3
SELECT count(*) FROM player WHERE Rank_of_the_year  <=  3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT name FROM channel WHERE OWNER ! =  'CCTV'
SELECT name FROM channel WHERE OWNER ! =  'CCTV'
SELECT name FROM channel ORDER BY rating_in_percent DESC
SELECT name FROM channel ORDER BY rating_in_percent DESC
SELECT count(*) FROM program
SELECT count(*) FROM program
SELECT name FROM program ORDER BY launch
SELECT name FROM program ORDER BY launch
SELECT sum(Share_in_percent) FROM channel WHERE OWNER  =  'CCTV'
SELECT sum(Share_in_percent) FROM channel WHERE OWNER  =  'CCTV'
SELECT count(DISTINCT program_id) FROM broadcast WHERE time_of_day  =  'Night'
SELECT count(DISTINCT program_id) FROM broadcast WHERE time_of_day  =  'Night'
SELECT origin FROM program ORDER BY origin
SELECT origin FROM program ORDER BY origin
SELECT count(DISTINCT OWNER) FROM channel
SELECT count(DISTINCT OWNER) FROM channel
SELECT name FROM program WHERE origin ! =  'Beijing'
SELECT name FROM program WHERE origin ! =  'Beijing'
SELECT title FROM movies WHERE rating IS NULL
SELECT title FROM movies WHERE rating IS NULL
SELECT title FROM movies WHERE rating  =  'G'
SELECT title FROM movies WHERE rating  =  'G'
SELECT count(*) FROM movies WHERE rating  =  'G'
SELECT count(*) FROM movies WHERE rating  =  'G'
SELECT count(*) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT count(*) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT count(DISTINCT T1.code) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT count(DISTINCT T1.code) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT count(DISTINCT name) FROM movietheaters
SELECT count(DISTINCT name) FROM movietheaters
SELECT title FROM movies ORDER BY title
SELECT title FROM movies ORDER BY title
SELECT title FROM movies ORDER BY rating
SELECT title FROM movies ORDER BY rating
SELECT DISTINCT name FROM MovieTheaters WHERE Movie IS NULL
SELECT DISTINCT name FROM MovieTheaters WHERE Movie IS NULL
SELECT title FROM movies
SELECT title FROM movies
SELECT DISTINCT rating FROM movies
SELECT DISTINCT rating FROM movies
SELECT * FROM movies WHERE rating IS NULL
SELECT * FROM movies WHERE rating IS NULL
SELECT count(*) FROM Aircraft
SELECT count(*) FROM Aircraft
SELECT aid FROM Aircraft WHERE distance  >  1000
SELECT aid FROM Aircraft WHERE distance  >  1000
SELECT count(*) FROM Employee
SELECT count(*) FROM Employee
SELECT eid FROM Employee WHERE salary  >  100000
SELECT eid FROM Employee WHERE salary  >  100000
SELECT count(*) FROM Flight
SELECT count(*) FROM Flight
SELECT flno FROM Flight WHERE origin  =  "Los Angeles"
SELECT flno FROM Flight WHERE origin  =  "Los Angeles"
SELECT origin FROM Flight WHERE destination  =  "Honolulu"
SELECT origin FROM Flight WHERE destination  =  "Honolulu"
SELECT flno FROM Flight WHERE distance  >  2000
SELECT flno FROM Flight WHERE distance  >  2000
SELECT count(DISTINCT eid) FROM Certificate
SELECT count(DISTINCT eid) FROM Certificate
SELECT match_id FROM MATCH WHERE competition = "1994 FIFA World Cup qualification"
SELECT match_id FROM MATCH WHERE competition = "1994 FIFA World Cup qualification"
SELECT city FROM city WHERE regional_population  >  10000000
SELECT city FROM city WHERE regional_population  >  10000000
SELECT venue FROM MATCH ORDER BY date DESC
SELECT venue FROM MATCH ORDER BY date DESC
SELECT count(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT count(*) FROM Products
SELECT count(*) FROM Products
SELECT product_price FROM Products WHERE product_name  =  "Monitor"
SELECT product_price FROM Products WHERE product_name  =  "Monitor"
SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Clothes"
SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Clothes"
SELECT count(*) FROM Products WHERE product_type_code  =  "Hardware"
SELECT count(*) FROM Products WHERE product_type_code  =  "Hardware"
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT count(*) FROM Customers
SELECT count(*) FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT count(*) FROM Customer_orders
SELECT count(*) FROM Customer_orders
SELECT count(DISTINCT customer_id) FROM Customer_orders
SELECT count(DISTINCT customer_id) FROM Customer_orders
SELECT count(*) FROM device
SELECT count(*) FROM device
SELECT Carrier FROM device ORDER BY Carrier ASC
SELECT Carrier FROM device ORDER BY Carrier ASC
SELECT Carrier FROM device WHERE Software_Platform ! =  'Android'
SELECT Carrier FROM device WHERE Software_Platform ! =  'Android'
SELECT Shop_Name FROM shop ORDER BY Open_Year ASC
SELECT Shop_Name FROM shop ORDER BY Open_Year ASC
SELECT avg(Quantity) FROM stock
SELECT avg(Quantity) FROM stock
SELECT count(DISTINCT Software_Platform) FROM device
SELECT count(DISTINCT Software_Platform) FROM device
SELECT count(*) FROM candidate
SELECT count(*) FROM candidate
SELECT name FROM people ORDER BY date_of_birth
SELECT name FROM people ORDER BY date_of_birth
SELECT name FROM people WHERE height  >  200 OR height  <  190
SELECT name FROM people WHERE height  >  200 OR height  <  190
SELECT * FROM people
SELECT * FROM people
SELECT DISTINCT building FROM classroom WHERE capacity  >  50
SELECT DISTINCT building FROM classroom WHERE capacity  >  50
SELECT count(*) FROM classroom WHERE building ! =  'Lamberton'
SELECT count(*) FROM classroom WHERE building ! =  'Lamberton'
SELECT count(*) FROM classroom WHERE building  =  'Lamberton'
SELECT count(*) FROM classroom WHERE building  =  'Lamberton'
SELECT count(DISTINCT s_id) FROM advisor
SELECT count(DISTINCT s_id) FROM advisor
SELECT count(DISTINCT dept_name) FROM course
SELECT count(DISTINCT dept_name) FROM course
SELECT count(DISTINCT course_id) FROM course WHERE dept_name  =  'Physics'
SELECT count(DISTINCT course_id) FROM course WHERE dept_name  =  'Physics'
SELECT COUNT (DISTINCT id) FROM teaches
SELECT COUNT (DISTINCT id) FROM teaches
SELECT title FROM course ORDER BY title ,  credits
SELECT title FROM course ORDER BY title ,  credits
SELECT * FROM instructor ORDER BY salary
SELECT * FROM instructor ORDER BY salary
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'
SELECT name FROM instructor WHERE dept_name  =  'Comp. Sci.'
SELECT DISTINCT name FROM  instructor ORDER BY name
SELECT DISTINCT name FROM  instructor ORDER BY name
SELECT count(*) FROM Band
SELECT count(*) FROM Band
SELECT DISTINCT label FROM Albums
SELECT DISTINCT label FROM Albums
SELECT * FROM Albums WHERE YEAR  =  2012
SELECT * FROM Albums WHERE YEAR  =  2012
SELECT count(*) FROM Songs
SELECT count(*) FROM Songs
SELECT count(DISTINCT label) FROM albums
SELECT count(DISTINCT label) FROM albums
SELECT DISTINCT instrument FROM Instruments
SELECT DISTINCT instrument FROM Instruments
SELECT count(*) FROM instruments WHERE instrument  =  "drums"
SELECT count(*) FROM instruments WHERE instrument  =  "drums"
SELECT DISTINCT TYPE FROM vocals
SELECT DISTINCT TYPE FROM vocals
SELECT * FROM Albums WHERE YEAR  =  2010
SELECT * FROM Albums WHERE YEAR  =  2010
SELECT name FROM press ORDER BY Year_Profits_billion DESC
SELECT name FROM press ORDER BY Year_Profits_billion DESC
SELECT name FROM press WHERE Year_Profits_billion  >  15 OR Month_Profits_billion  >  1
SELECT name FROM press WHERE Year_Profits_billion  >  15 OR Month_Profits_billion  >  1
SELECT count(*) FROM author WHERE age  <  30
SELECT count(*) FROM author WHERE age  <  30
SELECT title FROM book ORDER BY release_date DESC
SELECT title FROM book ORDER BY release_date DESC
SELECT count(*) FROM languages
SELECT count(*) FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT avg(justice_score) FROM countries
SELECT avg(justice_score) FROM countries
SELECT count(DISTINCT language_id) FROM official_languages
SELECT count(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT count(*) FROM Documents
SELECT count(*) FROM Documents
SELECT count(DISTINCT template_id) FROM Documents
SELECT count(DISTINCT template_id) FROM Documents
SELECT count(*) FROM Templates
SELECT count(*) FROM Templates
SELECT DISTINCT template_type_code FROM Templates
SELECT DISTINCT template_type_code FROM Templates
SELECT count(*) FROM Templates WHERE template_type_code  =  "CV"
SELECT count(*) FROM Templates WHERE template_type_code  =  "CV"
SELECT template_type_description FROM Ref_template_types WHERE template_type_code  =  "AD"
SELECT template_type_description FROM Ref_template_types WHERE template_type_code  =  "AD"
SELECT template_type_code FROM Ref_template_types WHERE template_type_description  =  "Book"
SELECT template_type_code FROM Ref_template_types WHERE template_type_description  =  "Book"
SELECT DISTINCT T1.template_type_description FROM Ref_template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code  = T2.template_type_code JOIN Documents AS T3 ON T2.Template_ID  =  T3.template_ID
SELECT DISTINCT T1.template_type_description FROM Ref_template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code  = T2.template_type_code JOIN Documents AS T3 ON T2.Template_ID  =  T3.template_ID
SELECT count(*) FROM Paragraphs
SELECT count(*) FROM Paragraphs
SELECT Other_Details FROM Paragraphs WHERE paragraph_text  =  'Korea'
SELECT Other_Details FROM Paragraphs WHERE paragraph_text  =  'Korea'
SELECT Title FROM Cartoon ORDER BY title
SELECT Title FROM Cartoon ORDER BY title
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones";
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones";
SELECT count(*) FROM Cartoon WHERE Written_by = "Joseph Kuhr";
SELECT count(*) FROM Cartoon WHERE Written_by = "Joseph Kuhr";
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio";
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio";
SELECT Package_Option FROM TV_Channel WHERE series_name = "Sky Radio";
SELECT Package_Option FROM TV_Channel WHERE series_name = "Sky Radio";
SELECT count(*) FROM TV_Channel WHERE LANGUAGE = "English";
SELECT count(*) FROM TV_Channel WHERE LANGUAGE = "English";
SELECT Episode FROM TV_series ORDER BY rating
SELECT Episode FROM TV_series ORDER BY rating
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime";
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime";
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime";
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime";
SELECT id FROM goods WHERE flavor  =  "Apple"
SELECT id FROM goods WHERE flavor  =  "Apple"
SELECT id FROM goods WHERE price  <  3
SELECT id FROM goods WHERE price  <  3
SELECT count(*) FROM goods WHERE food  =  "Cake"
SELECT count(*) FROM goods WHERE food  =  "Cake"
SELECT flavor FROM goods WHERE food  =  "Croissant"
SELECT flavor FROM goods WHERE food  =  "Croissant"
SELECT DISTINCT LastName FROM customers ORDER BY LastName
SELECT DISTINCT LastName FROM customers ORDER BY LastName
SELECT DISTINCT id FROM goods ORDER BY id
SELECT DISTINCT id FROM goods ORDER BY id
SELECT min(price) FROM goods WHERE flavor  =  "Cheese"
SELECT min(price) FROM goods WHERE flavor  =  "Cheese"
SELECT id FROM goods WHERE price  >  2 * (SELECT avg(price) FROM goods)
SELECT id FROM goods WHERE price  >  2 * (SELECT avg(price) FROM goods)
SELECT customer_details FROM customers ORDER BY customer_details
SELECT customer_details FROM customers ORDER BY customer_details
SELECT count(*) FROM claims_processing_stages
SELECT count(*) FROM claims_processing_stages
SELECT claim_status_description FROM claims_processing_stages WHERE claim_status_name  =  "Open"
SELECT claim_status_description FROM claims_processing_stages WHERE claim_status_name  =  "Open"
SELECT count(DISTINCT claim_outcome_code) FROM claims_processing
SELECT count(DISTINCT claim_outcome_code) FROM claims_processing

-------------------------extra-----------------------
SELECT T1.grant_amount FROM Grants AS T1 JOIN Documents AS T2 ON T1.grant_id  =  T2.grant_id WHERE T2.sent_date  <  '1986-08-26 20:49:27' INTERSECT SELECT grant_amount FROM grants WHERE grant_end_date  >  '1989-03-16 18:27:16'
SELECT T1.grant_amount FROM Grants AS T1 JOIN Documents AS T2 ON T1.grant_id  =  T2.grant_id WHERE T2.sent_date  <  '1986-08-26 20:49:27' INTERSECT SELECT grant_amount FROM grants WHERE grant_end_date  >  '1989-03-16 18:27:16'
SELECT T1.project_details FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id WHERE T2.outcome_code  =  'Paper' INTERSECT SELECT T1.project_details FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id WHERE T2.outcome_code  =  'Patent'
SELECT T1.project_details FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id WHERE T2.outcome_code  =  'Paper' INTERSECT SELECT T1.project_details FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id WHERE T2.outcome_code  =  'Patent'
SELECT date_from ,  date_to FROM Project_Staff WHERE project_id IN( SELECT project_id FROM Project_Staff GROUP BY project_id ORDER BY count(*) DESC LIMIT 1 ) UNION SELECT date_from ,  date_to FROM Project_Staff WHERE role_code  =  'leader'
SELECT date_from ,  date_to FROM Project_Staff WHERE project_id IN( SELECT project_id FROM Project_Staff GROUP BY project_id ORDER BY count(*) DESC LIMIT 1 ) UNION SELECT date_from ,  date_to FROM Project_Staff WHERE role_code  =  'leader'
SELECT T1.organisation_type ,  T1.organisation_id FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.organisation_type ,  T1.organisation_id FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.organisation_type FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_type ORDER BY count(*) DESC LIMIT 1
SELECT T1.organisation_type FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_type ORDER BY count(*) DESC LIMIT 1
SELECT T1.task_details ,  T1.task_id ,  T2.project_id FROM Tasks AS T1 JOIN Projects AS T2 ON T1.project_id  =  T2.project_id WHERE T2.project_details  =  'omnis' UNION SELECT T1.task_details ,  T1.task_id ,  T2.project_id FROM Tasks AS T1 JOIN Projects AS T2 ON T1.project_id  =  T2.project_id JOIN Project_outcomes AS T3 ON T2.project_id  =  T3.project_id GROUP BY T2.project_id HAVING count(*)  >  2
SELECT T1.task_details ,  T1.task_id ,  T2.project_id FROM Tasks AS T1 JOIN Projects AS T2 ON T1.project_id  =  T2.project_id WHERE T2.project_details  =  'omnis' UNION SELECT T1.task_details ,  T1.task_id ,  T2.project_id FROM Tasks AS T1 JOIN Projects AS T2 ON T1.project_id  =  T2.project_id JOIN Project_outcomes AS T3 ON T2.project_id  =  T3.project_id GROUP BY T2.project_id HAVING count(*)  >  2
SELECT T1.project_details ,  T1.project_id FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.project_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.project_details ,  T1.project_id FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.project_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.organisation_id ,  T1.organisation_type ,  T1.organisation_details FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.organisation_id ,  T1.organisation_type ,  T1.organisation_details FROM Organisations AS T1 JOIN Research_Staff AS T2 ON T1.organisation_id  =  T2.employer_organisation_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.role_description ,  T2.staff_id FROM Staff_Roles AS T1 JOIN Project_Staff AS T2 ON T1.role_code  =  T2.role_code JOIN Project_outcomes AS T3 ON T2.project_id  =  T3.project_id GROUP BY T2.staff_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.role_description ,  T2.staff_id FROM Staff_Roles AS T1 JOIN Project_Staff AS T2 ON T1.role_code  =  T2.role_code JOIN Project_outcomes AS T3 ON T2.project_id  =  T3.project_id GROUP BY T2.staff_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.grant_start_date FROM Grants AS T1 JOIN Documents AS T2 ON T1.grant_id  =  T2.grant_id JOIN Document_Types AS T3 ON T2.document_type_code  =  T3.document_type_code WHERE T3.document_description  =  'Regular' INTERSECT SELECT T1.grant_start_date FROM Grants AS T1 JOIN Documents AS T2 ON T1.grant_id  =  T2.grant_id JOIN Document_Types AS T3 ON T2.document_type_code  =  T3.document_type_code WHERE T3.document_description  =  'Initial Application'
SELECT T1.grant_start_date FROM Grants AS T1 JOIN Documents AS T2 ON T1.grant_id  =  T2.grant_id JOIN Document_Types AS T3 ON T2.document_type_code  =  T3.document_type_code WHERE T3.document_description  =  'Regular' INTERSECT SELECT T1.grant_start_date FROM Grants AS T1 JOIN Documents AS T2 ON T1.grant_id  =  T2.grant_id JOIN Document_Types AS T3 ON T2.document_type_code  =  T3.document_type_code WHERE T3.document_description  =  'Initial Application'
SELECT T1.organisation_id ,  count(*) FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.organisation_id ,  count(*) FROM Projects AS T1 JOIN Project_outcomes AS T2 ON T1.project_id  =  T2.project_id GROUP BY T1.organisation_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.name ,  sum(t2.quantity) FROM store AS t1 JOIN stock AS t2 ON t1.store_id  =  t2.store_id GROUP BY t2.store_id ORDER BY sum(t2.quantity) DESC LIMIT 1
SELECT t1.name ,  sum(t2.quantity) FROM store AS t1 JOIN stock AS t2 ON t1.store_id  =  t2.store_id GROUP BY t2.store_id ORDER BY sum(t2.quantity) DESC LIMIT 1
SELECT t1.model FROM headphone AS t1 JOIN stock AS t2 ON t1.headphone_id  =  t2.headphone_id GROUP BY t1.model ORDER BY sum(t2.quantity) DESC LIMIT 1
SELECT t1.model FROM headphone AS t1 JOIN stock AS t2 ON t1.headphone_id  =  t2.headphone_id GROUP BY t1.model ORDER BY sum(t2.quantity) DESC LIMIT 1
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >= 3
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >= 3
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id
SELECT product_id ,  product_name ,  product_price ,  product_color FROM Products EXCEPT SELECT T1.product_id ,  T1.product_name ,  T1.product_price ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.product_id HAVING count(*)  >=  2
SELECT product_id ,  product_name ,  product_price ,  product_color FROM Products EXCEPT SELECT T1.product_id ,  T1.product_name ,  T1.product_price ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.product_id HAVING count(*)  >=  2
SELECT T1.product_id ,  T1.product_name ,  T1.product_price FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.product_id ,  T1.product_name ,  T1.product_price FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.order_id ,  sum(T2.product_price) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.order_id ORDER BY sum(T2.product_price) ASC LIMIT 1
SELECT T1.order_id ,  sum(T2.product_price) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.order_id ORDER BY sum(T2.product_price) ASC LIMIT 1
SELECT product_price ,  product_size FROM Products WHERE product_price  >  ( SELECT avg(product_price) FROM Products )
SELECT product_price ,  product_size FROM Products WHERE product_price  >  ( SELECT avg(product_price) FROM Products )
SELECT count(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_items )
SELECT count(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_items )
SELECT count(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payment_Methods )
SELECT count(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payment_Methods )
SELECT email_address ,  town_city ,  county FROM Customers WHERE gender_code  =  ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1 )
SELECT email_address ,  town_city ,  county FROM Customers WHERE gender_code  =  ( SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1 )
SELECT product_color ,  product_description ,  product_size FROM Products WHERE product_price  <  ( SELECT max(product_price) FROM products )
SELECT product_color ,  product_description ,  product_size FROM Products WHERE product_price  <  ( SELECT max(product_price) FROM products )
SELECT t2.country FROM driver AS t1 JOIN country AS t2 ON t1.country  =  t2.country_id WHERE t1.Make  =  "Dodge" INTERSECT SELECT t2.country FROM driver AS t1 JOIN country AS t2 ON t1.country  =  t2.country_id WHERE t1.Make  =  "Chevrolet"
SELECT t2.country FROM driver AS t1 JOIN country AS t2 ON t1.country  =  t2.country_id WHERE t1.Make  =  "Dodge" INTERSECT SELECT t2.country FROM driver AS t1 JOIN country AS t2 ON t1.country  =  t2.country_id WHERE t1.Make  =  "Chevrolet"
SELECT t1.manager ,  t1.sponsor FROM team AS t1 JOIN team_driver AS t2 ON t1.team_id  =  t2.team_id GROUP BY t2.team_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.manager ,  t1.sponsor FROM team AS t1 JOIN team_driver AS t2 ON t1.team_id  =  t2.team_id GROUP BY t2.team_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.driverid ,  T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE POSITION  =  '1' GROUP BY T1.driverid HAVING count(*)  >=  2
SELECT T1.driverid ,  T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE POSITION  =  '1' GROUP BY T1.driverid HAVING count(*)  >=  2
SELECT count(DISTINCT driverId) FROM results WHERE raceId NOT IN( SELECT raceId FROM races WHERE YEAR ! =  2009 )
SELECT count(DISTINCT driverId) FROM results WHERE raceId NOT IN( SELECT raceId FROM races WHERE YEAR ! =  2009 )
SELECT T2.driverid ,  T3.forename FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid  =  T3.driverid WHERE T1.name = "Australian Grand Prix" INTERSECT SELECT T2.driverid ,  T3.forename FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid  =  T3.driverid WHERE T1.name = "Chinese Grand Prix"
SELECT T2.driverid ,  T3.forename FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid  =  T3.driverid WHERE T1.name = "Australian Grand Prix" INTERSECT SELECT T2.driverid ,  T3.forename FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid  =  T3.driverid WHERE T1.name = "Chinese Grand Prix"
SELECT T3.forename ,  T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = "Australian Grand Prix" EXCEPT SELECT T3.forename ,  T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = "Chinese Grand Prix"
SELECT T3.forename ,  T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = "Australian Grand Prix" EXCEPT SELECT T3.forename ,  T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = "Chinese Grand Prix"
SELECT DISTINCT driverid ,  STOP FROM pitstops WHERE duration  <  (SELECT max(duration) FROM pitstops WHERE raceid  =  841)
SELECT DISTINCT driverid ,  STOP FROM pitstops WHERE duration  <  (SELECT max(duration) FROM pitstops WHERE raceid  =  841)
SELECT DISTINCT driverid ,  STOP FROM pitstops WHERE duration  >  (SELECT min(duration) FROM pitstops WHERE raceid  =  841)
SELECT DISTINCT driverid ,  STOP FROM pitstops WHERE duration  >  (SELECT min(duration) FROM pitstops WHERE raceid  =  841)
SELECT T1.forename ,  T1.surname ,  T1.driverid FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  >  8 UNION SELECT T1.forename ,  T1.surname ,  T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  >  5
SELECT T1.forename ,  T1.surname ,  T1.driverid FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  >  8 UNION SELECT T1.forename ,  T1.surname ,  T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  >  5
SELECT T1.surname ,  T1.driverid FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  =  11 INTERSECT SELECT T1.surname ,  T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  >  5
SELECT T1.surname ,  T1.driverid FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  =  11 INTERSECT SELECT T1.surname ,  T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid GROUP BY T1.driverid HAVING count(*)  >  5
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year > 2010 GROUP BY T1.driverid ORDER BY count(*) DESC LIMIT 1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid  =  T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year > 2010 GROUP BY T1.driverid ORDER BY count(*) DESC LIMIT 1
SELECT circuitid ,  LOCATION FROM circuits WHERE country = "France" OR country = "Belgium"
SELECT circuitid ,  LOCATION FROM circuits WHERE country = "France" OR country = "Belgium"
SELECT max(T2.fastestlapspeed) ,  T1.name ,  T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year > 2014 GROUP BY T1.name ORDER BY T1.year
SELECT max(T2.fastestlapspeed) ,  T1.name ,  T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year > 2014 GROUP BY T1.name ORDER BY T1.year
SELECT avg(T2.fastestlapspeed) ,  T1.name ,  T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year > 2014 GROUP BY T1.name ORDER BY T1.year
SELECT avg(T2.fastestlapspeed) ,  T1.name ,  T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year > 2014 GROUP BY T1.name ORDER BY T1.year
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid ORDER BY count(*) DESC LIMIT 1
SELECT T1.driverid ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid GROUP BY T1.driverid ORDER BY count(*) DESC LIMIT 1
SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Oklahoma" INTERSECT SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Oklahoma" INTERSECT SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT t1.name FROM channel AS t1 JOIN broadcast AS t2 ON t1.channel_id  =  t2.channel_id WHERE t2.time_of_day  =  'Morning' INTERSECT SELECT t1.name FROM channel AS t1 JOIN broadcast AS t2 ON t1.channel_id  =  t2.channel_id WHERE t2.time_of_day  =  'Night'
SELECT t1.name FROM channel AS t1 JOIN broadcast AS t2 ON t1.channel_id  =  t2.channel_id WHERE t2.time_of_day  =  'Morning' INTERSECT SELECT t1.name FROM channel AS t1 JOIN broadcast AS t2 ON t1.channel_id  =  t2.channel_id WHERE t2.time_of_day  =  'Night'
SELECT t1.owner FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id WHERE t2.Time_of_day  =  "Morning" INTERSECT SELECT t1.owner FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id WHERE t2.Time_of_day  =  "Night"
SELECT t1.owner FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id WHERE t2.Time_of_day  =  "Morning" INTERSECT SELECT t1.owner FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id WHERE t2.Time_of_day  =  "Night"
SELECT t1.name FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id GROUP BY t2.program_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.name FROM program AS t1 JOIN broadcast AS t2 ON t1.program_id  =  t2.program_id GROUP BY t2.program_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' INTERSECT SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Imperial'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' INTERSECT SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Imperial'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie GROUP BY T1.title ORDER BY count(*) DESC LIMIT 1
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie GROUP BY T1.title ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  "Boeing 737-800" INTERSECT SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  "Airbus A340-300"
SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  "Boeing 737-800" INTERSECT SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.name  =  "Airbus A340-300"
SELECT T2.name FROM Certificate AS T1 JOIN Aircraft AS T2 ON T2.aid  =  T1.aid GROUP BY T1.aid ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM Certificate AS T1 JOIN Aircraft AS T2 ON T2.aid  =  T1.aid GROUP BY T1.aid ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM Certificate AS T1 JOIN Aircraft AS T2 ON T2.aid  =  T1.aid WHERE T2.distance  >  5000 GROUP BY T1.aid ORDER BY count(*)  >=  5
SELECT T2.name FROM Certificate AS T1 JOIN Aircraft AS T2 ON T2.aid  =  T1.aid WHERE T2.distance  >  5000 GROUP BY T1.aid ORDER BY count(*)  >=  5
SELECT T1.name ,  T1.salary FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid GROUP BY T1.eid ORDER BY count(*) DESC LIMIT 1
SELECT T1.name ,  T1.salary FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid GROUP BY T1.eid ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.distance  >  5000 GROUP BY T1.eid ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM Employee AS T1 JOIN Certificate AS T2 ON T1.eid  =  T2.eid JOIN Aircraft AS T3 ON T3.aid  =  T2.aid WHERE T3.distance  >  5000 GROUP BY T1.eid ORDER BY count(*) DESC LIMIT 1
SELECT T1.city FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city GROUP BY T2.host_city ORDER BY count(*) DESC LIMIT 1
SELECT T1.city FROM city AS T1 JOIN hosting_city AS T2 ON T1.city_id  =  T2.host_city GROUP BY T2.host_city ORDER BY count(*) DESC LIMIT 1
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Mar  <  T2.Jul INTERSECT SELECT T3.city FROM city AS T3 JOIN hosting_city AS T4 ON T3.city_id  =  T4.host_city
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Mar  <  T2.Jul INTERSECT SELECT T3.city FROM city AS T3 JOIN hosting_city AS T4 ON T3.city_id  =  T4.host_city
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Mar  <  T2.Dec EXCEPT SELECT T3.city FROM city AS T3 JOIN hosting_city AS T4 ON T3.city_id  =  T4.host_city
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Mar  <  T2.Dec EXCEPT SELECT T3.city FROM city AS T3 JOIN hosting_city AS T4 ON T3.city_id  =  T4.host_city
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Feb  >  T2.Jun UNION SELECT T3.city FROM city AS T3 JOIN hosting_city AS T4 ON T3.city_id  =  T4.host_city S: S: S:
SELECT T1.city FROM city AS T1 JOIN temperature AS T2 ON T1.city_id  =  T2.city_id WHERE T2.Feb  >  T2.Jun UNION SELECT T3.city FROM city AS T3 JOIN hosting_city AS T4 ON T3.city_id  =  T4.host_city S: S: S:
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Hardware")
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Hardware")
SELECT T1.customer_id ,  T2.customer_name ,  T2.customer_phone ,  T2.customer_email FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_id ,  T2.customer_name ,  T2.customer_phone ,  T2.customer_email FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Customers WHERE customer_id NOT IN  ( SELECT customer_id FROM Customer_orders)
SELECT count(*) FROM Customers WHERE customer_id NOT IN  ( SELECT customer_id FROM Customer_orders)
SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 UNION SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  3;
SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 UNION SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  3;
SELECT T2.Shop_Name FROM stock AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Shop_Name FROM stock AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Shop_Name FROM stock AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY SUM(T1.quantity) DESC LIMIT 1
SELECT T2.Shop_Name FROM stock AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY SUM(T1.quantity) DESC LIMIT 1
SELECT t1.sex FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id GROUP BY t1.sex ORDER BY avg(t2.unsure_rate) DESC LIMIT 1
SELECT t1.sex FROM people AS t1 JOIN candidate AS t2 ON t1.people_id  =  t2.people_id GROUP BY t1.sex ORDER BY avg(t2.unsure_rate) DESC LIMIT 1
SELECT dept_name ,  building FROM department WHERE budget  >  (SELECT avg(budget) FROM department)
SELECT dept_name ,  building FROM department WHERE budget  >  (SELECT avg(budget) FROM department)
SELECT count(*) FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)
SELECT count(*) FROM course WHERE course_id NOT IN (SELECT course_id FROM prereq)
SELECT dept_name ,  budget FROM department WHERE budget  >  (SELECT avg(budget) FROM department)
SELECT dept_name ,  budget FROM department WHERE budget  >  (SELECT avg(budget) FROM department)
SELECT id FROM teaches WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT id FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT id FROM teaches WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT id FROM teaches WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT min(salary) ,  dept_name FROM instructor GROUP BY dept_name HAVING avg(salary)  >  (SELECT avg(salary) FROM instructor)
SELECT min(salary) ,  dept_name FROM instructor GROUP BY dept_name HAVING avg(salary)  >  (SELECT avg(salary) FROM instructor)
SELECT T3.title ,  T3.credits FROM classroom AS T1 JOIN SECTION AS T2 ON T1.building  =  T2.building AND T1.room_number  =  T2.room_number JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T1.capacity  =  (SELECT max(capacity) FROM classroom)
SELECT T3.title ,  T3.credits FROM classroom AS T1 JOIN SECTION AS T2 ON T1.building  =  T2.building AND T1.room_number  =  T2.room_number JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T1.capacity  =  (SELECT max(capacity) FROM classroom)
SELECT count(DISTINCT T2.id) ,  count(DISTINCT T3.id) ,  T3.dept_name FROM department AS T1 JOIN student AS T2 ON T1.dept_name  =  T2.dept_name JOIN instructor AS T3 ON T1.dept_name  =  T3.dept_name GROUP BY T3.dept_name
SELECT count(DISTINCT T2.id) ,  count(DISTINCT T3.id) ,  T3.dept_name FROM department AS T1 JOIN student AS T2 ON T1.dept_name  =  T2.dept_name JOIN instructor AS T3 ON T1.dept_name  =  T3.dept_name GROUP BY T3.dept_name
SELECT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE T2.course_id IN (SELECT T4.prereq_id FROM course AS T3 JOIN prereq AS T4 ON T3.course_id  =  T4.course_id WHERE T3.title  =  'International Finance')
SELECT T1.name FROM student AS T1 JOIN takes AS T2 ON T1.id  =  T2.id WHERE T2.course_id IN (SELECT T4.prereq_id FROM course AS T3 JOIN prereq AS T4 ON T3.course_id  =  T4.course_id WHERE T3.title  =  'International Finance')
SELECT name ,  salary FROM instructor WHERE salary  <  (SELECT avg(salary) FROM instructor WHERE dept_name  =  'Physics')
SELECT name ,  salary FROM instructor WHERE salary  <  (SELECT avg(salary) FROM instructor WHERE dept_name  =  'Physics')
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 UNION SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 UNION SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 INTERSECT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 INTERSECT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT course_id FROM SECTION WHERE semester  =  'Fall' AND YEAR  =  2009 EXCEPT SELECT course_id FROM SECTION WHERE semester  =  'Spring' AND YEAR  =  2010
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  "Badlands" AND T1.StagePosition  =  "back"
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  "Badlands" AND T1.StagePosition  =  "back"
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY lastname ORDER BY count(*) DESC LIMIT 1
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY lastname ORDER BY count(*) DESC LIMIT 1
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id WHERE stageposition  =  "back" GROUP BY lastname ORDER BY count(*) DESC LIMIT 1
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id WHERE stageposition  =  "back" GROUP BY lastname ORDER BY count(*) DESC LIMIT 1
SELECT title FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid GROUP BY T1.songid ORDER BY count(*) DESC LIMIT 1
SELECT title FROM vocals AS T1 JOIN songs AS T2 ON T1.songid  =  T2.songid GROUP BY T1.songid ORDER BY count(*) DESC LIMIT 1
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE lastname  =  "Heilo" GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE lastname  =  "Heilo" GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY lastname ORDER BY count(*) DESC LIMIT 1
SELECT T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY lastname ORDER BY count(*) DESC LIMIT 1
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE firstname  =  "Solveig" GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE firstname  =  "Solveig" GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1
SELECT t2.firstname FROM Performance AS t1 JOIN Band AS t2 ON t1.bandmate  =  t2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY firstname ORDER BY count(*) DESC LIMIT 1
SELECT t2.firstname FROM Performance AS t1 JOIN Band AS t2 ON t1.bandmate  =  t2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId GROUP BY firstname ORDER BY count(*) DESC LIMIT 1
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE firstname  =  "Marianne" GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1
SELECT TYPE FROM vocals AS T1 JOIN band AS T2 ON T1.bandmate  =  T2.id WHERE firstname  =  "Marianne" GROUP BY TYPE ORDER BY count(*) DESC LIMIT 1
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  "Der Kapitan" AND T1.StagePosition  =  "back"
SELECT T2.firstname ,  T2.lastname FROM Performance AS T1 JOIN Band AS T2 ON T1.bandmate  =  T2.id JOIN Songs AS T3 ON T3.SongId  =  T1.SongId WHERE T3.Title  =  "Der Kapitan" AND T1.StagePosition  =  "back"
SELECT name FROM press WHERE Month_Profits_billion  =  (SELECT min(Month_Profits_billion) FROM press) OR Month_Profits_billion  =  (SELECT max(Month_Profits_billion) FROM press)
SELECT name FROM press WHERE Month_Profits_billion  =  (SELECT min(Month_Profits_billion) FROM press) OR Month_Profits_billion  =  (SELECT max(Month_Profits_billion) FROM press)
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id WHERE t2.book_series  =  'MM' INTERSECT SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id WHERE t2.book_series  =  'LT'
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id WHERE t2.book_series  =  'MM' INTERSECT SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id WHERE t2.book_series  =  'LT'
SELECT name ,  age FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT name ,  age FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT t1.name ,  t1.gender FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id GROUP BY t2.author_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.name ,  t1.gender FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id GROUP BY t2.author_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.id ORDER BY COUNT(*) DESC LIMIT 3
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.id ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.Name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  >  95 INTERSECT SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  <  90
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  >  95 INTERSECT SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  <  90
SELECT T1.template_id ,  T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.template_id ,  T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.template_type_code FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.template_type_code FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.document_id ,  T2.document_name FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.document_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.document_id ,  T2.document_name FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.document_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.series_name ,  T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.directed_by  =  'Michael Chang' INTERSECT SELECT T1.series_name ,  T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.directed_by  =  'Ben Jones'
SELECT T1.series_name ,  T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.directed_by  =  'Michael Chang' INTERSECT SELECT T1.series_name ,  T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.directed_by  =  'Ben Jones'
SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cake" INTERSECT SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cookie"
SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cake" INTERSECT SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cookie"
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "Apple" AND T2.food  =  "Pie" UNION SELECT ReceiptNumber FROM receipts WHERE CustomerId  =  12
SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "Apple" AND T2.food  =  "Pie" UNION SELECT ReceiptNumber FROM receipts WHERE CustomerId  =  12
SELECT ReceiptNumber ,  date FROM receipts WHERE date  =  (SELECT date FROM receipts ORDER BY date DESC LIMIT 1)
SELECT ReceiptNumber ,  date FROM receipts WHERE date  =  (SELECT date FROM receipts ORDER BY date DESC LIMIT 1)
SELECT T1.Receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.price  >  10 UNION SELECT ReceiptNumber FROM receipts WHERE date  =  (SELECT date FROM receipts ORDER BY date LIMIT 1)
SELECT T1.Receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.price  >  10 UNION SELECT ReceiptNumber FROM receipts WHERE date  =  (SELECT date FROM receipts ORDER BY date LIMIT 1)
SELECT max(price) ,  min(price) ,  avg(price) ,  flavor FROM goods GROUP BY flavor ORDER BY flavor
SELECT max(price) ,  min(price) ,  avg(price) ,  flavor FROM goods GROUP BY flavor ORDER BY flavor
SELECT min(price) ,  max(price) ,  food FROM goods GROUP BY food ORDER BY food
SELECT min(price) ,  max(price) ,  food FROM goods GROUP BY food ORDER BY food
SELECT DISTINCT T4.FirstName ,  T4.LastName FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber JOIN customers AS T4 ON T3.CustomerId  =  T4.id WHERE T1.flavor  =  "Apple" AND T1.food  =  "Tart"
SELECT DISTINCT T4.FirstName ,  T4.LastName FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber JOIN customers AS T4 ON T3.CustomerId  =  T4.id WHERE T1.flavor  =  "Apple" AND T1.food  =  "Tart"
SELECT id FROM goods WHERE food  =  "Cookie" AND price  <  (SELECT min(price) FROM goods WHERE food  =  'Croissant')
SELECT id FROM goods WHERE food  =  "Cookie" AND price  <  (SELECT min(price) FROM goods WHERE food  =  'Croissant')
SELECT DISTINCT T1.item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "Chocolate" GROUP BY item HAVING count(*)  <=  10
SELECT DISTINCT T1.item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "Chocolate" GROUP BY item HAVING count(*)  <=  10
SELECT sum(t1.amount_claimed) FROM claim_headers AS t1 JOIN claims_documents AS t2 ON t1.claim_header_id  =  t2.claim_id WHERE t2.created_date  =  (SELECT created_date FROM claims_documents ORDER BY created_date LIMIT 1)
SELECT sum(t1.amount_claimed) FROM claim_headers AS t1 JOIN claims_documents AS t2 ON t1.claim_header_id  =  t2.claim_id WHERE t2.created_date  =  (SELECT created_date FROM claims_documents ORDER BY created_date LIMIT 1)
SELECT t3.customer_details FROM claim_headers AS t1 JOIN policies AS t2 ON t1.policy_id  =  t2.policy_id JOIN customers AS t3 ON t2.customer_id  =  t3.customer_id WHERE t1.amount_claimed  =  (SELECT max(amount_claimed) FROM claim_headers)
SELECT t3.customer_details FROM claim_headers AS t1 JOIN policies AS t2 ON t1.policy_id  =  t2.policy_id JOIN customers AS t3 ON t2.customer_id  =  t3.customer_id WHERE t1.amount_claimed  =  (SELECT max(amount_claimed) FROM claim_headers)
SELECT t3.customer_details FROM claim_headers AS t1 JOIN policies AS t2 ON t1.policy_id  =  t2.policy_id JOIN customers AS t3 ON t2.customer_id  =  t3.customer_id WHERE t1.amount_piad  =  (SELECT min(amount_piad) FROM claim_headers)
SELECT t3.customer_details FROM claim_headers AS t1 JOIN policies AS t2 ON t1.policy_id  =  t2.policy_id JOIN customers AS t3 ON t2.customer_id  =  t3.customer_id WHERE t1.amount_piad  =  (SELECT min(amount_piad) FROM claim_headers)
SELECT t2.claim_status_name FROM claims_processing AS t1 JOIN claims_processing_stages AS t2 ON t1.claim_stage_id  =  t2.claim_stage_id GROUP BY t1.claim_stage_id ORDER BY count(*) DESC LIMIT 1
SELECT t2.claim_status_name FROM claims_processing AS t1 JOIN claims_processing_stages AS t2 ON t1.claim_stage_id  =  t2.claim_stage_id GROUP BY t1.claim_stage_id ORDER BY count(*) DESC LIMIT 1
SELECT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t2.customer_details ORDER BY count(*) DESC LIMIT 1
SELECT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t2.customer_details ORDER BY count(*) DESC LIMIT 1
SELECT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.start_date  =  (SELECT max(start_date) FROM policies)
SELECT t2.customer_details FROM policies AS t1 JOIN customers AS t2 ON t1.customer_id  =  t2.customer_id WHERE t1.start_date  =  (SELECT max(start_date) FROM policies)
{'medium': 586, 'hard': 316, 'easy': 288, 'extra': 220}
