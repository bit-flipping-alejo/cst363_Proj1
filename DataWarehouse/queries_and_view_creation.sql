-- //////////////////////////////////
-- 	Queries and View Creation
-- 
-- 
-- //////////////////////////////////

--  + + + + + + + + + + + + + + + + + + +
--        VIEW CREATION
--  + + + + + + + + + + + + + + + + + + +

USE proj1_warehouse;

CREATE OR REPLACE VIEW destination_MoneySpent_byRewardLvl AS
   SELECT destinationCity, rewardLevel, AVG(cost) 
   FROM fact NATURAL JOIN flight
      NATURAL JOIN `time` NATURAL JOIN customer
   GROUP BY destinationCity, rewardLevel; 



--  + + + + + + + + + + + + + + + + + + +
--        THE BELOW ARE USEFUL QUERIES
--  + + + + + + + + + + + + + + + + + + +

-- 1) What status members are buying the most flights
SELECT COUNT(*), rewardLevel
FROM fact NATURAL JOIN customer
GROUP BY rewardLevel
ORDER BY COUNT(*) DESC;

-- 2) What day is most popular for flying
SELECT COUNT(*), departureDay
FROM fact NATURAL JOIN `time`
GROUP BY departureDay
ORDER BY COUNT(*) DESC;;

-- 3) Most popular departure city
SELECT COUNT(*), departureCity 
FROM fact NATURAL JOIN flight
GROUP BY departureCity
ORDER BY COUNT(*) DESC;


-- 4) What is the most popular destination city
SELECT COUNT(*), destinationCity 
FROM fact NATURAL JOIN flight
GROUP BY destinationCity;


-- 5) Day of the week people are speding the most average money
SELECT AVG(cost), departureDay 
FROM fact NATURAL JOIN flight
   NATURAL JOIN `time`
GROUP BY departureDay
ORDER BY AVG(cost) DESC;


-- 6) Most popular departure times to cities
SELECT departureCity , departureTime, COUNT(*)
FROM fact NATURAL JOIN flight
   NATURAL JOIN `time` NATURAL JOIN customer
GROUP BY departureCity , departureTime
ORDER BY COUNT(*) DESC;













