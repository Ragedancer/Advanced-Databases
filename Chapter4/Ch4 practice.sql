--Question 1
SELECT animal_name AS "Available Animals", arrival_date AS "Arrived On"
FROM Animal
WHERE animal_age Between 1 AND 3
ORDER BY animal_age ASC, arrival_date ASC;

--Question 2
-- Fetch is in comments since Fetch doesnt work in 11g
Select last_name || first_name "Top Sales Performer", '$'||salary "Base Salary", '$'||commission_pct "Commision Rate", 
'$'||salary*commission_pct  "Total Salary"
From employees
WHERE commission_pct IS NOT NULL
ORDER BY salary*commission_pct DESC;
--FETCH FIRST 25 ROWS ONLY;