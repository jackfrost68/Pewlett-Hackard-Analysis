SELECT d.emp_no,
     d.first_name,
     d.last_name,
     dm.title,
     dm.from_date,
     dm.to_date
INTO retirement_titles
FROM employees as d
INNER JOIN titles as dm
ON d.emp_no = dm.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (emp_no) emp_no,  
 	first_name,
    last_name,
    title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC; 

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY COUNT(title) DESC; 


-- mentorship eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
     e.first_name,
     e.last_name,
	 e.birth_date,
     dm.from_date,
     dm.to_date,
	 j.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as dm
ON e.emp_no = dm.emp_no
INNER JOIN titles as j
ON e.emp_no = j.emp_no
WHERE (dm.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;
