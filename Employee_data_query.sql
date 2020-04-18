DROP DATABASE IF EXISTS employees;
USE employees;
USE employees_mod;

/*Create a visualization that provides a breakdown between the male and 
female employees working in the company each year, starting from 1990.*/

SELECT 
	COUNT(e.emp_no), 
    e.gender, d.dept_name, 
    YEAR(dm.from_date) AS Cal_year 
FROM t_employees e 
JOIN 
	t_dept_manager dm ON e.emp_no=dm.emp_no
JOIN
	t_departments d ON d.dept_no=dm.dept_no

GROUP BY Cal_year, e.gender
HAVING Cal_year>=1990
ORDER BY Cal_year ;

/*Compare the average salary of female versus male employees in the entire company until year 2002, 
and add a filter allowing you to see that per each department*/

SELECT 
	e.gender, 
	AVG(s.salary) AS Avg_salry,
    d.dept_name, 
    YEAR(de.from_date) AS Cal_year
FROM t_employees e 
	JOIN t_dept_emp de
ON e.emp_no=de.emp_no
	JOIN t_departments d
ON de.dept_no=d.dept_no
	JOIN t_salaries s
ON de.emp_no=s.emp_no
	GROUP BY d.dept_no , e.gender , Cal_year
	HAVING Cal_year<=2002
	ORDER BY d.dept_no ;

/*Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. Let this range be defined by two 
values the user can insert when calling the procedure.*/

DROP PROCEDURE IF EXISTS procedure_avg_salary;

DELIMITER $$
CREATE PROCEDURE procedure_avg_salary( IN avg_salary_min float, avg_salary_max float)

BEGIN
	SELECT d.dept_name, e.gender, AVG(s.salary) AS Avg_salary
	FROM salaries s 
	JOIN employees e ON s.emp_no=e.emp_no
	JOIN dept_emp dm ON s.emp_no=dm.emp_no
	JOIN departments d ON dm.dept_no=d.dept_no
    WHERE s.salary BETWEEN avg_salary_min AND avg_salary_max
	GROUP BY d.dept_no, e.gender
    ;
END$$

DELIMITER ;

/*Compare the number of male managers to the number of female managers from different 
departments for each year, starting from 1990*/

SELECT  
	YEAR(dm.from_date) AS Cal_year, 
	COUNT(dm.emp_no) As No_of_manager, 
    d.dept_name, 
    e.gender 
FROM
	t_departments d 
JOIN t_dept_manager dm ON d.dept_no=dm.dept_no
JOIN t_employees e ON dm.emp_no=e.emp_no

GROUP BY Cal_year 
HAVING Cal_year>=1990
;
