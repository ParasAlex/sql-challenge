--Questions
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no as "Employee Number", emp.last_name as "Last Name", emp.first_name as "First Name", emp.sex, sal.salary
from employees emp
JOIN salaries sal on emp.emp_no = sal.emp_no
ORDER BY emp.emp_no; 

--List first name, last name, and hire date for employees who were hired in 1986.
select  first_name, last_name, hire_date from employees where hire_date between '1986-01-01' AND '1986-12-31' ORDER by hire_date

--List the manager of each department with the following information: department number, department name, the manager’s employee number, last name, first name.
select dm.dept_no, d.dept_name, emp.emp_no, emp.last_name, emp.first_name from dept_manager dm
JOIN employees emp ON dm.emp_no = emp.emp_no
JOIN departments d ON d.dept_no = dm.dept_no
ORDER BY emp.last_name, dm.dept_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no as "Employee Number", emp.last_name, emp.first_name, d.dept_name as "Department Name" from employees emp
JOIN dept_emp de on de.emp_no = emp.emp_no
JOIN departments d on d.dept_no = de.dept_no
ORDER BY emp.emp_no, emp.last_name 

--List first name, last name, and sex for employees whose first name is “Hercules” and last names begin with “B.”
select first_name, last_name, sex from employees where first_name = 'Hercules' AND last_name Like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no AS "Employee Number", emp.last_name, emp.first_name, d.dept_name from employees emp
JOIN dept_emp de on de.emp_no = emp.emp_no
JOIN departments d on d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY emp.emp_no

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no AS "Employee Number", emp.last_name, emp.first_name, d.dept_name from employees emp
JOIN dept_emp de on de.emp_no = emp.emp_no
JOIN departments d on d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales','Development')
ORDER BY emp.emp_no


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, COUNT(last_name) from employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;