DROP TABLE IF EXISTS Employee

create table Employee (
employeeId int Primary Key Identity not null,
email varchar(500) null
)

insert into Employee 
(email)
VALUES ('bob.smith@somwhere.com'),
('eric.jones@somewhere.com'),
('Jill.brown@somewhere.com'),
('bob.smith@somwhere.com')

select * from Employee