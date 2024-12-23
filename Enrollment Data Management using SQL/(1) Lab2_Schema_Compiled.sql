CREATE DATABASE studentInformationFact;
USE studentInformationFact;


CREATE TABLE ProgramDimension (
PROG_CODE varchar(10) NOT NULL PRIMARY KEY, 
PROG_NAME char (50), 
PROG_DESC char(50), 
PROG_UNITS int,
PROG_TF int,  
PROG_MF int,
PROG_LF int,
PROG_PPU int,
PROG_DEPT char(50),
PROG_DEPT_CHAIR char(25)
);


INSERT INTO ProgramDimension (PROG_CODE, PROG_NAME, PROG_DESC, PROG_UNITS, PROG_TF, PROG_MF, PROG_LF, PROG_PPU, PROG_DEPT, PROG_DEPT_CHAIR) VALUES ("BSCS", "Bachelor of Science in Computer Science", "Aims to provide knowledge in Computer Science", 37, 37000, 2500, 10000, 1000, "Department of Computer Science", "Jose Rizal");
INSERT INTO ProgramDimension (PROG_CODE, PROG_NAME, PROG_DESC, PROG_UNITS, PROG_TF, PROG_MF, PROG_LF, PROG_PPU, PROG_DEPT, PROG_DEPT_CHAIR) VALUES ("BSP", "Bachelor of Science in Physics", "Aims to provide knowledge in Physics", 39, 39000, 5000, 20000, 1000, "Department of Physics", "Andres Bonifacio");
INSERT INTO ProgramDimension (PROG_CODE, PROG_NAME, PROG_DESC, PROG_UNITS, PROG_TF, PROG_MF, PROG_LF, PROG_PPU, PROG_DEPT, PROG_DEPT_CHAIR) VALUES ("BSPH", "Bachelor of Science in Pharmacy", "Aims to provide knowledge in Pharmacy", 40, 40000, 5000, 20000, 1000, "Department of Pharmacy", "Gabriela Silang");
INSERT INTO ProgramDimension (PROG_CODE, PROG_NAME, PROG_DESC, PROG_UNITS, PROG_TF, PROG_MF, PROG_LF, PROG_PPU, PROG_DEPT, PROG_DEPT_CHAIR) VALUES ("BAF", "Bachelor of Arts in Filipino", "Aims to provide knowledge in Filipino", 36, 36000, 2500, 5000, 1000, "Department of Filipino", "Selena Gomez");
INSERT INTO ProgramDimension (PROG_CODE, PROG_NAME, PROG_DESC, PROG_UNITS, PROG_TF, PROG_MF, PROG_LF, PROG_PPU, PROG_DEPT, PROG_DEPT_CHAIR) VALUES ("BAL", "Bachelor of Arts in Literature", "Aims to provide knowledge in Literature", 37, 37000, 2500, 5000, 1000, "Department of Literature", "Gregorio Pilar");
INSERT INTO ProgramDimension (PROG_CODE, PROG_NAME, PROG_DESC, PROG_UNITS, PROG_TF, PROG_MF, PROG_LF, PROG_PPU, PROG_DEPT, PROG_DEPT_CHAIR) VALUES ("BSPE", "Bachelor of Science in Physical Education", "Aims to provide knowledge in Physical Education", 39, 39000, 5000, 5000, 1000, "Department of Physical Education", "Melchora Aquino");
INSERT INTO ProgramDimension (PROG_CODE, PROG_NAME, PROG_DESC, PROG_UNITS, PROG_TF, PROG_MF, PROG_LF, PROG_PPU, PROG_DEPT, PROG_DEPT_CHAIR) VALUES ("BACA", "Bachelor of Arts in Communication Arts", "Aims to provide knowledge in Communication Arts", 36, 36000, 2500, 10000, 1000, "Department of Communication", "Taylor Swift");

SELECT * FROM ProgramDimension;


CREATE TABLE StudentDimension(
    STUD_NO int(10) NOT NULL PRIMARY KEY,
    STUD_FN char(100),
    STUD_MN char(20),
    STUD_LN char(50),
    STUD_GENDER char(20),
    STUD_BDAY date,
    ADDR_STREET varchar(20),
    ADDR_CITY varchar(20),
    ADDR_COUNTRY varchar(20),
    SCH_NAME varchar(35),
    SCH_TYPE varchar(20),
    HS_NAME varchar(100),
    HS_STREET varchar(100),
    HS_COUNTRY varchar(20),
    STUD_EXAM_SCORE int,
    STUD_FIRST_CHOICE varchar(10),
    STUD_SECOND_CHOICE varchar(10),
    FOREIGN KEY (STUD_FIRST_CHOICE) REFERENCES ProgramDimension(PROG_CODE),
    FOREIGN KEY (STUD_SECOND_CHOICE) REFERENCES ProgramDimension(PROG_CODE),
    STUD_HS_GRADE int,
    STUD_MOTHER varchar(25),
    STUD_FATHER varchar(25),
    STUD_FAM_INCOME int,
    STUD_ADM_YR int,
    STUD_ADM_SEM varchar(15),
    STUD_CURR_VER int
);

INSERT INTO StudentDimension(STUD_NO, STUD_FN, STUD_MN, STUD_LN, STUD_GENDER, STUD_BDAY,ADDR_STREET, ADDR_CITY, ADDR_COUNTRY, SCH_NAME,SCH_TYPE,HS_NAME,HS_STREET,HS_COUNTRY, STUD_EXAM_SCORE, STUD_FIRST_CHOICE, STUD_SECOND_CHOICE, STUD_HS_GRADE, STUD_MOTHER, STUD_FATHER, STUD_FAM_INCOME, STUD_ADM_YR, STUD_ADM_SEM, STUD_CURR_VER) VALUES (1, 'Sandra', 'Rodrigo', 'Bullok', 'Female', '1980-11-13',  'Navarra Street', 'Quezon City', 'Philippines', "Entrance Merit Scholarship", "Merit-based", 'Mataas na Paaralan ng Mababang Bundok', 'Mababang Bundok Street', 'Philippines', 92, "BSPH", "BSCS", 92, "Elsa H. Rodrigo", "Narcisco A. Bullok", 1000000, 2001, "1st Semester", 1996);
INSERT INTO StudentDimension(STUD_NO, STUD_FN, STUD_MN, STUD_LN, STUD_GENDER, STUD_BDAY,ADDR_STREET, ADDR_CITY, ADDR_COUNTRY, SCH_NAME,SCH_TYPE,HS_NAME,HS_STREET,HS_COUNTRY, STUD_EXAM_SCORE, STUD_FIRST_CHOICE, STUD_SECOND_CHOICE, STUD_HS_GRADE, STUD_MOTHER, STUD_FATHER, STUD_FAM_INCOME, STUD_ADM_YR, STUD_ADM_SEM, STUD_CURR_VER) VALUES (2, 'Whammy', 'Hieu', 'Jackman', 'Male', '2002-01-02',  'Espana Avenue', 'Quezon City', 'Philippines', "POEA Scholarship", 'Needs-based', 'Mataas na Paaralan ng Mababang Bundok', 'Mababang Bundok Street', 'Philippines', 77, "BSP", "BSCS", 80, "Tran A. Hieu", "Hugh C. Jackman", 250000, 2001, "1st Semester", 1996);
INSERT INTO StudentDimension(STUD_NO, STUD_FN, STUD_MN, STUD_LN, STUD_GENDER, STUD_BDAY,ADDR_STREET, ADDR_CITY, ADDR_COUNTRY, SCH_NAME,SCH_TYPE,HS_NAME,HS_STREET,HS_COUNTRY, STUD_EXAM_SCORE, STUD_FIRST_CHOICE, STUD_SECOND_CHOICE, STUD_HS_GRADE, STUD_MOTHER, STUD_FATHER, STUD_FAM_INCOME, STUD_ADM_YR, STUD_ADM_SEM, STUD_CURR_VER) VALUES (3, 'Olivia', 'Rodrigo', 'Durerte', 'Female', '1990-03-13', 'P. Florentino Street', 'Manila City', 'Philippines', "DOST Scholarship", "Merit-based",  'Mataas na Paaralan ng Lungsod ng Maynila', 'Mababang Bundok Street', 'Philippines', 80, "BSP", "BSPE", 98, "Elsa H. Rodrigo", "Rudy E. Duterte", 335000, 2002, "1st Semester", 2001);
INSERT INTO StudentDimension(STUD_NO, STUD_FN, STUD_MN, STUD_LN, STUD_GENDER, STUD_BDAY,ADDR_STREET, ADDR_CITY, ADDR_COUNTRY, SCH_NAME,SCH_TYPE,HS_NAME,HS_STREET,HS_COUNTRY, STUD_EXAM_SCORE, STUD_FIRST_CHOICE, STUD_SECOND_CHOICE, STUD_HS_GRADE, STUD_MOTHER, STUD_FATHER, STUD_FAM_INCOME, STUD_ADM_YR, STUD_ADM_SEM, STUD_CURR_VER) VALUES (4, 'Taylor', 'Lautner', 'Sheesh', 'Non-Binary', '1995-06-10', 'Bagumbuhay Street', 'Manila City', 'Philippines',  "No Scholarship", "Not applicable", 'International School of the National Artistic Arts University', 'International Street', 'Philippines', 84, "BAF", "BACA", 70, "Margeary Z. Lautner", "Tom Z. Sheesh", 2600000, 2002, "1st Semester", 2001);
INSERT INTO StudentDimension(STUD_NO, STUD_FN, STUD_MN, STUD_LN, STUD_GENDER, STUD_BDAY,ADDR_STREET, ADDR_CITY, ADDR_COUNTRY, SCH_NAME,SCH_TYPE,HS_NAME,HS_STREET,HS_COUNTRY, STUD_EXAM_SCORE, STUD_FIRST_CHOICE, STUD_SECOND_CHOICE, STUD_HS_GRADE, STUD_MOTHER, STUD_FATHER, STUD_FAM_INCOME, STUD_ADM_YR, STUD_ADM_SEM, STUD_CURR_VER) VALUES (5, 'Zendaya', 'Holland', 'Park', 'Female', '1992-09-10', 'Matalino Street', 'Makati City', 'Philippines',  "No Scholarship", "Not applicable",  'International School of the National Artistic Arts University', 'International Street', 'Philippines', 90, "BSCS", "BAF", 75, "Alexandra X. Holland", "Jing-nae Park", 15000000, 2002, "1st Semester", 2001);
INSERT INTO StudentDimension(STUD_NO, STUD_FN, STUD_MN, STUD_LN, STUD_GENDER, STUD_BDAY,ADDR_STREET, ADDR_CITY, ADDR_COUNTRY, SCH_NAME,SCH_TYPE,HS_NAME,HS_STREET,HS_COUNTRY, STUD_EXAM_SCORE, STUD_FIRST_CHOICE, STUD_SECOND_CHOICE, STUD_HS_GRADE, STUD_MOTHER, STUD_FATHER, STUD_FAM_INCOME, STUD_ADM_YR, STUD_ADM_SEM, STUD_CURR_VER) VALUES (6, 'Zack', 'Tabudlo', 'Apron', 'Male', '2001-12-01', 'Maginhawa Street', 'Makati City', 'Philippines', "DOST Scholarship", "Needs-based",  'Mataas na Paaralan ng Mababang Bundok', 'Mababang Bundok Street', 'Philippines', 95, "BSCS", "BAF", 90, "Matutina P. Tabudlo", "Keech N. Apron", 150000, 2002, "1st Semester", 2001);
INSERT INTO StudentDimension(STUD_NO, STUD_FN, STUD_MN, STUD_LN, STUD_GENDER, STUD_BDAY,ADDR_STREET, ADDR_CITY, ADDR_COUNTRY, SCH_NAME,SCH_TYPE,HS_NAME,HS_STREET,HS_COUNTRY, STUD_EXAM_SCORE, STUD_FIRST_CHOICE, STUD_SECOND_CHOICE, STUD_HS_GRADE, STUD_MOTHER, STUD_FATHER, STUD_FAM_INCOME, STUD_ADM_YR, STUD_ADM_SEM, STUD_CURR_VER) VALUES (7, 'Ariana', 'Falls', 'Venti', 'Female', '1987-02-14', "L'oreal Street", 'Makati City', 'Philippines', "No Scholarship", "Not applicable", 'International School of the National Artistic Arts University', 'International Street', 'Philippines', 92, "BAL", "BSPH", 92, "Baga T. Falls", "Cinoc H. Venti", 7000000, 2001, "1st Semester", 2001);

SELECT * FROM StudentDimension;



CREATE TABLE CollegeDimension(
COLLEGE_CODE varchar(10) NOT NULL PRIMARY KEY,
COLLEGE_NAME varchar(50),
COLLEGE_BLDG varchar(35),
COLLEGE_DEAN varchar(35)
);
INSERT INTO CollegeDimension(COLLEGE_CODE, COLLEGE_NAME, COLLEGE_BLDG, COLLEGE_DEAN) VALUES ("CICS", "College of Information and Computing Sciences", "Blessed Pio Georgio Frassati", "Juan Luna");
INSERT INTO CollegeDimension(COLLEGE_CODE, COLLEGE_NAME, COLLEGE_BLDG, COLLEGE_DEAN) VALUES ("COS", "College of Science", "Main Building", "Apolinario Mabini");
INSERT INTO CollegeDimension(COLLEGE_CODE, COLLEGE_NAME, COLLEGE_BLDG, COLLEGE_DEAN) VALUES ("COE", "College of Education", "Albertus Magnus", "Cecil Jose Delfinado");
INSERT INTO CollegeDimension(COLLEGE_CODE, COLLEGE_NAME, COLLEGE_BLDG, COLLEGE_DEAN) VALUES ("FAL", "Faculty of Arts and Letters", "Raymund de Peñafort", "Perla Cosme");
INSERT INTO CollegeDimension(COLLEGE_CODE, COLLEGE_NAME, COLLEGE_BLDG, COLLEGE_DEAN) VALUES ("IPEA", "Institute of Physical Education", "Quadricentennial Pavilion", "Jessie James Suarez");

SELECT * FROM CollegeDimension;


CREATE TABLE RoomAssignmentDimension(
	RMA_ID varchar(10) NOT NULL PRIMARY KEY,
    RMA_BLDG varchar(100),
    RMA_ROOM varchar(10)
);

INSERT INTO RoomAssignmentDimension(RMA_ID, RMA_BLDG, RMA_ROOM) VALUES ('RMA1', 'Blessed Pio Georgio Frassati', 'Room A');
INSERT INTO RoomAssignmentDimension(RMA_ID, RMA_BLDG, RMA_ROOM) VALUES ('RMA2', 'Main Building', 'Room B');
INSERT INTO RoomAssignmentDimension(RMA_ID, RMA_BLDG, RMA_ROOM) VALUES ('RMA3', 'Main Building', 'Room C');
INSERT INTO RoomAssignmentDimension(RMA_ID, RMA_BLDG, RMA_ROOM) VALUES ('RMA4', 'Main Building', 'Field A');
INSERT INTO RoomAssignmentDimension(RMA_ID, RMA_BLDG, RMA_ROOM) VALUES ('RMA5', 'Blessed Pio Georgio Frassati', 'Room D');


CREATE TABLE CourseDimension(
COURSE_CODE varchar(10) NOT NULL PRIMARY KEY,
COURSE_NAME varchar(50),
COURSE_UNITS int,
COURSE_DESC varchar(35),
COURSE_PREREQ varchar(10),
COURSE_TYPE varchar(20),
COURSE_GRP varchar(20),
COURSE_SEM varchar(20),
COURSE_SY int
);

INSERT INTO CourseDimension(COURSE_CODE, COURSE_NAME, COURSE_UNITS  , COURSE_DESC, COURSE_PREREQ, COURSE_TYPE, COURSE_GRP, COURSE_SEM, COURSE_SY ) VALUES ("CS110", "Theory of Computation", 3, "Studies the theory of computation", "CS109", "Lecture", "Professional", "1st Semester", 2002);
INSERT INTO CourseDimension(COURSE_CODE, COURSE_NAME, COURSE_UNITS  , COURSE_DESC, COURSE_PREREQ, COURSE_TYPE, COURSE_GRP, COURSE_SEM, COURSE_SY ) VALUES ("PHYS110", "Statistical Mechanics", 3, "Studies statistical mechanics", "PHYS109", "Laboratory", "Professional", "2nd Semester", 2002);
INSERT INTO CourseDimension(COURSE_CODE, COURSE_NAME, COURSE_UNITS  , COURSE_DESC, COURSE_PREREQ, COURSE_TYPE, COURSE_GRP, COURSE_SEM, COURSE_SY ) VALUES ("PHYS112", "Quantum Mechanics", 3, "Studies quantum mechanics", "PHYS111", "Lecture", "Professional", "1st Semester", 2001);
INSERT INTO CourseDimension(COURSE_CODE, COURSE_NAME, COURSE_UNITS  , COURSE_DESC, COURSE_PREREQ, COURSE_TYPE, COURSE_GRP, COURSE_SEM, COURSE_SY ) VALUES ("CS109", "Algorithms and Complexity", 3, "Studies algorithms and complexity", "CS108", "Lecture", "Professional", "1st Semester", 2001);
INSERT INTO CourseDimension(COURSE_CODE, COURSE_NAME, COURSE_UNITS  , COURSE_DESC, COURSE_PREREQ, COURSE_TYPE, COURSE_GRP, COURSE_SEM, COURSE_SY ) VALUES ("PE4", "Physical Education 4", 3, "Studies Physical Education", "PE3", "Laboratory", "General", "2nd Semester", 2001);
INSERT INTO CourseDimension(COURSE_CODE, COURSE_NAME, COURSE_UNITS  , COURSE_DESC, COURSE_PREREQ, COURSE_TYPE, COURSE_GRP, COURSE_SEM, COURSE_SY ) VALUES ("RW2", "Works of Rizal", 3, "Studies the Works of Rizal", "RW1", "Lecture", "General", "2nd Semester", 2001);
INSERT INTO CourseDimension(COURSE_CODE, COURSE_NAME, COURSE_UNITS  , COURSE_DESC, COURSE_PREREQ, COURSE_TYPE, COURSE_GRP, COURSE_SEM, COURSE_SY ) VALUES ("FIL23", "Filipino Literature", 3, "Studies Philippine Literature", "CS109", "Lecture", "General", "2nd Semester", 2003);



CREATE TABLE InstructorDimension (
    INST_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    INST_NAME VARCHAR(50)
);

INSERT INTO InstructorDimension (INST_ID, INST_NAME) VALUES ('HY', 'Henry Yrneh');
INSERT INTO InstructorDimension (INST_ID, INST_NAME) VALUES ('AS', 'Albus Subla');
INSERT INTO InstructorDimension (INST_ID, INST_NAME) VALUES ('AT', 'Albert Trebla');
INSERT INTO InstructorDimension (INST_ID, INST_NAME) VALUES ('JE', 'Josie Eisoj');
INSERT INTO InstructorDimension (INST_ID, INST_NAME) VALUES ('ME', 'Madeline Eniledam');

SELECT * FROM InstructorDimension ;


CREATE TABLE UniversityFactTable(
    STUD_NO int(10),
    PROG_CODE varchar(10),
    COLLEGE_CODE varchar(10),
    COURSE_CODE varchar(10),
    RMA_ID varchar(10),
    INST_ID varchar(10),
    FOREIGN KEY (STUD_NO) REFERENCES StudentDimension(STUD_NO),
    FOREIGN KEY (PROG_CODE) REFERENCES ProgramDimension(PROG_CODE),
    FOREIGN KEY (COLLEGE_CODE) REFERENCES CollegeDimension(COLLEGE_CODE),  
    FOREIGN KEY (COURSE_CODE) REFERENCES CourseDimension(COURSE_CODE),
    FOREIGN KEY (RMA_ID) REFERENCES RoomAssignmentDimension(RMA_ID),
    FOREIGN KEY (INST_ID) REFERENCES InstructorDimension(INST_ID)
);

INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (1, 'BSCS', 'CICS', 'CS110', 'RMA1', 'HY');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (1, 'BSCS', 'CICS', 'FIL23', 'RMA5', 'JE');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (2, 'BSP', 'COS', 'PHYS110', 'RMA2', 'AT');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (2, 'BSP', 'COS', 'PHYS112', 'RMA3', 'AT');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (2, 'BSP', 'COS', 'PHYS112', 'RMA2', 'AT');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (3, 'BSCS', 'CICS', 'CS110', 'RMA1', 'HY');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (3, 'BSCS', 'CICS', 'CS109', 'RMA1', 'HY');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (4, 'BSP', 'COS', 'PHYS110', 'RMA2', 'AT');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (5, 'BSCS', 'CICS', 'CS110', 'RMA1', 'HY');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (6, 'BSP', 'COS', 'PHYS110', 'RMA2', 'ME');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (6, 'BSP', 'COS', 'PE4', 'RMA4', 'AS');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID) VALUES (7, 'BSCS', 'CICS', 'CS110', 'RMA1', 'HY');
INSERT INTO UniversityFactTable(STUD_NO,PROG_CODE, COLLEGE_CODE, COURSE_CODE, RMA_ID, INST_ID)VALUES (7, 'BSCS', 'CICS', 'RW2', 'RMA5', 'HY');


SELECT * FROM UniversityFactTable;





