--Data Analysis
-- Query to see if Table has any Data
SELECT * From departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, n.emp_no, e.last_name, e.first_name, n.from_date, n.to_date
FROM departments as d
JOIN dept_manager as n
ON d.dept_no = n.dept_no
JOIN employees as e
ON n.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT f.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as f
JOIN employees as e
ON f.emp_no = e.emp_no
JOIN departments as d
ON f.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT f.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as f
JOIN employees as e
ON f.emp_no = e.emp_no
JOIN departments as d
ON f.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT f.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as f
JOIN employees as e
ON f.emp_no = e.emp_no
JOIN departments as d
ON f.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;