-- NOMOR 1 : View 
CREATE VIEW max_salaries AS
SELECT salaries.emp_no, 
		employees.first_name, 
		employees.last_name, MAX(salaries.salary)
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
GROUP BY
    salaries.emp_no,
    employees.first_name,
    employees.last_name;

-- NOMOR 2 : View
CREATE VIEW employee_hired_info AS
SELECT
employees.emp_no,
employees.first_name,
employees.last_name ,
TIMESTAMPDIFF(YEAR, employees.birth_date, employees.hire_date) AS age_at_hire,
departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

WHERE dept_emp.from_date = (
    SELECT MIN(de2.from_date)
    FROM dept_emp de2  
    WHERE de2.emp_no = employees.emp_no
);

SELECT * FROM employee_hired_info;

-- NOMOR 1 : Index & Constraint - Meambahkan index pada kolom from_date di table dept_emp
CREATE INDEX fromdate 
ON dept_emp(from_date)

-- NOMOR 2 : Index & Constraint - Menambahkan check constraint pada table employees sehingga hanya employee dengan usia >= 20 yang boleh direkrut
ALTER TABLE employees
ADD CONSTRAINT check_hire_min
CHECK (TIMESTAMPDIFF(YEAR, birth_date, hire_date) >= 20);

CREATE OR REPLACE VIEW emp_max_salary
AS
SELECT employees.emp_no,
first_name, last_name,
MAX(salary) max_salary
FROM employees JOIN salaries
ON employeees.emp_no = salarien.emp_mo
GROUP BY employees.emp_no,
first_name, last_name;