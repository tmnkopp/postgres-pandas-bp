
DROP TABLE IF EXISTS dept_manager ; 
DROP TABLE IF EXISTS dept_emp ; 
DROP TABLE IF EXISTS departments ;  
DROP TABLE IF EXISTS salaries ; 
DROP TABLE IF EXISTS employees ;
DROP TABLE IF EXISTS titles ; 


CREATE TABLE departments(
	  dept_no varchar (55) PRIMARY KEY NOT NULL 
	, dept_name varchar(255)
); 
COPY departments(dept_no, dept_name)
FROM 'd:\data\departments.csv'
DELIMITER ',' CSV HEADER; 
  
CREATE TABLE titles(
	  title_id varchar (55) PRIMARY KEY NOT NULL 
	, title varchar(255) 
);
COPY titles(title_id, title)
FROM 'd:\data\titles.csv'
DELIMITER ',' CSV HEADER; 
   
CREATE TABLE employees(
	  emp_no int  NOT NULL
	, emp_title_id varchar(55) PRIMARY KEY  NOT NULL
	, birth_date DATE NULL
	, first_name varchar(255)
	, last_name varchar(255)
	, sex  varchar(15)
	, hire_date DATE 
	, CONSTRAINT emp_title_id_fkey FOREIGN KEY (emp_title_id) 
	    REFERENCES titles (title_id) 
);
COPY employees(emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date)
FROM 'd:\data\employees.csv'
DELIMITER ',' CSV HEADER; 
 
CREATE TABLE dept_emp(
	  emp_no int  NOT NULL
	, dept_no varchar(55)  NOT NULL
	, CONSTRAINT emp_no_dept_no_pkey PRIMARY KEY (emp_no,dept_no) 
	, CONSTRAINT emp_no_fkey FOREIGN KEY (emp_no) 
	    REFERENCES employees (emp_no)
	, CONSTRAINT dept_emp_no_fkey FOREIGN KEY (dept_no) 
	    REFERENCES departments (dept_no)
);
COPY dept_emp(emp_no, dept_no )
FROM 'd:\data\dept_emp.csv'
DELIMITER ',' CSV HEADER; 

 
CREATE TABLE salaries(
	  salary_id SERIAL NOT NULL 
	, emp_no int  NOT NULL 
	, salary int
	, CONSTRAINT salary_id_pkey PRIMARY KEY (salary_id) 
	, CONSTRAINT emp_no_fkey FOREIGN KEY (emp_no) 
	    REFERENCES employees (emp_no)
) ;
COPY salaries(emp_no, salary )
FROM 'd:\data\salaries.csv'
DELIMITER ',' CSV HEADER; 
 
CREATE TABLE dept_manager(
	  dept_no varchar (55) NOT NULL 
	, emp_no int NOT NULL 
	, CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no )  
	, CONSTRAINT emp_no_fkey FOREIGN KEY (emp_no) 
	    REFERENCES employees (emp_no) 
);
COPY dept_manager(dept_no, emp_no)
FROM 'd:\data\dept_manager.csv'
DELIMITER ',' CSV HEADER; 


SELECT * FROM departments ; 
SELECT * FROM salaries ;
SELECT * FROM dept_emp ;
SELECT * FROM employees ;  
SELECT * FROM dept_manager ; 
SELECT * FROM titles ; 

  
 