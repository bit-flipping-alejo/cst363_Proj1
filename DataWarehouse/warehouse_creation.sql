-- /////////////////////////////////////////////
-- Project #1 Part 2
-- OLAP Data Warehouse
-- /////////////////////////////////////////////
DROP SCHEMA IF EXISTS proj1_warehouse;
CREATE SCHEMA proj1_warehouse;
USE proj1_warehouse;

-- create dimension databases
CREATE TABLE customer AS 
   SELECT customerID, rewardsPoints, 
          rewardLevel, points_until_flight 
   FROM proj1.customers c JOIN proj1.rewards r ON c.rewardsID=r.rewardsID;

ALTER TABLE customer ADD PRIMARY KEY (customerID);

CREATE TABLE flight AS 
SELECT 
   flightID, 
   de.cityName as destinationCity ,
   dep.cityName as departureCity,
   cost
FROM proj1.flights f JOIN proj1.destinations de 
   ON f.destinationID=de.destinationID
   JOIN proj1.departures dep
   ON f.departureID=dep.departureID;

ALTER TABLE flight ADD PRIMARY KEY (flightID);

CREATE TABLE `time` AS 
   SELECT flightID,arrivalTime, departureTime, departureDay
   FROM proj1.flights;

ALTER TABLE `time` ADD PRIMARY KEY (flightID);
-- create fact database

CREATE TABLE fact AS 
   SELECT reservationID, customerID, flightID
   FROM proj1.reservations;

ALTER TABLE fact 
ADD CONSTRAINT fact_fk_customer
FOREIGN KEY (customerID)
REFERENCES customer (customerID);

ALTER TABLE fact 
ADD CONSTRAINT fact_fk_flight
FOREIGN KEY (flightID)
REFERENCES flight (flightID);

ALTER TABLE fact 
ADD CONSTRAINT fact_fk_time
FOREIGN KEY (flightID)
REFERENCES `time` (flightID);








