
--CREATING DEPARTMENT TABLE
CREATE TABLE
    DEPARTMENT(Num_S INT PRIMARY KEY, Label VARCHAR(255), Manager_Name VARCHAR(255));

--CREATING EMPLOYEES TABLE
CREATE TABLE
    EMPLOYEE(Num_E INT PRIMARY KEY, Name VARCHAR(255), Position VARCHAR(255),
	Salary DECIMAL(10,2), Num_S INT,
CONSTRAINT Department_Num_S FOREIGN KEY(Num_S) REFERENCES DEPARTMENT(Num_S));

--CREATING PROJECT TABLE
CREATE TABLE
    PROJECT(Num_P INT PRIMARY KEY, Title VARCHAR(255), Start_Date DATE, End_Date DATE, 
    Num_S INT FOREIGN KEY REFERENCES DEPARTMENT(Num_S));

--CREATING EMPLOYEE PROJECT
CREATE TABLE EMPLOYEE_PROJECT(
Num_E INT FOREIGN KEY REFERENCES EMPLOYEE(Num_E), 
Num_P INT FOREIGN KEY REFERENCES PROJECT(Num_P), 
Role VARCHAR(255)
);



 --INSERING THE RECORDS
INSERT INTO DEPARTMENT VALUES 
    (1, 'IT', 'Alice Johnson'), (2, 'HR', 'Bob Smith'), (3, 'Marketing', 'Clara Bennett');
SELECT * FROM DEPARTMENT;
INSERT INTO EMPLOYEE VALUES
    (101, 'John Doe', 'Developer', 60000.00, 1), (102, 'Jane Smith', 'Analyst', 55000.00, 2), 
    (103, 'Mike Brown', 'Designer', 50000.00, 3), (104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
    (105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);
SELECT * FROM EMPLOYEE;
INSERT INTO PROJECT VALUES(
    201, 'Website Redesign', '2024-01-15', '2024-06-30', 1), 
   (202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
   (203, 'Market Research', '2024-02-01', '2024-07-31', 3), 
   (204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);
SELECT * FROM PROJECT;
INSERT INTO EMPLOYEE_PROJECT VALUES
   (101, 201, 'Frontend Developer'), (104, 201, 'Backend Developer'), 
   (102, 202, 'Trainer'), (105, 202, 'Coordinator'), (103, 203, 'Research Lead'), 
   (101, 204, 'Network Specialist');
 SELECT * FROM EMPLOYEE_PROJECT;


 --UPDATE a Record, Update the Role of Employee_Num_E = 101 in the Employee_Project table to "Full Stack Developer".
 UPDATE EMPLOYEE_PROJECT SET Role= 'Full Stack Developer' WHERE Num_E=101;


---DELETE the employee with Num_E = 103 from the Employee table and remove their corresponding entries in the Employee_Project table
DELETE FROM EMPLOYEE WHERE Num_E =103;
--NEED TO DROP THE CONSTRAINT FIRST
ALTER TABLE EMPLOYEE_PROJECT DROP CONSTRAINT FK__EMPLOYEE___Num_E__1CBC4616;
--TIME TO DELETE
DELETE FROM EMPLOYEE WHERE Num_E = 103;
DELETE FROM EMPLOYEE_PROJECT WHERE Num_E =103;