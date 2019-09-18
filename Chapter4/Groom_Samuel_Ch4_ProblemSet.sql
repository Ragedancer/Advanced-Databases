-- Samuel Groom
-- 9/9/2019

-- Question 1
SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary BETWEEN 5000 AND 6000
ORDER BY salary DESC;

-- Question 2

SELECT bldg_code, room, capacity
FROM location
WHERE capacity >= 35 AND room >= 400
ORDER BY capacity;

--Question 3
-- I feel like theres a better way to write this, but it works
SELECT s_first ||' ' || s_mi|| ' ' || s_last "Name",s_dob,
TRUNC(months_between(sysdate,s_dob)/12)  age
FROM student
WHERE TRUNC(months_between(sysdate,s_dob)) >= 252
ORDER BY age ASC;

--Question 4
Select first_name || ' ' || last_name || ' --> '|| job_id "Employees", salary
FROM hr.employees
WHERE salary BETWEEN 3500 AND 4000;


-- Question 4 with substitution variables
Define s_low
Define s_high
Select first_name || ' ' || last_name || ' --> '|| job_id "Employees", salary
FROM hr.employees
WHERE salary > &s_low AND salary < &s_high;


--Question 5 with substitution variable
DEF col_name
DEF d_num
SELECT email,phone_number,'&&col_name'
FROM hr.employees
Where department_id = &d_num
ORDER BY '&&col_name';
UNDEFINE col_name;