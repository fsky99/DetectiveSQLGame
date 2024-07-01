USE DectectiveSQLGame ;

-- to find the country
SELECT Dates.COUNTRY_ID , Countries.ID ,
 Countries.NAME  , COUNT(*) AS VISIT_NUM
FROM Dates , Countries
WHERE Dates.COUNTRY_ID = Countries.ID
GROUP BY Dates.COUNTRY_ID
ORDER BY VISIT_NUM DESC
LIMIT 1;


-- FRANCE VISITED 9 TIMES.


 
-- to find the people she met
SELECT People.PERSON_NAME , Dates.TIME_ENTERING_COUNTRY ,
Dates.VISITING_DATE FROM People JOIN Dates ON 
People.COUNTRY_ID =  Dates.COUNTRY_ID WHERE 
Dates.TIME_ENTERING_COUNTRY  = '10:00:00' AND
 People.COUNTRY_ID  = 14;


 -- 'Benjamin Turner', '10:00:00', '2023-01-05'
-- 'John Doe', '10:00:00', '2023-01-05'


-- to find the city
SELECT CITY_NAME FROM Cities WHERE COUNTRY_ID = 
(SELECT COUNTRY_ID FROM Countries WHERE NAME ='France') 
AND CITY_NAME LIKE 'P%s';

-- Paris

-- to find the artifact
SELECT Artifacts.ARTIFACT_NAME , Artifacts.VALUE_OF_ARTIFACT,
People.PERSON_NAME FROM Artifacts JOIN People ON 
People.ID = Artifacts.BELONG_TO AND Artifacts.ARTIFACT_NAME LIKE 'Paris%';



-- ARTIFACT_NAME : Paris Gold	
-- VALUE_OF_ARTIFACT :2400	
-- PERSON_NAME : Benjamin Turner