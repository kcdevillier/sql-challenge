Create view query1 as 
select 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.gender, 
	salaries.salary
from 
	employees e 
join salaries on e.emp_no = salaries.emp_no; 

Create view query2 as
select 
	e.first_name || e.last_name as Full_name,
	e.hire_date
from 
	employees e
where e.hire_date >= '1986-01-01' and
	  e.hire_date <= '1986-12-31' 
order by e.hire_date ASC;

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.

create view query 3 as
select 
	departments.dept_no, 
	departments.dept_name,
	dept_manager.emp_no, 
	employees.first_name,
	employees.last_name,
	employees.hire_date
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from departments 
join dept_emp on dept_emp.dept_no = departments.dept_no
join employees on dept_emp.emp_no = employees.emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select 
	e.first_name,
	e.last_name
from employees as e 
where 
	e.first_name = 'Hercules' and
	e.last_name like 'B%'; 

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select 
	employees.emp_no,
	employees.last_name,
	employees.first_name, 
	departments.dept_name
from departments 
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
where 
	departments.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
where
	departments.dept_name = 'Sales' or
	departments.dept_name = 'Development';
	




--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
	employees.last_name, 
	count(employees.last_name) as last_name_count
from employees
group by employees.last_name
order by last_name_count desc;
--
select *
from employees
right join dept_emp on dept_emp.emp_no = employees.emp_no
--left join departments on dept_emp.dept_no = departments.dept_no
left join salaries on salaries.emp_no = employees.emp_no
left join titles on titles.emp_no = salaries.emp_no
order by employees.emp_no
limit 15;
















