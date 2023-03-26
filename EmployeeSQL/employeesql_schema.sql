

-- Create the table
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no, emp_title_id)
);


-- Create the table
CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50) NOT NULL
);





-- Create the table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL REFERENCES departments(dept_no),
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	PRIMARY KEY(emp_no, dept_no)
);

-- Drop the Composed Primary Key to only allow the correct number of columns
ALTER TABLE dept_emp DROP column emp_title_id;




-- Create the table
CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	PRIMARY KEY(dept_no, emp_no)
);

-- Drop the Composed Primary Key to only allow the correct number of columns
ALTER TABLE dept_manager DROP column emp_title_id;




-- Create the table
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
	salary INT
);

-- Drop the Composed Primary Key to only allow the correct number of columns
ALTER TABLE salaries DROP column emp_title_id;



-- Create the table
CREATE TABLE titles(
	emp_title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no,emp_title_id) REFERENCES employees(emp_no,emp_title_id),
	PRIMARY KEY (emp_title_id, title)
);

-- Drop the Composed Primary Key to only allow the correct number of columns
ALTER TABLE titles DROP column emp_no;


-- Viewing the tables 
SELECT * FROM departments;
SELECT * FROM titles;	
SELECT * FROM employees;	
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;	
SELECT * FROM salaries;





