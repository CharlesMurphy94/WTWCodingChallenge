DROP TABLE IF EXISTS Employee
DROP TABLE IF EXISTS Department

create table Department (
departmentId int Primary Key Identity not null,
name varchar(500) null
)

create table Employee (
employeeId int Primary Key Identity not null,
name varchar(500) null,
salary int null,
departmentId int null FOREIGN KEY REFERENCES Department(departmentId) 

)

insert into Department
(name)
VALUES ('Sales'), ('Marketing')

insert into Employee 
(name, salary, departmentId)
VALUES 
('Eric', 85000, 1),
('Jill', 95000, 1),
('Bob', 76000, 2),
('Emily', 76000, 2),
('Sam', 75000, 2)

select * from Employee
select * from Department