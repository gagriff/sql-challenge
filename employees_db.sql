-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/zFW5fy
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "employee" (
    "id" int   NOT NULL,
    "title_id" varchar(6)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "title" (
    "id" varchar(6)   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "salary" (
    "employee_id" int   NOT NULL,
    "salary" Numeric   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "employee_id"
     )
);

CREATE TABLE "department" (
    "dept_no" varchar(6)   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "employee_id" int   NOT NULL,
    "dept_no" varchar(6)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "employee_id","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(6)   NOT NULL,
    "employee_id" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","employee_id"
     )
);

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_title_id" FOREIGN KEY("title_id")
REFERENCES "title" ("id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("id");

