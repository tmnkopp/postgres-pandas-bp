/*  1. 
List the following details of each employee: 
employee number, last name, first name, sex, and salary. */ 
select emp.emp_no, last_name, first_name, sex, salary 
from employees emp
inner join salaries sal on emp.emp_no=sal.emp_no;
/*  2. 
List first name, last name, and hire date 
for employees who were hired in 1986. */
select emp.emp_no, last_name, first_name, hire_date  
from employees emp
where EXTRACT( YEAR FROM hire_date::DATE) = '1986'
  
/*  3. 
List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name. */
select mgr.* 
from employees mgr
inner join dept_manager dm on dm.emp_no = mgr.emp_no
 
/*  4. 
List the department of each employee with the following information: 
employee number, last name, first name, and department name. */
select dept.*, emp.* 
from employees emp
inner join dept_emp de on de.emp_no = emp.emp_no
inner join departments dept on dept.dept_no = de.dept_no

/*  5. 
List first name, last name, and sex 
for employees whose first name is "Hercules" and last names begin with "B." */
select emp.* 
from employees emp
where emp.first_name = 'Hercules' and emp.last_name like 'B%'

/*  6. 
List all employees in the Sales department, 
including their employee number, last name, first name, and department name. */
select dept.*, emp.* 
from employees emp
inner join dept_emp de on de.emp_no = emp.emp_no
inner join departments dept on dept.dept_no = de.dept_no
where dept.dept_no = 'd007'

/*  7. 
List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name. */
select dept.*, emp.* 
from employees emp
inner join dept_emp de on de.emp_no = emp.emp_no
inner join departments dept on dept.dept_no = de.dept_no
where dept.dept_no IN ('d007', 'd005')

/*  8. 
In descending order, 
list the frequency count of employee last names, 
i.e., how many employees share each last name. */

select emp.last_name, count(emp.last_name) cnt 
from employees emp 
group by emp.last_name
order by cnt desc