SELECT C.country_name, L.city, D.department_name, count(E.employee_id) "Ilość pracowników", 
CASE WHEN count(E.employee_id) <=4 THEN 'Malo'
ELSE 'Duzo' END AS ILOSC
FROM countries C, locations L, departments D, employees E
WHERE C.country_id=L.country_id
AND L.location_id=D.location_id
AND D.department_id=E.department_id
GROUP BY C.country_name, L.city, D.department_name
HAVING count(E.employee_id) BETWEEN NVL('&Min_il',4) AND NVL('&MAX_il',20);




w having jeśli w promcie nie ma nic ma na coś zamienić

ORDER BY C.country_name;

SELECT E.last_name "Employee name", S.first_name "Manager name"
FROM employees E
JOIN employees S
ON E.manager_id=S.employee_id;

SELECT E.first_name, E.last_name, J.job_title, E.salary, D.department_name, L.city, C.country_name, R.region_name
FROM employees E, jobs J, departments D, locations L, countries C, regions R
WHERE R.region_id=C.region_id
AND C.country_id=L.country_id
AND L.location_id=D.location_id
AND D.department_id=E.department_id
AND J.job_id=E.job_id;

SELECT D.department_name, E.first_name, E.last_name
FROM departments D
FULL OUTER JOIN employees E
ON E.department_id=D.department_id;

SELECT D.department_name, NVL(E.first_name, 'Brak') || ' ' || NVL(E.last_name, 'managera') "Imię nazwisko"
FROM departments D
LEFT JOIN employees E
ON D.manager_id=E.employee_id;

SELECT D.department_name, count(E.employee_id)
FROM departments D
LEFT JOIN employees E
ON D.department_id=E.department_id
GROUP BY D.department_name;

SELECT E.first_name, E.last_name, J.job_title, E.salary, D.department_name, L.city, C.country_name, R.region_name
FROM employees E
LEFT JOIN jobs J ON J.job_id=E.job_id
LEFT JOIN departments D ON D.department_id=E.department_id
LEFT JOIN locations L ON L.location_id=D.location_id
LEFT JOIN countries C ON C.country_id=L.country_id
LEFT JOIN regions R ON R.region_id=C.region_id;

SELECT R.region_name, count(E.employee_id)
FROM regions R, countries C, locations L, departments D, employees E
WHERE R.region_id=C.region_id
AND C.country_id=L.country_id
AND L.location_id=D.location_id
AND D.department_id=E.department_id
GROUP BY R.region_name;