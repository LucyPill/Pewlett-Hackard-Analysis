-- Queries: Deliverable 1
-- RETIREMENT TITLES TABLE
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	tit.title,
	tit.from_date,
	tit.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tit 
ON (e.emp_no = tit.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e,emp_no;

SELECT * FROM RETIREMENT_TITLES
SELECT *FROM DEPARTMENTS
-- Remove duplicates and keep only the most recent title of each employee. Use Dictinct with Orderby to remove duplicate rows
-- UNIQUE TITLES TABLE
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM UNIQUE_TITLES

-- Number of employees by their most recent job title who are about to retire
-- RETIRING TITLES TABLE
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

-- Queries: Deliverable 2
-- Mentorship Eligibility table

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tit.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tit 
ON (e.emp_no = tit.emp_no)
WHERE 
	de.to_date = '9999-01-01'AND
	e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility

-- Queries: Deliverable 3
-- How many roles will need to be filled
-- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

-- Number of Mentorship eligibility by title
SELECT COUNT(title), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT (title) ASC;
------------------------------------------
--Number of retiring employees by title
SELECT COUNT(title), title
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) ASC;
-----------------------------------------------
--Table: mentorship_eligibility_by_dept
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tit.title,
	d.dept_name
INTO mentorship_eligibility_by_dept
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tit 
ON (e.emp_no = tit.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
WHERE 
	de.to_date = '9999-01-01'AND
	e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
	
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility_by_dept
--------------------------------------------------
-- Number of available mentors by department

SELECT COUNT(title) as "possible_mentors", dept_name 
INTO possible_mentors_by_dept
FROM mentorship_eligibility_by_dept
GROUP BY dept_name
ORDER BY COUNT(title) ASC;

SELECT *FROM possible_mentors_by_dept
------------------------------------------
--Table: current_emp
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp
----------------------------------------------------
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO retiring_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM retiring_by_dept;
------------------------------------------------
-- Table: Retiring_by_dept_name 
SELECT
retiring_by_dept.count,
departments.dept_name
INTO retiring_by_dept_name
FROM retiring_by_dept
INNER JOIN departments
ON retiring_by_dept.dept_no = departments.dept_no;

SELECT *FROM retiring_by_dept_name

alter table retiring_by_dept_name
rename column count to employees_retiring;
-----------------------------------------------------------------------
--Joining retiring_by_dept_name and possible mentors_by_dept
SELECT
possible_mentors_by_dept.possible_mentors,
retiring_by_dept_name.employees_retiring,
retiring_by_dept_name.dept_name
INTO summary_table
FROM possible_mentors_by_dept
LEFT JOIN retiring_by_dept_name
ON possible_mentors_by_dept.dept_name = retiring_by_dept_name.dept_name

select *from summary_table