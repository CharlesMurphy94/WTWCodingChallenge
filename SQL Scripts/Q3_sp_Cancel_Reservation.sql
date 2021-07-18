-- Cancel an existing reservation
-- Inputs: reservation id

CREATE PROCEDURE CancelReservation
	@reservationId int
AS
	DELETE FROM Reservations where reservationId = @reservationId


----Test Cancel----
--EXEC CancelReservation @reservationId = 6
--	
--SELECT * FROM Reservations r
	
