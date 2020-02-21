-- Backup(MySQLDump)

--    MySQL database can be backed up with mysqldump application. It works simply,
-- 	so that it creates the SQL code which will create all the database tables and insert all the data, which was on the tables. This code will be saved to file. And later you can execute the code from the file.

-- So, example this command will create the backup-file named backupfile.sql:
mysqldump -u root myDatabase -p > backupfile.sql

-- And you can restore that backup with this command:
mysql -u root -D myDatabase -p < backupfile.sql

-- NOTE: You can not execute above commands in MySQLMonitor, you have to execute them on the Server Console.

-- Start UniServerController and MySQL
-- Open MySQL Console and check with the command SHOW DATABASES; that you still have a database named project.
SHOW DATABASES;

-- Open the Server Console, and enter the command "mysqldump -u root -p project > project_backup.sql" and enter the root password.
mysqldump -u root project -p > project_backup.sql

-- In the ServerConsole give the command DIR, and check that project_backup.sql file has been created.
dir

-- Open the file project_backup.sql to some editor (Notepad++ etc.) and check the code. 
-- There is pobably nothing about the stored procedure "searcProject" which you have created in exercise 6.
notepad project_backup.sql

-- Try to find instructions how to "dump mysql stored procedures" and use MySQLDump to create a file named "project_with_procedures.sql"
mysqldump -u root project -p --routines > project_with_procedures.sql

-- In MySQL Console give command DROP DATABASE project; and check with the command SHOW DATABASES; that the project database has been deleted.
DROP DATABASE project;
SHOW DATABASES;

-- In MySQL Console give command CREATE DATABASE project;
CREATE DATABASE project;

-- In MySQL Console give command SHOW TABLES FROM project; The database should be empty.
SHOW TABLES FROM project;

-- In ServerConsole give command "mysql -u root -p -D project < project_backup.sql" and enter the password.
mysql -u root -D project -p < project_backup.sql

-- In MySQL Console give command SHOW TABLES FROM project; Now you should again have tables person, project and hour
SHOW TABLES FROM project;

-- In MySQL Console check also the data with command SELECT * FROM project.person;
SELECT * FROM project.person;

-- Check that there is no procedures in your database.
call searchProject('Joki');

-- In ServerConsole give command "mysql -u root -p -D project < project_with_procedures.sql" and enter the password.
mysql -u root -D project -p < project_with_procedures.sql

-- Check again if there is some procedures in your database. 
call searchProject('Joki');


-- BACKUP WITH WORKBENCH
drop database new_project;
show databases;

-- Server -> Data Export 
-- choose database -> project
-- Export to self -- // give path and file name
-- Start Export

create database my_project;

-- Server -> Data Import 
-- Import to self --// path and file name
-- choose database -> my_project
-- Start Import

use my_project;

select * from person;