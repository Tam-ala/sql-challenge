--------------------------------------------------EMPLOYEE DATA ANALYSIS----------------------------------------------------------------------

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
----------------------------------------------------------------------------------------------------------
SELECT employees.emp_no, 
employees.first_name, 
employees.last_name, 
employees.sex, 
employees.hire_date,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.
---------------------------------------------------------------------------------------



-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
-----------------------------------------------------------------------------------------------
SELECT departments.dept_no, 
dept_manager.emp_no,
departments.dept_name,  
employees.last_name, 
employees.first_name
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;


-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
-----------------------------------------------------------------------------------------------
SELECT dept_emp.emp_no,
departments.dept_name,
employees.last_name,
employees.first_name
FROM dept_emp 
INNER JOIN departments 
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no;


-- List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
-----------------------------------------------------------------------------------------------
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- List all employees in the Sales department 
-- including their employee number, last name, first name, and department name.
-----------------------------------------------------------------------------------------------
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
    INNER JOIN dept_emp
    ON employees.emp_no = dept_emp.emp_no
    INNER JOIN departments
    ON dept_emp.dept_no = departments.dept_no
    WHERE departments.dept_name = 'Sales';


-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
------------------------------------------------------------------------------------------------
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;