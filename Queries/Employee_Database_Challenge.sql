--- Deliverable 1
--- Retirement Titles table that holds all the titles of employees who were born 
--- between January 1, 1952 and December 31, 1955. 
--- Retirement Titles
SELECT em.emp_no, 
em.first_name,
em.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY em.emp_no;

--- Unique titles table
--- Use Dictinct with Order by to remove duplicate rows
--- Filter dates
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--- count of retiring titles 
SELECT COUNT(title) as count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;