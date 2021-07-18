----DROP SCRIPTS
--DROP TABLE IF EXISTS Reservations
--DROP TABLE IF EXISTS AvailableReservations
--DROP TABLE IF EXISTS CampSite


--CREATE TABLES
-- Chose to give Reservations a foreign key to AvailableReservations
-- If an AvailableReservation does not have an associated Reservation,
-- it can be booked. When booked, the available reservation is not removed.
 
CREATE TABLE CampSite(
	campSiteId int IDENTITY PRIMARY KEY NOT NULL,
	name varchar(500) NULL
)
CREATE TABLE AvailableReservations(
	availableReservationId int IDENTITY PRIMARY KEY NOT NULL,
	campSiteId int FOREIGN KEY REFERENCES CampSite(campsiteId),
	reservationStart datetime NULL,
	reservationEnd datetime NULL
)
CREATE TABLE Reservations(
	reservationId int IDENTITY PRIMARY KEY NOT NULL,
	availableReservationId int FOREIGN KEY REFERENCES AvailableReservations(availableReservationId),
	contactName varchar(500) NULL,
	contactEmail varchar(500) NULL,
	contactPhone varchar(500) NULL
)


--SEED DATA

INSERT INTO CampSite (name)
VALUES ('Desolation'),('Terraces'),('Dog Lake')

INSERT INTO AvailableReservations (campSiteId, reservationStart, reservationEnd)
VALUES (1,CONVERT(DATETIME, '7/24/21 9:00:00'), CONVERT(DATETIME, '7/24/21 12:00:00')),
	(1,CONVERT(DATETIME, '7/24/21 12:00:00'), CONVERT(DATETIME, '7/24/21 16:00:00')),
	(1,CONVERT(DATETIME, '7/24/21 16:00:00'), CONVERT(DATETIME, '7/24/21 20:00:00')),
	(2,CONVERT(DATETIME, '7/24/21 9:00:00'), CONVERT(DATETIME, '7/24/21 12:00:00')),
	(2,CONVERT(DATETIME, '7/24/21 12:00:00'), CONVERT(DATETIME, '7/24/21 16:00:00')),
	(2,CONVERT(DATETIME, '7/24/21 16:00:00'), CONVERT(DATETIME, '7/24/21 20:00:00')),
	(3,CONVERT(DATETIME, '7/24/21 9:00:00'), CONVERT(DATETIME, '7/24/21 12:00:00')),
	(3,CONVERT(DATETIME, '7/24/21 12:00:00'), CONVERT(DATETIME, '7/24/21 16:00:00')),
	(3,CONVERT(DATETIME, '7/24/21 16:00:00'), CONVERT(DATETIME, '7/24/21 20:00:00')),
	(1,CONVERT(DATETIME, '7/25/21 9:00:00'), CONVERT(DATETIME, '7/25/21 12:00:00')),
	(1,CONVERT(DATETIME, '7/25/21 12:00:00'), CONVERT(DATETIME, '7/25/21 16:00:00')),
	(1,CONVERT(DATETIME, '7/25/21 16:00:00'), CONVERT(DATETIME, '7/25/21 20:00:00')),
	(2,CONVERT(DATETIME, '7/25/21 9:00:00'), CONVERT(DATETIME, '7/25/21 12:00:00')),
	(2,CONVERT(DATETIME, '7/25/21 12:00:00'), CONVERT(DATETIME, '7/25/21 16:00:00')),
	(2,CONVERT(DATETIME, '7/25/21 16:00:00'), CONVERT(DATETIME, '7/25/21 20:00:00')),
	(3,CONVERT(DATETIME, '7/25/21 9:00:00'), CONVERT(DATETIME, '7/25/21 12:00:00')),
	(3,CONVERT(DATETIME, '7/25/21 12:00:00'), CONVERT(DATETIME, '7/25/21 16:00:00')),
	(3,CONVERT(DATETIME, '7/25/21 16:00:00'), CONVERT(DATETIME, '7/25/21 20:00:00'))
	
INSERT INTO Reservations (availableReservationId, contactName, contactEmail, contactPhone)
VALUES (2, 'Bugs Bunny', 'bugs@looney.tunes', '8015555555'),
	(3, 'Bugs Bunny', 'bugs@looney.tunes', '8015555555'),
	(5, 'Mickey Mouse', 'mickey@disney.land', '8015556666'),
	(15, 'Goofy Goof', 'goofy@disney.land', '8015557777')


