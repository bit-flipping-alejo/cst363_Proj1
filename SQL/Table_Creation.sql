-- /////////////////////////////////
-- Team PIMS
-- Team 2
-- Alejandro Caicedo
-- Matt Chan
-- /////////////////////////////////

CREATE SCHEMA proj1;
USE proj1;

CREATE TABLE rewards(
-- ColName           dataType      Null?       Key          attributes
rewardsID              INT                  PRIMARY KEY   AUTO_INCREMENT,
rewardLevel          VARCHAR(20)   DEFAULT NULL,
points_until_flight    INT      DEFAULT 0
);


CREATE TABLE customers(
-- ColName   dataType      Null?     Key         attributes
customerID      INT                 PRIMARY KEY  AUTO_INCREMENT,
firstName     VARCHAR(20)   NOT NULL,
lastName      VARCHAR(20)   NOT NULL,
rewardsID        INT        NOT NULL,
rewardsPoints    INT        NOT NULL,

CONSTRAINT customers_fk_rewards 
FOREIGN KEY (rewardsID) REFERENCES rewards (rewardsID)
);

CREATE TABLE login(
-- ColName   dataType      Null?     Key         attributes
userName    VARCHAR(50)   NOT NULL   PRIMARY KEY,
password    VARCHAR(50)   NOT NULL   ,
customerID      INT       NOT NULL,

CONSTRAINT login_fk_customers
FOREIGN KEY (customerID) REFERENCES customers (customerID)                 

);

CREATE TABLE departures (
-- ColName      dataType      Null?     Key         attributes
departureID      INT                   PRIMARY KEY    AUTO_INCREMENT,
cityName        VARCHAR(50)  NOT NULL                UNIQUE
);

CREATE TABLE destinations(
-- ColName      dataType      Null?     Key         attributes
destinationID      INT                   PRIMARY KEY    AUTO_INCREMENT,
cityName        VARCHAR(50)  NOT NULL                UNIQUE
);

CREATE TABLE flights(
-- ColName      dataType      Null?     Key         attributes
flightID         INT                   PRIMARY KEY    AUTO_INCREMENT,
departureID      INT         NOT NULL,
destinationID    INT         NOT NULL,
-- departureDay = 'MONDAY/TUESDAY/WEDNESDAY/THURSDAY/FRIDAY/SATURDAY/SUNDAY'   
departureDay    VARCHAR(20)  NOT NULL,
-- THIS FORMAT USES THE 'HHH:MM:SS' FORMAT. I.E.  '8:0:0' IS 8 AM
departureTime   TIME           NOT NULL,
arrivalTime     TIME           NOT NULL,
flight_status   VARCHAR(20) DEFAULT 'NOT CONFIRMED'   NOT NULL ,
cost            FLOAT(6,2)     NOT NULL,

CONSTRAINT flights_fk_departures 
FOREIGN KEY (departureID) REFERENCES departures (departureID),

CONSTRAINT flights_fk_destinations 
FOREIGN KEY (destinationID) REFERENCES destinations (destinationID)


);



CREATE TABLE reservations(
-- ColName      dataType      Null?     Key         attributes
reservationID   INT                    PRIMARY KEY    AUTO_INCREMENT,
customerID      INT           NOT NULL,
numberOnRes     INT   DEFAULT 1,        
flightID        INT            NOT NULL,
-- state = confirmed or not confirmed
state         VARCHAR(20)  NOT NULL,

CONSTRAINT reservations_fk_customers 
FOREIGN KEY (customerID) REFERENCES customers (customerID),

CONSTRAINT reservations_fk_flightID 
FOREIGN KEY (flightID) REFERENCES flights (flightID)


);

