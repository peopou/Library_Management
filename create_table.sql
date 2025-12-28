-- create branch table
drop table if exists branch;
create table branch
	(
		branch_id varchar(10) primary key,
		manager_id varchar(10),
		branch_address varchar(55),
		contact_no varchar (20)
	);

-- create employee table
drop table if exists employee;
create table employee
	(
	emp_id varchar (10) primary key,
	emp_name varchar (50),
	position varchar (15),
	salary float,
	branch_id varchar(10)
	);
	
-- create books table
drop table if exists books;
create table books
	(
	isbn varchar (20) primary key,
	book_title varchar (75),
	category varchar (20),
	rental_price float,
	status varchar (15),
	author varchar (35),
	publisher varchar (75)
	);

-- create member table
drop table if exists members;
create table members	
	(
	members_id varchar (20) primary key,
	members_name varchar (50),
	members_addres varchar(75),
	reg_date date
	)

-- create issue table
drop table if exists issue;
create table issue
	(
	issued_id varchar (10) primary key,
	issued_member_id varchar (10),
	issued_book_name varchar (75),
	issued_date date,
	issued_book_isbn varchar (25),
	issued_emp_id varchar(10)
	);

-- create table status
drop table if exists return_stat
create table return_stat
	(
	return_id varchar (10) primary key,
	issued_id varchar (10),
	return_book_name varchar (75),
	return_date date,
	return_book_isbn varchar (20)
	)



