
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


