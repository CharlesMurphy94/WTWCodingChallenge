-- View AvailableReservations 
-- Get all available reservations that are not booked

CREATE VIEW vw_AvailableReservations 

AS 

SELECT ar.availableReservationId, cs.name, ar.reservationStart, ar.reservationEnd
FROM AvailableReservations ar 
JOIN CampSite cs ON cs.campSiteId = ar.campSiteId 
LEFT JOIN Reservations r ON r.availableReservationId = ar.availableReservationId 
WHERE r.reservationId IS NULL


---- Test View ----
--select * From vw_AvailableReservations 