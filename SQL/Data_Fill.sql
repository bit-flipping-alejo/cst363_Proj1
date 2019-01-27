-- ////////////////////////////////////////
--    Data_Fill.sql
--  Populate data into Team PIMS team 2 data
-- Created by Matt Chan 
-- Created by Alejandro Caicedo
-- ////////////////////////////////////////

USE proj1;
INSERT INTO login
(userName, password, customerID)
VALUES
( 'JPuck', 'puckJ' , 1),
( 'mSchwarz', 'schwarz' , 2),
( 'Farp', 'ppfftt' , 3),
( 'JoeYue', 'YueKnow' , 4),
( 'kinawas', 'skinawa' , 5),
( 'Sue_Me', 'lossless' , 6),
( 'bob_peterson', 'bePE' , 7),
( 'RaYi', 'iYaR' , 8),
( 'hopb', 'behope' , 9),
( 'LL_coolj', 'roundTheWayGirl' , 10),
( 'Larry_Hans', 'sesame' , 11),
( 'AK45', '9638' , 12),
( 'aGrave', 'digger' , 13),
( 'USOPV', '4321' , 14),
( 'tracy_p', '1234' , 15),
( 'matt', 'chan' , 16),
( 'alej', 'caic' , 17);


INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'Los Angeles');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'Washington');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'Houston');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'Boston');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'New York City');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'Salt Lake City');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'Miami');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'Birmingham');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'Barrow');
INSERT INTO `proj1`.`departures` (`departureID`, `cityName`) VALUES (default, 'St. Mary');

INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Mesa');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Fort Smith');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Bakersfield');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Ontario');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Aspen');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Orlando');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Honolulu');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Boise');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Marion');
INSERT INTO `proj1`.`destinations` (`destinationID`, `cityName`) VALUES (default, 'Lexington');

INSERT INTO `proj1`.`rewards` (`rewardsID`, `rewardLevel`, `points_until_flight`) VALUES (default, 'Bronze', '5000');
INSERT INTO `proj1`.`rewards` (`rewardsID`, `rewardLevel`, `points_until_flight`) VALUES (default, 'Silver', '8000');
INSERT INTO `proj1`.`rewards` (`rewardsID`, `rewardLevel`, `points_until_flight`) VALUES (default, 'Gold', '12000');
INSERT INTO `proj1`.`rewards` (`rewardsID`, `rewardLevel`, `points_until_flight`) VALUES (default, 'Platinum', '15000');
INSERT INTO `proj1`.`rewards` (`rewardsID`, `rewardLevel`, `points_until_flight`) VALUES (default, 'Platinum Elite', '25000');

INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'John', 'Puck', '1', '4000');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Mark', 'Schwarz', '1', '6000');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Peter', 'Fars', '2', '2500');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Joe', 'Yue', '2', '3200');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Sally', 'Kinawa', '3', '12500');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Sue', 'Lossen', '3', '8700');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Bob', 'Peterson', '4', '2000');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Rachael', 'Yi', '5', '3100');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Hope', 'Benson', '3', '4000');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Lauren', 'Lennens', '1', '5000');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Larry', 'Hans', '2', '3000');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Ashley', 'Kooper', '1', '1000');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Abel', 'Grave', '2', '2600');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Usop', 'Van', '4', '3200');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Tracy', 'Po', '2', '5400');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Matt', 'Chan', '5', '20000');
INSERT INTO `proj1`.`customers` (`customerID`, `firstName`, `lastName`, `rewardsID`, `rewardsPoints`) VALUES (default, 'Alejandro', 'Caicedo', '5', '20000');


INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '8', '1', 'Monday', '02:40:00', '04:20:00', 'ON TIME', '250.00');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '9', '2', 'Tuesday', '03:00:00', '05:10:00', 'ON TIME', '310.25');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '10', '3', 'Tuesday', '06:30:00', '08:10:00', 'DELAYED', '452.00');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '1', '4', 'Wednesday', '08:00:00', '09:30:00', 'ON TIME', '378.50');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '2', '5', 'Friday', '12:30:00', '14:00:00', 'CANCELLED', '340.00');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '7', '6', 'Saturday', '14:20:00', '15:20:00', 'ON TIME', '500.00');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '3', '7', 'Saturday', '15:00:00', '16:40:00', 'ON TIME', '280.50');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '4', '8', 'Saturday', '18:30:00', '20:00:00', 'ON TIME', '315.00');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '5', '9', 'Sunday', '21:20:00', '23:10:00', 'DELAYED', '390.00');
INSERT INTO `proj1`.`flights` (`flightID`, `departureID`, `destinationID`, `departureDay`, `departureTime`, `arrivalTime`, `flight_status`, `cost`) VALUES (default, '6', '10', 'Sunday', '22:10:00', '23:50:00', 'ON TIME', '455.00');

INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '1', '1', '1', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '2', '3', '3', 'Not Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '3', '1', '4', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '4', '1', '2', 'Not Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '5', '1', '5', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '6', '2', '1', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '7', '2', '3', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '8', '1', '10', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '9', '5', '3', 'Not Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '10', '2', '4', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '11', '2', '2', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '12', '3', '2', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '13', '1', '3', 'Not Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '14', '3', '4', 'Not Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '15', '1', '9', 'Confirmed');
INSERT INTO `proj1`.`reservations` (`reservationID`, `customerID`, `numberOnRes`, `flightID`, `state`) VALUES (default, '16', '1', '10', 'Not Confirmed');
