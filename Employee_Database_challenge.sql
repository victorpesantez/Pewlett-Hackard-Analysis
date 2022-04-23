SELECT employees.emp_no,
    employees.first_name,
employees.last_name,
    titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles	
FROM employees AS employees
INNER JOIN titles as titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

SELECT * FROM retirement_titles; 


-- remove duplicate rows
SELECT DISTINCT ON (emp_no)retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title

INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01') 
ORDER BY emp_no, to_date DESC;


SELECT * FROM unique_titles; 


-- Creating retiring titles table grouped buy title 
SELECT COUNT (title ), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
SELECT * FROM retiring_titles; 

--Mentorship elegibility table
SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship
FROM employees as employees
INNER JOIN dept_emp as dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles as titles
ON (employees.emp_no = titles.emp_no)
WHERE (dept_emp.to_date = '9999-01-01')
AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;
SELECT * FROM mentorship;
