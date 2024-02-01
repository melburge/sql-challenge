--Create Tables in respective order of foreign keys

--Create Titles Table
CREATE TABLE Titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(30)
);


--Create Employee Data Table
--Linked to Titles Table
CREATE TABLE Employees (
    emp_no VARCHAR(10) PRIMARY KEY NOT NULL,
    title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex CHAR(1),
    hire_date DATE NOT NULL,
	FOREIGN KEY (title_id) REFERENCES Titles (title_id)
);


--Create Departments Table
CREATE TABLE Departments (
    dep_no VARCHAR(5) PRIMARY KEY NOT NULL,
    dep_name VARCHAR(20) NOT NULL
);


--Create Department Manager Table
--Linked to Department Table and Employee Data Table
--Primary Key requred -- department number then employee number
CREATE TABLE Department_Manager (
	PRIMARY KEY (dep_no, emp_no),
	dep_no VARCHAR(10) NOT NULL,
    emp_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (dep_no, emp_no),
	FOREIGN KEY (dep_no) REFERENCES departments (dep_no)
);


SELECT * FROM Department_Manager

--Create Department Employee Table
--Linked to Department Table and Employee Data Table
--Primary Key requred -- employee number then department number
CREATE TABLE Department_Employee (
	PRIMARY KEY (emp_no, dep_no),
    emp_no VARCHAR(10) NOT NULL,
	dep_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dep_no) REFERENCES Departments (dep_no)
);


SELECT * FROM Employees

--Create Salary Table
--Linked to Employee Data Table
CREATE TABLE Salary_Data (
    emp_no VARCHAR(10) PRIMARY KEY NOT NULL,
    salary INT NOT NULL
);
