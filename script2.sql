CREATE database Project;
USE project;

CREATE TABLE person (
	id_person SMALLINT PRIMARY KEY,
	firstname VARCHAR(25) NOT NULL,
	lastname VARCHAR(25) NOT NULL,
	city VARCHAR(20),
	birthyear SMALLINT,
	salary DOUBLE) ENGINE=InnoDB;


	CREATE TABLE project (
	id_project CHAR(2) PRIMARY KEY,
	pname VARCHAR(20) NOT NULL,
	priorit SMALLINT,
	place VARCHAR(20)) ENGINE=InnoDB;


	CREATE TABLE hour (
	id_project CHAR(2) NOT NULL,
	id_person SMALLINT NOT NULL,
	workhour INTEGER,
	plannedhour INTEGER,
	PRIMARY KEY (id_person, id_project),
	FOREIGN KEY (id_project)
	REFERENCES project(id_project)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (id_person)
	REFERENCES person (id_person)
	ON DELETE RESTRICT ON UPDATE CASCADE
	) ENGINE=InnoDB;
    
    
    
    
    
	INSERT INTO person VALUES (2134,'Jussi','Virta','TURKU',1935,5050);
	INSERT INTO person VALUES (2245,'Liisa','Joki','HELSINKI',1944,7230);
	INSERT INTO person VALUES (2983,'Matti','Ranta','TAMPERE',1944,3500);
	INSERT INTO person VALUES (2234,'Jim','Smith','TURKU',1946,7230);
	INSERT INTO person VALUES (2884,'Lisa','Simpson','HELSINKI',1935,7100.55);
	INSERT INTO person VALUES (2345,'Ann','Jones','TURKU',1954,5050);


	INSERT INTO project VALUES('P1','Bookkeeping',2,'TURKU');
	INSERT INTO project VALUES('P2','Billing',1,'HELSINKI');
	INSERT INTO project VALUES('P3','Store',3,'HELSINKI');
	INSERT INTO project VALUES('P4','Selling',2,'TURKU');
	INSERT INTO project VALUES('P5','Customers',3,'KUOPIO');
	INSERT INTO project VALUES('P6','Statistics',NULL,NULL);


	INSERT INTO hour values('P1',2134,300,300);
	INSERT INTO hour values('P1',2234,200,NULL);
	INSERT INTO hour values('P1',2245,200,300);
	INSERT INTO hour values('P1',2345,100,100);
	INSERT INTO hour values('P1',2884,100,200);
	INSERT INTO hour values('P1',2983,400,500);
	INSERT INTO hour values('P2',2134,300,NULL);
	INSERT INTO hour values('P2',2245,400,500);
	INSERT INTO hour values('P3',2245,200,100);
	INSERT INTO hour values('P4',2234,300,400);
	INSERT INTO hour values('P4',2245,200,200);
	INSERT INTO hour values('P4',2884,400,600);
    
-- SELECT and WHERE and ORDER BY/ Project database
-- 1. Shows all person in alphabetical order based on the lastname
SELECT *
FROM person
ORDER BY lastname;

-- 2.Shows all person ordered based to their ages, so that oldest is first
SELECT *
FROM person
ORDER BY birthyear ASC;

-- 3. Shows all person ordered based to their ages, so that youngest is first
SELECT *
FROM person
ORDER BY birthyear DESC;

-- 4. Shows all person in alphabetical order based to city and lastname
SELECT * 
FROM person
ORDER BY city, lastname;

-- SELECT, WHERE / Project database
-- 1. Shows All City-names in person-table 
SELECT city
FROM person;

-- 2. Shows All City-names in person-table, but same City should be mentioned only once
SELECT DISTINCT city
FROM person;

-- 3. Shows firstname, lastname and salary if salary is bigger than 6000.
SELECT firstname, lastname, salary
FROM person
WHERE salary > '6000';

-- 4. Shows firstname, lastname and salary if is bigger than 6000. In Alphabetical order by name
SELECT firstname, lastname, salary
FROM person
WHERE (salary > '6000')
ORDER BY lastname;

-- 5. Shows firstname, lastname and salary if salary is bigger than 6000. Descending order by salary
SELECT firstname, lastname, salary
FROM person
WHERE (salary > '6000')
ORDER BY lastname DESC;

-- 6. Shows firstname, lastname and salary of those who lives in Turku and salary is <7000
SELECT firstname, lastname, salary
FROM person
WHERE (salary > '7000') AND city IN ('Turku');


-- 7. Shows firstname, lastname and salary of those who lives in Turku or Helsinki
SELECT firstname, lastname, salary
FROM person
WHERE city IN ('Turku', 'Helsinki');
