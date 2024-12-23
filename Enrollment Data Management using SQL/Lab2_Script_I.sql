USE studentInformationFact;

SELECT 
    CASE 
        WHEN SCH_NAME = 'No Scholarship' THEN 'No Scholarship'
        ELSE CONCAT(SCH_NAME, ' - ', SCH_TYPE)
    END AS SCHOLARSHIP,
    AVG(STUD_FAM_INCOME) AS AVE_INCOME_PER_SCH
FROM StudentDimension
WHERE SCH_NAME != 'No Scholarship'
GROUP BY Scholarship;