--Function GetMostPopularDay
--Inputs: none
--Returns: date

CREATE FUNCTION fn_GetMostPopularDay
(
)
RETURNS date
AS
BEGIN
	DECLARE @return date
	SELECT TOP 1 @return = CONVERT(date, ar.reservationStart)
	FROM AvailableReservations ar 
	JOIN Reservations r ON r.availableReservationId = ar.availableReservationId 
	GROUP BY CONVERT(date, ar.reservationStart)
	ORDER BY COUNT(*) DESC
	RETURN @return
END

----Test function----
--DECLARE @ret date; 
--EXEC @ret = dbo.fn_GetMostPopularDay
--SELECT @ret
