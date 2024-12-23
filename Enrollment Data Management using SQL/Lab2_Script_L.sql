USE studentInformationFact;

SELECT HS_NAME, AVG(STUD_HS_GRADE) AS AVERAGE_GRADE
FROM studentdimension
GROUP BY HS_NAME;
















