-- Create a new reservation
-- Inputs: available reservation id, contact name, email, and phone

CREATE PROCEDURE CreateReservation
	@availableReservationId int,
	@contactName varchar(500),
	@contactEmail varchar(500),
	@contactPhone varchar(500)
AS
	-- Only insert if there is not already an existing reservation. 
	INSERT INTO Reservations 
	(availableReservationId, contactName, contactEmail, contactPhone)
	SELECT ar.availableReservationId, @contactName, @contactEmail, @contactPhone 
	FROM AvailableReservations ar 
	LEFT JOIN Reservations r ON r.availableReservationId = ar.availableReservationId 
	WHERE ar.availableReservationId = @availableReservationId 
	AND r.reservationId IS NULL


----Test Create----
--EXEC CreateReservation @availableReservationId = 17, 
--	@contactName = 'Donald Duck', 
--	@contactEmail = 'donald.duck@quack.quack', 
--	@contactPhone = '8015558888'
--	
--SELECT * FROM Reservations r
	
