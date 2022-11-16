/* List the following details of each employee: employee number, last name, first name, sex, and salary. */

select e.id "Employee Number", 
       e.last_name "Last Name",
	   e.first_name "First Name",
	   e.sex "Sex",
	   to_char(s.salary,'L999,999') "Salary"
  from employee e
       join salary s on (s.employee_id = e.id);
	   


/* List first name, last name, and hire date for employees who were hired in 1986. */

select e.first_name "First Name",
       e.last_name "Last Name",
	   e.hire_date "Hire Date"
  from employee e
 where date_trunc('year', e.hire_date) = to_date('19860101','yyyymmdd')
order by e.last_name, e.first_name;



/* List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name. */
select d.dept_no "Dept. No."
      ,d.name "Dept. Name"
	  ,e.id "Employee ID"
	  ,e.last_name "Last Name"
	  ,e.first_name "First Name"
  from dept_manager dm
       join department d on (d.dept_no = dm.dept_no)
	   join employee e on (e.id = dm.employee_id)
order by 1,4,5;
	   

/* List the department of each employee with the following information: employee number, last name, first name, and department name. */
select e.id "Employee No."
      ,e.last_name "Last Name"
	  ,e.first_name "First Name"
	  ,d.name "Dept. Name"
  from dept_emp de
       join employee e on (e.id = de.employee_id)
	   join department d on (d.dept_no = de.dept_no)
order by 1;	   


/* List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." */
select e.first_name "First Name"
      ,e.last_name "Last Name"
	  ,e.sex
  from employee e
 where e.first_name = 'Hercules'
   and e.last_name like 'B%'
order by last_name;

/* List all employees in the Sales department, including their employee number, last name, first name, and department name. */
select e.id "Employee No."
      ,e.last_name "Last Name"
      ,e.first_name "First Name"
	  ,d.name "Dept. Name"
  from dept_emp de
       join employee e on (e.id = de.employee_id)
	   join department d on (d.dept_no = de.dept_no)
 where d.name = 'Sales'
order by 1;	


/* List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. */
select e.id "Employee No."
      ,e.last_name "Last Name"
      ,e.first_name "First Name"
	  ,d.name "Dept. Name"
  from dept_emp de
       join employee e on (e.id = de.employee_id)
	   join department d on (d.dept_no = de.dept_no)
 where d.name in ( 'Sales', 'Development')
order by 4,1;


/* List the frequency count of employee last names (i.e., how many employees share each last name) in descending order. */
select e.last_name "Last Name"
      ,count(1)
  from employee e
group by e.last_name
order by 2 desc, 1 asc;


	   
	   
	   