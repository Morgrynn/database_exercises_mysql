USE project;

-- JOIN
-- 1. Print the person lastnames and the amount of their working hour.
SELECT lastname, workhour
FROM person
INNER JOIN hour
		ON person.id_person = hour.id_person;

-- 2. Print the person lastnames and the sum of their working hour.
SELECT lastname, SUM(workhour)
FROM person
INNER JOIN hour
		ON person.id_person = hour.id_person
GROUP BY lastname;

-- 3. Print the pnames of the project and the amount of their working hour.
SELECT pname, workhour
FROM project p
JOIN hour h
		ON p.id_project = h.id_project
GROUP BY pname;

-- 4.Print the pnames of the project and the sum of their working hour.
SELECT pname, SUM(workhour)
FROM project p
JOIN hour h
	ON p.id_project = h.id_project
GROUP BY pname;

-- 5. Print the person lastnames , project pnames and and the amount of their working hour.
SELECT lastname, pname, workhour
FROM project p
LEFT JOIN hour h
	ON p.id_project = h.id_project
JOIN person ps
	ON h.id_person = ps.id_person
ORDER BY lastname;
	
-- 6.Print the pnames of the project where Virta has been working.
SELECT pname
FROM project 
LEFT JOIN hour 
	ON project.id_project = hour.id_project
JOIN person
	ON hour.id_person = person.id_person
WHERE lastname = 'Virta';

-- 7.Print the project pname and person lastname and the amount of their working hour; the project without hour should be included (P5 and P6) 
SELECT 
	-- pro.id_project AS project_id, 
    -- h.id_project AS hour_id, 
    pname, 
    lastname, 
    workhour
FROM project pro
LEFT JOIN hour h
		ON pro.id_project = h.id_project
LEFT JOIN person per
	ON h.id_person = per.id_person
GROUP BY pro.id_project;

-- SubQuery
-- 1.Print the lastnames of person who live in the same city as Virta.
SELECT lastname
FROM person
WHERE city = (
SELECT city 
FROM person
WHERE lastname = 'Virta'
);

-- 2.Print the pnames of project which lies in the same city where Virta lives.
SELECT pname
FROM project
WHERE place = (
SELECT city
FROM person
WHERE lastname = 'Virta'
);

-- 3.Print the pnames of the project where Virta has been working.
	-- NOTE : You will need two subqueries
    -- The inner subquery returns the person_id of Virta ( person-table )
    -- The outer subquery gets the person_id of Virta and returns the corresponding project_id's
    -- The mainquery gets the project_id and returns the corresponding project pnames
    -- NB! the mainquery gets several project_id values (because Virta has been working on several project ) ,
    -- so you must use the the word IN in your WHERE statement 
SELECT pname
FROM project 
WHERE id_project IN (
SELECT id_project
FROM hour
WHERE id_person = (
SELECT id_person
FROM person
WHERE lastname = 'Virta'
)
);

-- Procedures
DELIMITER //
  CREATE PROCEDURE searchProject(IN sname CHAR(50))
  BEGIN
  SELECT * FROM person WHERE lastname=sname;
  END //
DELIMITER ;
CALL searchProject('Virta');
CALL searchProject('Joki');

-- Triggers TO BE CONTINUED... COMPLETED
-- 1. Read the about triggers from this page
-- 2. Create table named person_log which has fields:
--    	id_personLog INT PRIMARY KEY AUTO_INCREMENT
--    	Explanation VARCHAR(255)
--    	Logtime DATETIME
CREATE TABLE person_log(
	id_personLog SMALLINT PRIMARY KEY AUTO_INCREMENT,
	explanation VARCHAR(255),
	logtime DATETIME) ENGINE=InnoDB;
DROP TABLE person_log;

-- 3 Create trigger which will add Text "Person updated" and Date of today to the table person, if you update person data
-- -- -- NAMING CONVENTION
-- (BEFORE | AFTER)_tableName_(INSERT | UPDATE | DELETE)
-- Trigger Activation time: (BEFORE | AFTER)
-- Trigger Event: (INSERT | UPDATE | AFTER)

-- SYNTAX:
-- CREATE TRIGGER trigger_name trigger_time trigger_event
-- ON table_name
-- FOR EACH ROW
-- BEGIN
-- // logics and statements
-- END;

DELIMITER //
	CREATE TRIGGER before_person_update
    BEFORE UPDATE ON person
    FOR EACH ROW
    BEGIN
		INSERT INTO person_log
			SET explanation = 'Person updated',
			logtime = NOW();
    END //
DELIMITER ;

UPDATE person
SET firstname = 'Han', lastname = 'Solo'
WHERE id_person = 2134;



-- Union
-- 1.
SELECT city, COUNT(city) AS Amount 
FROM person
WHERE lastname = (
SELECT COUNT(lastname) 
FROM person
WHERE city
)
GROUP BY city
UNION
SELECT 'TOTAL' AS city, COUNT(city) AS Amount
FROM person
WHERE lastname = (
SELECT COUNT(lastname) 
FROM person
WHERE city
);

-- 2:  THIS NEEDS TO BE FIXED
SELECT id_project AS proj, pname
FROM project 
UNION
SELECT SUM(workhour) AS "sum of hour", id_project
FROM hour;

SELECT 
	id_project AS proj, 
    pname
FROM project p
JOIN hour h
		ON p.id_project = h.id_project
GROUP BY h.id_project;

-- 3.
SELECT pname, place
FROM project
UNION
SELECT city AS place 
FROM person;



	



    
    
    

