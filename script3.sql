USE project;

-- Exercise 3
-- 1. Shows maximum salary and minimum salary
SELECT city, max(salary), min(salary)
FROM person
GROUP BY city;

-- 2. Shows the number of rows in project table
SELECT COUNT(pname)
FROM project;

-- 3. Shows average of birthyears
SELECT AVG(birthyear)
FROM person;

-- 4. Shows the number of person who lives on Turku
SELECT COUNT(firstname), city
FROM person
WHERE city = 'Turku'
GROUP BY city;

-- 5. Shows sum of salary of person who lives on Turku 
SELECT SUM(salary), city
FROM person
WHERE city = 'Turku'
GROUP BY city;

-- 6. 
SELECT  city, SUM(salary)
FROM person
GROUP BY city;

-- 7.
SELECT  city, AVG(salary)
FROM person
GROUP BY city;

-- 8.
SELECT  id_project AS project_id, SUM(workhour)
FROM hour
GROUP BY id_project;

-- 9. 
SELECT  id_project AS project_id, SUM(workhour)
FROM hour
GROUP BY id_project
HAVING SUM(workhour) > 500;

-- 10 
SELECT city, GROUP_CONCAT(lastname) AS person
FROM person 
GROUP BY city;

-- 11
SELECT place, GROUP_CONCAT(pname) AS project
FROM project
GROUP BY place;


