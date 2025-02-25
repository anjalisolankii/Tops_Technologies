use mwf_evening;

create table cars(
brand varchar(30),
km_drive int,
fuel varchar(15),
owner varchar(20),
selling_price int);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cars.csv'
into table cars
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select *from cars;
