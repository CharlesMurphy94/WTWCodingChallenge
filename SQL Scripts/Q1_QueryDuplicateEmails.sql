SELECT email
FROM Employee e
GROUP BY e.email
HAVING COUNT(*) > 1
