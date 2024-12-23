USE studentinformationfact;

SELECT uf.INST_ID, ins.INST_NAME, COUNT(DISTINCT COURSE_CODE) AS COURSES_HANDLED
FROM UniversityFactTable uf
JOIN InstructorDimension ins ON ins.INST_ID = uf.INST_ID
GROUP BY INST_ID;


