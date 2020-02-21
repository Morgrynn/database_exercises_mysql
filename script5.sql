-- Do from mysql cli
show databases;

select user from mysql.user;

-- This creates a new user 
GRANT ALL ON demo.* TO 'demouser'@'localhost' IDENTIFIED BY 'pass123';

-- run this command again inside the mysql cli to see new user
select user from mysql.user;

-- Click Server Tab above and then Users and Privaleges and you can click on demouser and delete from user

-- Exercise 5 ---

-- Start UniServerController and MySQL-server and open MySQL-console
-- Check that you have databases project and library. If you havent project, so create it (you can find the codes from mainpage). And if you don't have database library you have to make the exercise2 first. 
show databases;

-- Create user named "testUser" which has SELECT privileges to all tables in database project, he can connect from localhost and his password is testPass
CREATE USER 'testUser'@'localhost' IDENTIFIED BY 'password';
grant select on project.* to testUser@localhost;
show grants for testUser@localhost;
select user from mysql.user;

flush privileges;

-- In mysql server type:
-- exit

-- Open ServerConsole and login with testUser
mysql -u testUser -p -- then type in password

-- As a testUser check which databases you can see
show grants;

-- As a testUser execute some SELECT queries
use project;
select * from project;


-- As a testUser try to INSERT new person to person-table
INSERT INTO person VALUES (2221, 'Han', 'Solo', 'HOTH', 1977, 7800);
-- ERROR 1142 (42000): INSERT command denied to user 'testUser'@'localhost' for table 'person'

-- As a root add INSERT-privilege to testUser to project-database tables, from localhost
GRANT INSERT ON project.* TO 'testUser'@'localhost';

-- As a testUser try to INSERT new person to person-table (perhaps you have to logout and login again)
insert into person VALUES (1, 'Han', 'Solo', 'HOTH', 1977, 7800);

-- As a testUser try to DELETE the "new person" from person-table
delete from person where firstname='Han';

-- As a root add DELETE-privilege to testUser to project-database's person-table, from localhost
SHOW CREATE TABLE person;

-- As a testUser try again to DELETE the "new person" from person-table
delete from person where firstname='Han';

-- As a testUser check which databases you can see
show databases;
-- Ad a root add SELECT privilege to testUser from localhost also to database library
grant select on library.* to testUser@localhost;

-- As a testUser check which databases you can see
show databases;

-- Check from http://dev.mysql.com/doc/refman/5.0/en/revoke.html how REVOKE command works
-- As a root remove SELECT privilege from testUser to database project
revoke select on project.* from testUser@localhost;

-- As a testUser check which databases you can see
show databases;

-- As a testUser logout
-- Check from http://dev.mysql.com/doc/refman/5.0/en/drop-user.html how DROP USER command works
drop user testUser@localhost;

-- As a root remove the testUser and check that the user doesn't exist
-- Try to login as a testUser 
select user, host from mysql.user;