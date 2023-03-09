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

create table empManager(
id bigint not null auto_increment,
managerIdFK bigint not null,
employeeIdFK bigint not null,
primary key(id),
foreign key(managerIdFK) references managers(managerId),
foreign key(employeeIdFK) references employees(employeeId)
);

insert into departments(department) values
('recursosHumanos'),('financeiro'),('administrativo'),('comercial');

insert into jobs(departmentIdFK,jobName) values
(3,'gerente'),(2,'contador'),(4,'vendedor'),(1,'gestor');

insert into employees(employeeName,employeeDateBirth,employeeCPF,employeeGenre,contractDate) values
('Carlos Eduardo','2000-08-06',15896275328,'M','2020-01-25'),('Mariana Torres','1986-05-15',89752631408,'F','2019-06-24'),
('José de Abreu','1967-09-03',13258674321,'M','2010-04-17'),('Eloísa Souza','1982-05-13',56487923514,'F','2016-08-09');

insert into empJob(jobIdFK,employeeIdFK,dateStartJob) values
(1,3,'2019-06-03'),(2,4,'2020-05-06'),(3,2,'2021-03-10'),(4,1,'2018-08-29');

insert into salary(employeeIdFK,salary,dateStartSalary) values
(3,8000.00,'2019-06-03'),(4,5000.00,'2020-05-06'),(2,2000.00,'2021-03-10'),(1,7000.00,'2018-08-29');

insert into managers(employeeIdFK,departManagesFK,startDate) values
(3,2,'2019-06-03');

insert into empManager(managerIdFK,employeeIdFK) values
(1,4);

select * from salary where salary > 5000;

select * from salary where salary=(select max(salary) from salary);

select * from employees e
inner join empManager em on e.employeeId = em.employeeIdFK
where em.managerIdFK = 1;

select * from jobs j
inner join empJob ej on j.jobId = ej.jobIdFK
where ej.employeeIdFK = 1;

select * from managers m
inner join departments dp on m.departManagesFK = dp.departmentId
where dp.departmentId = 2;