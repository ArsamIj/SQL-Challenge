--SCHEMATAS
CREATE TABLE "Employee" (
    "Emp" INT   NOT NULL,
    "Emp_title_id" VARCHAR (30)   NOT NULL,
    "Birth_date" DATE   NOT NULL,
    "First_name" VARCHAR(30)   NOT NULL,
    "Last_name" VARCHAR(30)   NOT NULL,
    "Sex" VARCHAR(1)   NOT NULL,
    "Hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "Emp"
     )
);
SELECT * FROM "Employee";
---------------------------------------------
CREATE TABLE "titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);
SELECT * FROM "titles";
---------------------------------------------
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" VARCHAR   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);
SELECT * FROM "salaries";
---------------------------------------------
CREATE TABLE "departments" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
SELECT * FROM "departments";
---------------------------------------------
CREATE TABLE "department_managers" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "emp_no" INT   NOT NULL
);
SELECT * FROM "department_managers";
---------------------------------------------
CREATE TABLE "department_employees" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(5)  NOT NULL
);
SELECT * FROM "department_employees";
---------------------------------------------


--RELATIONSHIPS
ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_Emp_title_id" FOREIGN KEY("Emp_title_id")
REFERENCES "titles" ("title_id"); --WORKED

ALTER TABLE "department_managers" ADD CONSTRAINT "fk_department_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("Emp");--worked

ALTER TABLE "department_managers" ADD CONSTRAINT "fk_department_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");--worked

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("Emp");--worked

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("Emp");--worked

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");--worked

-----------------------------------------------


--QUERIES

--1. List the employee number, last name, first name, sex, and salary of each employee.
select e."Emp", e."First_name", e."Last_name", e."Sex", s."salary"
from "Employee" as e
left join "salaries" as s
on e."Emp" = s."emp_no"
order by e."Emp";
--works

--2. List the first name, last name, and hire date for the employees who were hired in 1986
select "First_name", "Last_name", "Hire_date"
from "Employee"
where ("Hire_date" between '1986-01-01' and '1986-12-31')
--works

--3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name
select dp."dept_no", dp."dept_name", dm."emp_no", e."First_name", e."Last_name"
from "departments" as dp
	inner join department_managers as dm
		on (dp."dept_no" = dm."dept_no")
	left join "Employee" as e
		on (dm."emp_no" = e."Emp")
order by dp."dept_no";
--works

--4.List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name
select e."Emp", e."First_name", e."Last_name", de."dept_no", dp."dept_name"
from "Employee" as e
	inner join "department_employees" as de
		on (e."Emp"=de."emp_no")
	left join "departments" as dp
		on (de."dept_no"=dp."dept_no")
order by e."Emp";
--works

--5.List first name, last name, and sex of each employee whose first name 
--is Hercules and whose last name begins with the letter B
select "First_name", "Last_name", "Sex" 
from "Employee"
where "First_name"='Hercules' and "Last_name" like 'B%';
--works

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
--works

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
--works

--8.List the frequency counts, in descending order, of all the employee 
--last names (that is, how many employees share each last name)
select "Last_name", COUNT("Last_name") as "Frequency"
from "Employee"
group by "Last_name"
order by "Frequency" DESC;
--works







