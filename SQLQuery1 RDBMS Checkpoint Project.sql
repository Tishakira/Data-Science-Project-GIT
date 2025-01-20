--CREATING WINE TABLE
CREATE TABLE
WINE(Num_W INT PRIMARY KEY, Category VARCHAR(255), Year CHAR(4), Degree DECIMAL(4,2));

--CREATING PRODUCER TABLE
CREATE TABLE PRODUCER
(Num_P INT PRIMARY KEY, First_Name VARCHAR(255),Last_Name VARCHAR(255), Region VARCHAR(255));

--CREATING HARVEST TABLE
CREATE TABLE HARVEST
(Num_W INT FOREIGN KEY REFERENCES WINE(Num_W), Num_P INT FOREIGN KEY REFERENCES PRODUCER(Num_P), Quantity INT);

--INSERTING DATA INTO WINE TABLE
INSERT INTO WINE VALUES
(1,'Red',2010,5 ),
(2,'White',2012,7),
(3,'Rose', 2020,4),
(4,'White', 2021,10),
(5,'Red', 2022, 11),
(6, 'Sparkling', 2009, 6),
(7, 'Rose', 2018,5),
(8,'Sparkling', 2020,14),
(9,'White',2023,6),
(10, 'White',2022,15),
(11, 'Red', 2019, 13),
(12,'Sparkling', 2010, 4),
(13,'White', 2010, 6),
(14, 'Red',2012, 5),
(15, 'White', 2014,12 );


--INSERTING INTO PRODUCERS TABLE
INSERT INTO PRODUCER VALUES
(1,'Boluwatife', 'Williams', 'Sousse'),
(2,'Eniola', 'Fadairo', 'Tunis'),
(3,'Yinka', 'Arogundade', 'Sfax'),
(4,'Fisola', 'Shittu', 'Dallas'),
(5,'Seyi', 'Akinsanya', 'Ottawa'),
(6, 'Lasisi', 'Ameenat', 'Monastir'),
(7,'Bolu', 'Phillips', 'Sfax'),
 (8, 'Fego', 'Joseph', 'Sousse'),
 (9,'Binta', 'Whesu','Sfax'),
 (10, 'Caroline', 'Yusuf', 'Sousse'),
 (11, 'Ibrahim', 'Azeez', 'Dallas'),
 (12, 'Amirion', 'Afeez', 'Tunis'),
 (13, 'Feranmi', 'Micheal','Sousse'),
 (14,'Keeran', 'Doe', 'Tunis'),
 (15, 'Emily', 'Red', 'Dallas');

 --INSERTING INT0 HARVEST TABLE
 INSERT INTO HARVEST VALUES
 (1, 4, 200),
 (2, 2, 250),
 (3, 10, 300),
 (4, 7, 350),
 (5, 1, 400),
 (6, 2, 150),
 (7, 3, 200),
 (8, 12, 180),
 (3, 15, 205),
 (9, 5, 230),
 (10, 6, 210),
 (11, 14, 290),
 (12, 11, 280),
 (13, 8, 159),
 (14, 9, 270);

 --Retrieve all producers.
 SELECT*FROM PRODUCER;

 --Retrieve a sorted list of producers by name.
 SELECT *FROM PRODUCER
ORDER BY Last_Name, First_Name;

--Retrieve producers from Sousse.
SELECT*FROM PRODUCER
WHERE Region = 'Sousse';

--Calculate the total quantity of wine produced for Wine Number 12.
SELECT*FROM HARVEST
SELECT SUM(Quantity) AS Total_Quantity_Produced
FROM HARVEST
WHERE Num_W =12;

--Calculate the total quantity of wine produced for each category.
SELECT WINE.Category, SUM(HARVEST.Quantity) AS Total_Quantity
FROM WINE
JOIN HARVEST
ON WINE.Num_W = HARVEST.Num_W
GROUP BY WINE.Category
ORDER BY Category;

--Find producers from Sousse who harvested at least one wine in quantities greater than 300 liters.
SELECT PRODUCER.Num_P, PRODUCER.Last_Name, PRODUCER.First_Name,PRODUCER.Region, HARVEST.Quantity
FROM PRODUCER
JOIN HARVEST
ON PRODUCER.Num_P = HARVEST.Num_P
WHERE Region = 'Sousse' AND  Quantity > 300;

--List wine numbers with a degree greater than 12, produced by a specific producer.
SELECT WINE.Num_W,PRODUCER.Last_Name, PRODUCER.First_Name
FROM WINE
JOIN HARVEST
ON WINE.Num_W = HARVEST.Num_W
JOIN PRODUCER
ON HARVEST.Num_P = PRODUCER.Num_P
WHERE Degree >12 AND PRODUCER.Last_Name = 'Doe'AND PRODUCER.First_Name = 'Keeran';

--Find the producer who has produced the highest quantity of wine.
SELECT PRODUCER.Num_P, PRODUCER.Last_Name, PRODUCER.First_Name, SUM(Quantity) AS Quantity_OF_Wine
FROM PRODUCER
JOIN HARVEST
ON PRODUCER.Num_P = HARVEST.Num_P
GROUP BY PRODUCER.Num_P, PRODUCER.Last_Name,PRODUCER.First_Name
HAVING SUM(Quantity) = (SELECT TOP 1 SUM(Quantity) AS Highest_Quantity_OF_Wine FROM HARVEST
GROUP BY Num_P
ORDER BY Highest_Quantity_OF_Wine DESC);


--Calculate the average degree of wine produced.
SELECT AVG(Degree) AS Average_Degree_of_Wine_Produced
FROM WINE;

--Find the oldest wine in the database.
SELECT * FROM WINE
WHERE Year = (SELECT MIN(Year) FROM WINE);


--Retrieve a list of producers along with the total quantity of wine they have produced.
SELECT PRODUCER.Num_P, PRODUCER.Last_Name, PRODUCER.First_Name, SUM(Quantity) AS Total_Quantity_Produced
FROM PRODUCER
JOIN HARVEST
ON PRODUCER.Num_P = HARVEST.Num_P
GROUP BY PRODUCER.Num_P, PRODUCER.Last_Name, PRODUCER.First_Name
ORDER BY Total_Quantity_Produced DESC;

--Retrieve a list of wines along with their producer details.
SELECT HARVEST.Num_W, PRODUCER.Num_P, PRODUCER.Last_Name, PRODUCER.First_Name, PRODUCER.Region
FROM HARVEST
JOIN PRODUCER
ON HARVEST.Num_P = PRODUCER.Num_P
ORDER BY Num_W;

