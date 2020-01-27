use employees_mod;
SELECT 
    MIN(s.salary), e.gender
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
WHERE
    e.gender = 'F';
    


/*Create an SQL stored procedure that will allow you to obtain the average male and female salary 
per department within a certain salary range. Let this range be defined by two values the user can
 insert when calling the procedure. */   
drop procedure if exists avg_salary;
   
   delimiter $$
create procedure avg_salary( in p_min_salary float, in p_max_salary float)
begin
select e.gender, d.dept_name, avg(s.salary) as Avg_salary  from t_salaries s 
join t_employees e on s.emp_no=e.emp_no
join t_dept_emp de on de.emp_no=e.emp_no
join t_departments d on d.dept_no=de.dept_no
where  s.salary between p_min_salary and p_max_salary
group by d.dept_no, e.gender;
end $$

delimiter ;

call avg_salary(50000, 90000);

SELECT 
    e.gender, d.dept_name, AVG(s.salary) AS Avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
WHERE
    s.salary BETWEEN 50000 AND 90000
GROUP BY d.dept_no , e.gender;
