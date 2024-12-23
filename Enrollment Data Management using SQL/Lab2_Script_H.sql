USE studentInformationFact;

SELECT
    CASE
        WHEN RMA_ID IN ('RMA1', 'RMA5') THEN 'Blessed Pio Georgio Frassati'
        WHEN RMA_ID IN ('RMA2', 'RMA3', 'RMA4') THEN 'Main Building'
    END AS BUILDING,
    COUNT(*) AS TOTAL_CLASSES
FROM UniversityFactTable
GROUP BY BUILDING;
