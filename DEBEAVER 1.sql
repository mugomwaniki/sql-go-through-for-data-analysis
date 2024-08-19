
--see the content of the database
SELECT * FROM 
dataset_1;

-- see the firt 10 rows of the dataset
SELECT * FROM 
dataset_1
LIMIT 10;

-- get unique value from a column where we use DISTINCT keyword

SELECT DISTINCT temperature
FROM 
dataset_1

--WHERE CLAUSE
SELECT * FROM 
dataset_1
WHERE passanger ='Alone'
AND weather ='sunny'
AND destination ='home';

--using ORDER BY
SELECT * FROM 
dataset_1
ORDER BY car
LIMIT 50;
--Aliasing  changing the column name
SELECT passanger AS 'The traveller'
from
dataset_1;

--group by
SELECT  occupation FROM dataset_1 
GROUP BY occupation; 

--average
SELECT  destination , avg(temperature) 
AS 'avg temperature',SUM(temperature) AS 'sum tempareture'
FROM dataset_1 d 
ORDER BY weather;

--max and min
 SELECT MAX(temperature) 
 FROM 
 dataset_1 d 
 
 --min
  SELECT MIN(temperature) AS 'min temp'
 FROM 
 dataset_1 d 
 GROUP BY weather
 
 --halving (another term for group by)
 
 SELECT occupation 
 FROM 
 dataset_1 d 
 GROUP BY occupation 
  HAVING  occupation ='student';
 
 --COMBINING DATA
 --JOINS AND UNIONS
 
 --UNION
 
 SELECT *
 FROM 
 dataset_1 
 UNION
 SELECT *
 FROM 
 table_to_union; 

SELECT DISTINCT DESTINATION 
FROM 
dataset_1 d 
 
--TO PROVE THE UNION

SELECT DISTINCT DESTINATION 
FROM 
  (SELECT *
 FROM 
 dataset_1 
 UNION
 SELECT *
 FROM 
 table_to_union);

--JOINS
SELECT  * 
FROM  table_to_join ttj;

--LEFT JOIN

SELECT Destination,D.time,ttj.part_of_day 
from dataset_1 d 
left join table_to_join ttj 
on d.time = ttj.time
LIMIT 10;


--advanced quering
--filtering or wildcards
--1 LIKE
SELECT * FROM 
dataset_1 d 
WHERE  weather LIKE 'sun%' --outputs where the weather is sunny

--2 BETWEEN

SELECT DISTINCT temperature
from dataset_1 d 
WHERE temperature BETWEEN 24 and 75;

--IN

SELECT occupation 
FROM dataset_1 d 
WHERE occupation IN ('Sales & Related','Management');

--ADVANCED AGGREGATION
--WINDOW FUNCTIONS
--OVER AND PARTITION BY 

SELECT destination,weather,
AVG(temperature)OVER (PARTITION BY weather)AS 'avg_temp_by_weather'
FROM dataset_1 d;

--ROW NUMBER
SELECT 
  destination,
  weather,
  ROW_NUMBER () over(PARTITION BY weather ORDER BY destination)
  FROM  dataset_1 d;
 
 --RANK
 SELECT 
  destination,
  weather,
  RANK () over(PARTITION BY weather ORDER BY destination)
  AS 'Avg_temp-by weather'
  FROM  dataset_1 d;
 
 --DENSE_RANK
 SELECT 
  destination,
  weather,
  DENSE_RANK() over(PARTITION BY weather ORDER BY destination)
  AS 'Avg_temp-by weather'
  FROM  dataset_1 d;
 
 --N-TILE
 SELECT time,NTILE (50) OVER (ORDER BY time)
 FROM dataset_1 d;

---LAG
SELECT destination, time,LAG(row_count,1,'9999')
OVER (ORDER BY row_count) AS 'Lagged count'
from 
dataset_1;

--LEAD
SELECT destination, time,LEAD(row_count,1,'9999')
OVER (ORDER BY row_count) AS 'Lead count'
from 
dataset_1;




