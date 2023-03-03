create database company;
use company;

create table departments(
departmentId bigint not null auto_increment,
department varchar(50),
primary key(departmentId)
);

create table jobs(
jobId bigint not null auto_increment,
departmentIdFK bigint not null,
jobName varchar(20),
primary key(jobId),
foreign key(departmentIdFK) references departments(departmentId)
);

create table employees(
employeeId bigint not null auto_increment,
employeeName varchar(50),
employeeDateBirth date not null,
employeeCPF varchar(11) not null unique,
employeeGenre char(1) not null,
contractDate date not null,
dateLeft date,
primary key(employeeId)
);

create table empJob(
id bigint not null auto_increment,
jobIdFK bigint not null,
employeeIdFK bigint not null,
dateStartJob date not null,
DateEndJob date,
primary key(id),
foreign key(jobIdFK) references jobs(jobId),
foreign key(employeeIdFK) references employees(employeeId)
);

create table salary(
salaryId bigint not null auto_increment,
employeeIdFK bigint not null,
salary numeric(10,2),
dateStartSalary date not null,
dateEndSalary date,
primary key(salaryId),
foreign key(employeeIdFK) references employees(employeeId)
);

create table managers(
managerId bigint not null auto_increment,
employeeIdFK bigint not null,
departManagesFK bigint not null,
startDate date not null,
endDate date,
primary key(managerId),
foreign key(employeeIdFK) references employees(employeeId),
foreign key(departManagesFK) references departments(departmentId)
);

insert into departments(department) values
('recursosHumanos'),('financeiro'),('administrativo'),('comercial');

insert into jobs(departmentIdFK,jobName) values
(3,'gerente'),(2,'contador'),(4,'vendedor'),(1,'gestor');

insert into employees(employeeName,employeeDateBirth,employeeCPF,employeeGenre,contractDate) values
('Carlos Eduardo','2000-08-06',15896275328,'M','2020-01-25'),('Mariana Torres','1986-05-15',89752631408,'F','2019-06-24'),
('José de Abreu','1967-09-03',13258674321,'M','2010-04-17'),('Eloísa Souza','1982-05-13',56487923514,'F','2016-08-09');