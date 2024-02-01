--List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary_data.salary
	FROM employees
	Join salary_data
	ON employees.emp_no = salary_data.emp_no
ORDER BY emp_no ASC;



--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
	FROM employees 
	Where hire_date BETWEEN '01/01/1986' AND '31/12/1986'
ORDER BY hire_date ASC;



--List the manager of each department along with their department number, department name,
--employee number, last name, and first name
SELECT department_manager.dep_no, departments.dep_name, department_manager.emp_no,
	   employees.last_name,employees.first_name
	FROM department_manager
	JOIN employees
	ON department_manager.emp_no = employees.emp_no
	JOIN departments
	ON department_manager.dep_no = departments.dep_no
ORDER BY departments.dep_name, employees.last_name;



--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name
SELECT departments.dep_no, department_employee.emp_no, employees.last_name, employees.first_name, 
       departments.dep_name
	FROM departments
	INNER JOIN department_employee
	ON departments.dep_no = department_employee.dep_no
	INNER JOIN employees
	ON department_employee.emp_no = employees.emp_no
ORDER BY departments.dep_no, employees.emp_no;



--List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B
SELECT employees.first_name, employees.last_name, employees.sex
	FROM employees
	WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';



--List each employee in the Sales department, including their employee number, last name, and first name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dep_name
	FROM departments
	INNER JOIN department_employee
	ON departments.dep_no = department_employee.dep_no
	INNER JOIN employees
	ON department_employee.emp_no = employees.emp_no
	WHERE departments.dep_name = 'Sales'
ORDER BY last_name ASC;



--List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dep_name
	FROM departments
	INNER JOIN department_employee
	ON departments.dep_no = department_employee.dep_no
	INNER JOIN employees
	ON department_employee.emp_no = employees.emp_no
	WHERE departments.dep_name = 'Sales' OR departments.dep_name = 'Development'
ORDER BY departments.dep_name ASC;



--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name)
SELECT employees.last_name, COUNT (last_name) AS Count_of_last_names
	FROM employees
	GROUP BY employees.last_name 
ORDER BY Count_of_last_names ASC;