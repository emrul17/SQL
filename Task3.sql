/* Compare the average salary of female versus male employees in the entire company until year 2002, 
and add a filter allowing you to see that per each department.*/
SELECT 
    YEAR(e.hire_date)as calendar_year,
    d.dept_name,
    dm.from_date,
    dm.to_date,
    e.gender,
    AVG(s.salary) AS avg_salary
FROM
    t_departments d
        JOIN
    t_dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    t_employees e ON e.emp_no = dm.emp_no
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
GROUP BY e.emp_no;


SELECT 
    d.dept_name,
    e.gender,
    round(avg(s.salary),2) as avg_salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_departments d
        JOIN
    t_dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    t_salaries s ON s.emp_no = dm.emp_no
        JOIN
    t_employees e ON e.emp_no = s.emp_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;