
DROP VIEW IF EXISTS vwEmployeeData;

CREATE VIEW vwEmployeeData AS
SELECT emp.* ,  sal.salary, titles.title
FROM employees emp 
left join salaries sal on sal.emp_no=emp.emp_no
left join titles  on titles.title_id=emp.emp_title_id
;

Select * from vwEmployeeData