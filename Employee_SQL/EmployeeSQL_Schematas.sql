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
REFERENCES "titles" ("title_id"); 

ALTER TABLE "department_managers" ADD CONSTRAINT "fk_department_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("Emp");

ALTER TABLE "department_managers" ADD CONSTRAINT "fk_department_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("Emp");

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("Emp");

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-----------------------------------------------