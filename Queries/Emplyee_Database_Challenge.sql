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