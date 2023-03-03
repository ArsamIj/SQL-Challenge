--QUERIES

--1. List the employee number, last name, first name, sex, and salary of each employee.
select e."Emp", e."First_name", e."Last_name", e."Sex", s."salary"
from "Employee" as e
left join "salaries" as s
on e."Emp" = s."emp_no"
order by e."Emp";


--2. List the first name, last name, and hire date for the employees who were hired in 1986
select "First_name", "Last_name", "Hire_date"
from "Employee"
where ("Hire_date" between '1986-01-01' and '1986-12-31')


--3. List the manager of each department along with their department number,
--department name, employee number, last name, and first name
select dp."dept_no", dp."dept_name", dm."emp_no", e."First_name", e."Last_name"
from "departments" as dp
	inner join department_managers as dm
		on (dp."dept_no" = dm."dept_no")
	left join "Employee" as e
		on (dm."emp_no" = e."Emp")
order by dp."dept_no";


--4.List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name
select e."Emp", e."First_name", e."Last_name", de."dept_no", dp."dept_name"
from "Employee" as e
	inner join "department_employees" as de
		on (e."Emp"=de."emp_no")
	left join "departments" as dp
		on (de."dept_no"=dp."dept_no")
order by e."Emp";


--5.List first name, last name, and sex of each employee whose first name 
--is Hercules and whose last name begins with the letter B
select "First_name", "Last_name", "Sex" 
from "Employee"
where "First_name"='Hercules' and "Last_name" like 'B%';


--6.List each employee in the Sales department, including their employee number, 
--last name, and first name
select de."emp_no", e."First_name", e."Last_name", dp."dept_name"
from "Employee" as e
	inner join "department_employees" as de
		on (e."Emp"=de."emp_no")
	left join "departments" as dp
		on (de."dept_no"=dp."dept_no")
where "dept_name" = 'Sales'
order by de."emp_no";


--7.List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name
select dp."dept_name", de."emp_no", e."First_name", e."Last_name"
from "departments" as dp
	inner join "department_employees" as de
		on (de."dept_no"=dp."dept_no")
	left join "Employee" as e
		on (de."emp_no"=e."Emp")
where (dp."dept_name"='Sales' or dp."dept_name"='Development')
order by dp."dept_name";


--8.List the frequency counts, in descending order, of all the employee 
--last names (that is, how many employees share each last name)
select "Last_name", COUNT("Last_name") as "Frequency"
from "Employee"
group by "Last_name"
order by "Frequency" DESC;
