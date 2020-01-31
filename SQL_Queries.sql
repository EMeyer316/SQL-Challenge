-- DROP VIEW dept_manager_info;

-- QUESTION 1
CREATE VIEW employee_info AS
SELECT emp_no, first_name, last_name, gender,
	(SELECT salary
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no) AS salary
FROM employees;

SELECT * FROM employee_info;

-- QUESTION 2
CREATE VIEW employee_1986 AS
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

SELECT * FROM employee_1986;

-- QUESTION 3
CREATE VIEW dept_manager_info AS
SELECT dept_no,
	(SELECT dept_name
	FROM departments
	WHERE departments.dept_no = dept_manager.dept_no) AS "department",
	dept_manager.emp_no, employees.last_name, employees.first_name,
	from_date, to_date
FROM dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

SELECT * FROM dept_manager_info;

--QUESTION 4
CREATE VIEW emp_dept AS
SELECT dept_emp.emp_no,
(
	SELECT last_name
	FROM employees
	WHERE employees.emp_no = dept_emp.emp_no
	) as "last_name",
	(
	SELECT first_name
	FROM employees
	WHERE employees.emp_no = dept_emp.emp_no
	) as "first_name",
	(
	SELECT dept_name
	FROM departments
	WHERE departments.dept_no = dept_emp.dept_no
	)
FROM dept_emp

SELECT * FROM emp_dept;

--QUESTION 5
CREATE VIEW employee_hercules AS
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--QUESTION 6
CREATE VIEW sales_dept AS
SELECT dept_emp.emp_no,
	(
	SELECT last_name
	FROM employees
	WHERE employees.emp_no = dept_emp.emp_no
	) as "last_name",
	(
	SELECT first_name
	FROM employees
	WHERE employees.emp_no = dept_emp.emp_no
	) as "first_name",
	(
	SELECT dept_name
	FROM departments
	WHERE departments.dept_no = dept_emp.dept_no
	)
FROM dept_emp
WHERE dept_no IN
	(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
	);

SELECT * FROM sales_dept;

--QUESTION 7
CREATE VIEW sales_development_dept AS
SELECT dept_emp.emp_no,
	(
	SELECT last_name
	FROM employees
	WHERE employees.emp_no = dept_emp.emp_no
	) as "last_name",
	(
	SELECT first_name
	FROM employees
	WHERE employees.emp_no = dept_emp.emp_no
	) as "first_name",
	(
	SELECT dept_name
	FROM departments
	WHERE departments.dept_no = dept_emp.dept_no
	)
FROM dept_emp
WHERE dept_no IN
	(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales' OR dept_name = 'Development'
	);

SELECT * FROM sales_development_dept;

--QUESTION 8
CREATE VIEW lastname_count AS
SELECT last_name, COUNT(last_name) AS "number of last names"
FROM employees
GROUP BY last_name
ORDER BY "number of last names" DESC;

SELECT * FROM lastname_count;

--APRIL FOOLS DAY
SELECT * FROM employees
WHERE emp_no = '499942';
