--Write a query to retrieve the names of employees who are assigned to more than one project,
--including the total number of projects for each employee.
SELECT EMPLOYEE.Name, COUNT(EMPLOYEE_PROJECT.Num_P) AS No_of_Projects
FROM EMPLOYEE
JOIN EMPLOYEE_PROJECT
ON EMPLOYEE.Num_E = EMPLOYEE_PROJECT. NUM_E
GROUP BY EMPLOYEE.Name
HAVING COUNT(EMPLOYEE_PROJECT.NUM_P) > 1;


--Write a query to retrieve the list of projects managed by each department, including the department label and manager’s name.
SELECT DEPARTMENT.Label AS Department_Label, DEPARTMENT.Manager_Name, PROJECT.Title AS Project_Title
FROM DEPARTMENT
JOIN PROJECT
ON DEPARTMENT.num_s = PROJECT.num_s;

--Write a query to retrieve the names of employees working on the project "Website Redesign," including their roles in the project.
SELECT EMPLOYEE.Name, EMPLOYEE_PROJECT.Role
FROM EMPLOYEE
JOIN EMPLOYEE_PROJECT
ON EMPLOYEE.Num_E = EMPLOYEE_PROJECT.Num_E
WHERE EMPLOYEE_PROJECT.Num_P = 
(SELECT Num_P FROM PROJECT WHERE Title = 'Website Redesign');

--Write a query to retrieve the department with the highest number of employees, 
--including the department label, manager name, and the total number of employees.
SELECT DEPARTMENT.Label, DEPARTMENT.Manager_Name, COUNT(EMPLOYEE.Num_E) AS Total_no_of_Employees
FROM DEPARTMENT
JOIN EMPLOYEE
ON DEPARTMENT.Num_S = EMPLOYEE.Num_S
GROUP BY DEPARTMENT.Label, DEPARTMENT.Manager_Name
HAVING COUNT(EMPLOYEE.Num_E)=(
SELECT TOP 1 COUNT(EMPLOYEE.Num_E) AS Total_no_of_Employees
FROM EMPLOYEE
GROUP BY Num_S
ORDER BY Total_no_of_Employees DESC);

--Write a query to retrieve the names and positions of employees earning a salary greater than 60,000, including their department names.
SELECT EMPLOYEE.Name, EMPLOYEE.Position, DEPARTMENT.Label AS Department_Label
FROM EMPLOYEE
JOIN DEPARTMENT
ON EMPLOYEE.Num_S = DEPARTMENT.Num_S
WHERE EMPLOYEE.Salary > 60000;

--Write a query to retrieve the number of employees assigned to each project, including the project title.
SELECT PROJECT.Num_P, PROJECT.Title, COUNT(EMPLOYEE_PROJECT.Num_E) AS No_of_Employees
FROM PROJECT
LEFT JOIN EMPLOYEE_PROJECT
ON PROJECT.Num_P = EMPLOYEE_PROJECT.Num_P
GROUP BY PROJECT.Num_P, PROJECT.Title;

--Write a query to retrieve a summary of roles employees have across different projects, including the employee name, project title, and role.
SELECT EMPLOYEE.Num_E, EMPLOYEE.Name AS Employee_Name, EMPLOYEE.Position, PROJECT.Title AS Project_Title, EMPLOYEE_PROJECT.Role
FROM EMPLOYEE
JOIN EMPLOYEE_PROJECT
ON EMPLOYEE.Num_E = EMPLOYEE_PROJECT.Num_E
JOIN PROJECT
ON EMPLOYEE_PROJECT.Num_P = PROJECT.Num_P;

--Write a query to retrieve the total salary expenditure for each department, including the department label and manager name.
SELECT DEPARTMENT.Label AS Department_Label, DEPARTMENT.Manager_Name, SUM(EMPLOYEE.Salary) AS Total_Salary_Expenditure
FROM DEPARTMENT
LEFT JOIN EMPLOYEE
ON DEPARTMENT.Num_S = EMPLOYEE.Num_S
GROUP BY DEPARTMENT.Label, DEPARTMENT.Manager_Name;

