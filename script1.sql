USE library;

-- SELECT and WHERE / Library database
-- Question 1: Shows all data from all fields in borrower-table. 
SELECT *
FROM borrower;

-- Question 2: Shows firstnames and lastnames in borrower table in alphabetical order based to lastname
SELECT firstname, lastname
FROM borrower
ORDER BY firstname, lastname;

-- Question 3: Shows all postalcodes, but same code should be mentioned only once. 
SELECT DISTINCT postalcode
FROM borrower;

-- Question 4:Shows first 5 rows in borrower-table (use Google to find the answer)
SELECT *
FROM borrower
LIMIT 5;


-- Question 5:Shows rows 6-10 in borrower table. 
SELECT *
FROM borrower
LIMIT 5, 5;
-- WHERE borrower_id > 5 AND borrower_id <= 10;
-- WHERE borrower_id BETWEEN '6' AND '10';

-- SELECT * FROM yourTableName ORDER BY id DESC LIMIT 10
SET @row_number = 5; 
SELECT 
    (@row_number:=@row_number + 1) AS num,
    firstname,
    lastname,
    phone,
    streetaddress,
    postalcode
FROM
    borrower  
LIMIT 5;


-- Question 6:Shows all fields from borrower if borrower_id is 9. 
SELECT *
FROM borrower
WHERE borrower_id = 9;

-- Question 7:Shows all fields from borrower if borrower_id is 9 or 11. 
SELECT *
FROM borrower
WHERE borrower_id = 9 OR borrower_id = 11;

-- Question 8:
-- Shows all fields from borrower if borrower_id is 9 or 11 or 13.

SELECT *
FROM borrower
WHERE borrower_id = 9 OR borrower_id = 11 OR borrower_id = 13;

-- Question 9:
-- Shows all fields from borrower if borrower_id is 5-10.

SELECT *
FROM borrower
WHERE borrower_id > 4 AND borrower_id <= 10;

-- Question 10:
-- Shows all fields from borrower if borrower_id is not 5-10.
 
SELECT *
FROM borrower
WHERE NOT (borrower_id > 4 AND borrower_id <= 10);

-- Queston 11:
-- Shows all fields from borrower if borrower_id is 1-12 and postalcode is 90101.

SELECT *
FROM borrower
WHERE (borrower_id >= 1 AND borrower_id <= 12) AND postalcode = '90101';

-- Queston 12:
-- Shows borrower's lastname and firstname if firstname is Carla.

SELECT lastname, firstname
FROM borrower
WHERE firstname = 'Carla';

-- Question 13:
-- Shows borrower's lastname and firstname if firstname is Carla or Ralph.

SELECT lastname, firstname
FROM borrower
WHERE firstname = 'Carla' OR firstname = 'Ralph';

-- Question 14:
-- Shows borrower's lastname and firstname if streetaddress is Uusikatu 4 or Isokatu 66.

SELECT lastname, firstname
FROM borrower
-- WHERE streetaddress = 'Uusikatu 4' OR streetaddress = 'Isokatu 66';
WHERE streetaddress IN ('Uusikatu 4', 'Isokatu 66');

-- Question 15:
-- Show all person names if the person doesn't have a phone.

SELECT lastname, firstname
FROM borrower
WHERE phone IS NULL;

-- Question 16:
-- Show all person names and phone numbers if the person has phone.

SELECT lastname, firstname, phone
FROM borrower
WHERE phone IS NOT NULL;

-- Question 17:
-- MySQL has several functions which will return current date. Use Google to find out them. You can test them by writing Query: "SELECT function-name;"

SELECT COUNT(*) FROM borrower;
CREATE TABLE count (i INT);

SELECT CURDATE();

-- Question 18:
-- Shows all fields from Borrow-table if the book is late.
SELECT *
FROM borrow
WHERE return_date < CURDATE();

-- LIKE
-- Question 1:
-- Shows all fields from book if the book name starts with 'A'

SELECT *
FROM book
WHERE name LIKE 'a%';

-- Question 2:
-- Shows all fields from book if the book name includes word Management

SELECT *
FROM book
WHERE name LIKE 'management%';

-- Question 3:
-- Shows all fields from book if the book name includes letter e

SELECT *
FROM book
WHERE name LIKE '%e%';

-- Question 4:
-- Shows all fields from book if the book name includes letter e and a

SELECT *
FROM book
WHERE name LIKE '%e%' OR 
	  name LIKE '%a%';

-- Question 5:
-- Shows firstnames and lastnames of borrower's who lives on Isokatu

SELECT firstname, lastname
FROM borrower
WHERE streetaddress LIKE '%isokatu%';

-- Question 6:
-- Shows firstnames and lastnames and phonenumber of borrower, which phonenumber starts with 040 
SELECT firstname, lastname, phone
FROM borrower
WHERE phone LIKE '040%';

-- SUBSTRING
-- Question 1:
-- Shows first 10 letters from Booknames

SELECT SUBSTR(name, 1, 10) AS ExtractString
FROM book; 

-- Question 2:
-- Shows first 8 letters from borrower' lastnames and 6 first letters from their streetaddress 
SELECT SUBSTR(lastname, 1, 8), SUBSTR(streetaddress, 1, 6)
FROM borrower; 




