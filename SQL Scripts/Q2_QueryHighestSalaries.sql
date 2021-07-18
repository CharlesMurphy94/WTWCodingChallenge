SELECT d.Name AS Department, e2.name AS Employee, e2.salary AS Salary FROM (
	SELECT MAX(salary) AS maxSalary, departmentId
	FROM Employee e1
	GROUP BY departmentId
) departmentMaxes
JOIN Employee e2 ON (e2.salary = departmentMaxes.maxSalary AND e2.departmentId = departmentMaxes.departmentId)
JOIN Department d ON d.departmentId = e2.departmentId
ORDER BY Salary DESC, Department
