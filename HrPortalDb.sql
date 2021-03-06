ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER hrportal IDENTIFIED BY hrportal;

GRANT CONNECT ,DBA TO HRPORTAL;

CREATE TABLE LOGIN_DETAILS(
USER_ID NUMBER(8),
PASSWORD VARCHAR(20) NOT NULL,
ROLE VARCHAR(20),
CONSTRAINT pk_user_id PRIMARY KEY (USER_ID)
);

SELECT*FROM LOGIN_DETAILS;
COMMIT;

INSERT INTO LOGIN_DETAILS(USER_ID,PASSWORD,ROLE) VALUES(SEQ_LOGIN_DETAILS.NEXTVAL,'PRIYANKA123','HR');
INSERT INTO LOGIN_DETAILS(USER_ID,PASSWORD,ROLE) VALUES(SEQ_LOGIN_DETAILS.NEXTVAL,'PRATAP123','PROJECT MANAGEWR');
INSERT INTO LOGIN_DETAILS(USER_ID,PASSWORD,ROLE) VALUES(SEQ_LOGIN_DETAILS.NEXTVAL,'RAHUL123','TEAM LEADER');
INSERT INTO LOGIN_DETAILS(USER_ID,PASSWORD,ROLE) VALUES(SEQ_LOGIN_DETAILS.NEXTVAL,'NITESH123','HR');
INSERT INTO LOGIN_DETAILS(USER_ID,PASSWORD,ROLE) VALUES(SEQ_LOGIN_DETAILS.NEXTVAL,'DINESH123','TEAM LEADER');
INSERT INTO LOGIN_DETAILS(USER_ID,PASSWORD,ROLE) VALUES(SEQ_LOGIN_DETAILS.NEXTVAL,'KIRAN123','INTERVIEWER');
INSERT INTO LOGIN_DETAILS(USER_ID,PASSWORD,ROLE) VALUES(SEQ_LOGIN_DETAILS.NEXTVAL,'PARAS123','PROJECT MANAGEWR');

CREATE TABLE PROJECT_DETAILS(
PROJECT_ID NUMBER(10),
PROJECT_NAME VARCHAR(20),
START_DATE DATE NOT NULL,
END_DATE DATE ,
CONSTRAINT pk_project_id PRIMARY KEY ( PROJECT_ID )
);

COMMIT;

INSERT INTO PROJECT_DETAILS(PROJECT_ID,PROJECT_NAME,START_DATE,END_DATE) VALUES(SEQ_PROJECT_DETAILS.NEXTVAL,'PAYTM','01-OCT-2021','01-JUN-2022');
INSERT INTO PROJECT_DETAILS(PROJECT_ID,PROJECT_NAME,START_DATE,END_DATE) VALUES(SEQ_PROJECT_DETAILS.NEXTVAL,'ICICI','15-NOV-2021','11-MAR-2022');
INSERT INTO PROJECT_DETAILS(PROJECT_ID,PROJECT_NAME,START_DATE,END_DATE) VALUES(SEQ_PROJECT_DETAILS.NEXTVAL,'SBI','15-FEB-2021','01-JUL-2022');

SELECT * FROM PROJECT_DETAILS
ORDER BY PROJECT_ID;

CREATE TABLE EMPLOYEE_DETAILS(
EMPLOYEE_ID NUMBER(8),
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20)NOT NULL,
CONTACT_NO NUMBER(10) NOT NULL,
DESIGNATION VARCHAR(20) ,
SALARY NUMBER(8,2),
PROJECT_ID NUMBER(10),
ADDRESS VARCHAR(20),
CITY VARCHAR(20),
STATE VARCHAR(20),
PINCODE NUMBER(6),
USER_ID NUMBER(8),
CONSTRAINT pk_employee_id PRIMARY KEY (EMPLOYEE_ID),
CONSTRAINT fk_user_id_ed FOREIGN KEY ( USER_ID )
REFERENCES LOGIN_DETAILS ( USER_ID ),
CONSTRAINT fk_project_ed FOREIGN KEY ( PROJECT_ID )
REFERENCES PROJECT_DETAILS ( PROJECT_ID )
);

INSERT INTO EMPLOYEE_DETAILS(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,CONTACT_NO,DESIGNATION,SALARY,PROJECT_ID,ADDRESS,CITY,STATE,PINCODE,USER_ID)
VALUES(SEQ_EMPLOYEE_DETAILS.NEXTVAL,'PRIYANKA','TAYDE',9874563120,'HR',25000,1,'GANDHI NAGAR','THANE','MAHARASHTRA',422074,1);

INSERT INTO EMPLOYEE_DETAILS(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,CONTACT_NO,DESIGNATION,SALARY,PROJECT_ID,ADDRESS,CITY,STATE,PINCODE,USER_ID)
VALUES(SEQ_EMPLOYEE_DETAILS.NEXTVAL,'PRATAP','BAGWE',7894563210,'PROJECT MANAGER',25000,2,'GANDHI NAGAR','THANE','MAHARASHTRA',422074,2);

INSERT INTO EMPLOYEE_DETAILS(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,CONTACT_NO,DESIGNATION,SALARY,PROJECT_ID,ADDRESS,CITY,STATE,PINCODE,USER_ID)
VALUES(SEQ_EMPLOYEE_DETAILS.NEXTVAL,'RAHUL','PATIL',1236547895,'TEAM LEADER',25000,3,'GANDHI NAGAR','THANE','MAHARASHTRA',422074,3);

INSERT INTO EMPLOYEE_DETAILS(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,CONTACT_NO,DESIGNATION,SALARY,PROJECT_ID,ADDRESS,CITY,STATE,PINCODE,USER_ID)
VALUES(SEQ_EMPLOYEE_DETAILS.NEXTVAL,'NITESH','VASAVE',0231545874,'HR',25000,1,'GANDHI NAGAR','THANE','MAHARASHTRA',422074,4);

INSERT INTO EMPLOYEE_DETAILS(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,CONTACT_NO,DESIGNATION,SALARY,PROJECT_ID,ADDRESS,CITY,STATE,PINCODE,USER_ID)
VALUES(SEQ_EMPLOYEE_DETAILS.NEXTVAL,'DINESH','ABC',02136457412,'TEAM LEADER',25000,2,'GANDHI NAGAR','THANE','MAHARASHTRA',422074,5);


INSERT INTO EMPLOYEE_DETAILS(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,CONTACT_NO,DESIGNATION,SALARY,PROJECT_ID,ADDRESS,CITY,STATE,PINCODE,USER_ID)
VALUES(SEQ_EMPLOYEE_DETAILS.NEXTVAL,'KIRAN','THAKUR',9632145874,'INTERVIEWER',25000,3,'GANDHI NAGAR','THANE','MAHARASHTRA',422074,6);


INSERT INTO EMPLOYEE_DETAILS(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,CONTACT_NO,DESIGNATION,SALARY,PROJECT_ID,ADDRESS,CITY,STATE,PINCODE,USER_ID)
VALUES(SEQ_EMPLOYEE_DETAILS.NEXTVAL,'PARAS','BAGWE',7894563210,'PROJECT MANAGER',25000,1,'GANDHI NAGAR','THANE','MAHARASHTRA',422074,7);


COMMIT;

SELECT * FROM EMPLOYEE_DETAILS;

CREATE TABLE REQUIREMENT_REQUEST_DETAILS(
REQUIREMENT_REQUEST_DETAILS_ID NUMBER(8),
PROJECT_ID NUMBER(10) NOT NULL,
SKILL1 VARCHAR(50) NOT NULL,
SKILL2 VARCHAR(50),
SKILL3 VARCHAR(50),
EXPERIENCE NUMBER(10),
VACANCIES NUMBER(3),
TEAM_LEADER_ID NUMBER(8),
STATUS VARCHAR(50) CHECK (STATUS IN('NEW','SELECTED','PENDING','INPROCESS','REJECTED')),
ROLE VARCHAR(50),
CONSTRAINT pk_requirement_request_id PRIMARY KEY (REQUIREMENT_REQUEST_DETAILS_ID),
CONSTRAINT fk_project_id_rrd FOREIGN KEY ( PROJECT_ID )
REFERENCES PROJECT_DETAILS ( PROJECT_ID ),
CONSTRAINT fk_team_leader_id_rrd FOREIGN KEY ( TEAM_LEADER_ID )
REFERENCES EMPLOYEE_DETAILS ( EMPLOYEE_ID )
);

INSERT INTO REQUIREMENT_REQUEST_DETAILS(REQUIREMENT_REQUEST_DETAILS_ID,PROJECT_ID, SKILL1, SKILL2, SKILL3, EXPERIENCE, VACANCIES, TEAM_LEADER_ID,
STATUS, ROLE) 
VALUES(SEQ_REQUIREMENT_REQUEST_DETAILS.NEXTVAL,1,'CORE JAVA','ADV JAVA','SQL',3,5,3,'NEW','JAVA DEVELOPER');

INSERT INTO REQUIREMENT_REQUEST_DETAILS(REQUIREMENT_REQUEST_DETAILS_ID,PROJECT_ID, SKILL1, SKILL2,SKILL3,EXPERIENCE, VACANCIES, TEAM_LEADER_ID,
STATUS, ROLE) VALUES(SEQ_REQUIREMENT_REQUEST_DETAILS.NEXTVAL,2,'SQL','PLSQL','ORACLE', 0,12,5,'NEW','SQL DEVELOPER');

INSERT INTO REQUIREMENT_REQUEST_DETAILS(REQUIREMENT_REQUEST_DETAILS_ID,PROJECT_ID, SKILL1,SKILL2,SKILL3, EXPERIENCE, VACANCIES, TEAM_LEADER_ID,
STATUS, ROLE) 
VALUES(SEQ_REQUIREMENT_REQUEST_DETAILS.NEXTVAL,3,'CORE JAVA','SQL','HTML',0,12,3,'NEW','TRAINEE DEVELOPER');

COMMIT;

SELECT * FROM REQUIREMENT_REQUEST_DETAILS;

DELETE FROM REQUIREMENT_REQUEST_DETAILS WHERE REQUIREMENT_REQUEST_DETAILS_ID = 10;


CREATE TABLE CANDIDATES_DETAILS(
CANDIDATE_ID NUMBER(8),
CANDIDATE_NAME VARCHAR(50),
EMAIL VARCHAR(50),
LOCATION VARCHAR(50),
SKILL1 VARCHAR(20) NOT NULL,
SKILL2 VARCHAR(20),
SKILL3 VARCHAR(20),
QUALIFICATION VARCHAR(50),
EXPERIENCE NUMBER(3),
STATUS VARCHAR(50) CHECK (STATUS IN('NEW','SELECTED','PENDING','INPROCESS','REJECTED')),
REQUIREMENT_REQUEST_DETAILS_ID NUMBER(8),
CONSTRAINT pk_candidate_id PRIMARY KEY ( CANDIDATE_ID ),
CONSTRAINT fk_requirement_request_details_id_cd FOREIGN KEY ( REQUIREMENT_REQUEST_DETAILS_ID )
REFERENCES REQUIREMENT_REQUEST_DETAILS ( REQUIREMENT_REQUEST_DETAILS_ID )
);

INSERT INTO CANDIDATES_DETAILS(CANDIDATE_ID,CANDIDATE_NAME,EMAIL,LOCATION,SKILL1,SKILL2,SKILL3,QUALIFICATION,EXPERIENCE,STATUS,REQUIREMENT_REQUEST_DETAILS_ID) VALUES(SEQ_CANDIDATES_DETAILS.NEXTVAL,'MAHIMA','MAHIMA@GMAIL.COM','THANE','CORE JAVA','ADV JAVA','SQL','BE COMPUTER',3,'NEW',1);
INSERT INTO CANDIDATES_DETAILS(CANDIDATE_ID,CANDIDATE_NAME,EMAIL,LOCATION,SKILL1,SKILL2,SKILL3,QUALIFICATION,EXPERIENCE,STATUS,REQUIREMENT_REQUEST_DETAILS_ID) VALUES(SEQ_CANDIDATES_DETAILS.NEXTVAL,'ARUNA','ARUNA@GMAIL.COM','NAVI MUMBAI','SQL','PLSQL','ORACLE','BE COMPUTER',0,'NEW',2);
INSERT INTO CANDIDATES_DETAILS(CANDIDATE_ID,CANDIDATE_NAME,EMAIL,LOCATION,SKILL1,SKILL2,SKILL3,QUALIFICATION,EXPERIENCE,STATUS,REQUIREMENT_REQUEST_DETAILS_ID) VALUES(SEQ_CANDIDATES_DETAILS.NEXTVAL,'RAVINA','RAVINA@GMAIL.COM','THANE','CORE JAVA','ADV JAVA','SPRING BOOT','BE COMPUTER',3,'NEW',1);
INSERT INTO CANDIDATES_DETAILS(CANDIDATE_ID,CANDIDATE_NAME,EMAIL,LOCATION,SKILL1,SKILL2,SKILL3,QUALIFICATION,EXPERIENCE,STATUS,REQUIREMENT_REQUEST_DETAILS_ID) VALUES(SEQ_CANDIDATES_DETAILS.NEXTVAL,'VINAYA','VINAYA@GMAIL.COM','MUMBAI','CORE JAVA','SQL','HTML','BE EXTC',0,'NEW',3);

UPDATE CANDIDATES_DETAILS SET SKILL3 = 'SQL', QUALIFICATION = 'BE COMPUTER' WHERE CANDIDATE_ID = 1;

SELECT * FROM CANDIDATES_DETAILS;

COMMIT;

CREATE TABLE INTERVIEW_DETAILS(
INTERVIEW_ID NUMBER(8), 
STATUS VARCHAR(50) CHECK (STATUS IN('NEW','SELECTED','PENDING','INPROCESS','REJECTED')),
CANDIDATE_ID NUMBER(8),
FEEDBACK VARCHAR(50),
INTERVIEWER_ID NUMBER(8),
INTERVIEW_DATE DATE,
CONSTRAINT pk_interview_id PRIMARY KEY ( INTERVIEW_ID ),
CONSTRAINT fk_candidate_id_intervied_details FOREIGN KEY ( CANDIDATE_ID )
REFERENCES CANDIDATES_DETAILS ( CANDIDATE_ID ),
CONSTRAINT fk_interviewer_id_intervied_details FOREIGN KEY ( INTERVIEWER_ID )
REFERENCES EMPLOYEE_DETAILS ( EMPLOYEE_ID )
);

COMMIT;

INSERT INTO INTERVIEW_DETAILS(INTERVIEW_ID,STATUS,CANDIDATE_ID,FEEDBACK,INTERVIEWER_ID,INTERVIEW_DATE)VALUES(SEQ_INTERVIEW_DETAILS.NEXTVAL,'INPROCESS',1,'GOOD IN JAVA',6,'12-JUN-2022');
INSERT INTO INTERVIEW_DETAILS(INTERVIEW_ID,STATUS,CANDIDATE_ID,FEEDBACK,INTERVIEWER_ID,INTERVIEW_DATE)VALUES(SEQ_INTERVIEW_DETAILS.NEXTVAL,'SELECTED',2,'TECHNICAL STRONG',6,'10-JUN-2022');
INSERT INTO INTERVIEW_DETAILS(INTERVIEW_ID,STATUS,CANDIDATE_ID,FEEDBACK,INTERVIEWER_ID,INTERVIEW_DATE)VALUES(SEQ_INTERVIEW_DETAILS.NEXTVAL,'REJECTED',3,'WEAK IN SQL',6,'15-JUN-2022');
INSERT INTO INTERVIEW_DETAILS(INTERVIEW_ID,STATUS,CANDIDATE_ID,FEEDBACK,INTERVIEWER_ID,INTERVIEW_DATE)VALUES(SEQ_INTERVIEW_DETAILS.NEXTVAL,'REJECTED',4,'GOOD IN JAVA',6,'20-JUN-2022');

COMMIT;
SELECT * FROM INTERVIEW_DETAILS;


CREATE TABLE DOCUMENTS_DETAILS(
DOCUMENT_ID NUMBER(8),
DOCUMENT_TYPE VARCHAR(20),
CANDIDATE_ID NUMBER(8) NOT NULL,
DOCUMENT BLOB ,
CONSTRAINT pk_document_id PRIMARY KEY ( DOCUMENT_ID ),
CONSTRAINT fk_candidate_id_dd FOREIGN KEY ( CANDIDATE_ID )
REFERENCES CANDIDATES_DETAILS ( CANDIDATE_ID )
);

INSERT INTO DOCUMENTS_DETAILS(DOCUMENT_ID, DOCUMENT_TYPE, CANDIDATE_ID,DOCUMENT) VALUES(SEQ_DOCUMENTS_DETAILS.NEXTVAL,'PDF',1,EMPTY_BLOB());
INSERT INTO DOCUMENTS_DETAILS(DOCUMENT_ID, DOCUMENT_TYPE, CANDIDATE_ID,DOCUMENT) VALUES(SEQ_DOCUMENTS_DETAILS.NEXTVAL,'PDF',2,EMPTY_BLOB());
INSERT INTO DOCUMENTS_DETAILS(DOCUMENT_ID, DOCUMENT_TYPE, CANDIDATE_ID,DOCUMENT) VALUES(SEQ_DOCUMENTS_DETAILS.NEXTVAL,'PDF',3,EMPTY_BLOB());
INSERT INTO DOCUMENTS_DETAILS(DOCUMENT_ID, DOCUMENT_TYPE, CANDIDATE_ID,DOCUMENT) VALUES(SEQ_DOCUMENTS_DETAILS.NEXTVAL,'PDF',4,EMPTY_BLOB());



SELECT * FROM DOCUMENTS_DETAILS;

DELETE DOCUMENTS_DETAILS WHERE DOCUMENT_ID=4;

COMMIT;

DROP TABLE LOGIN_DETAILS;
DROP TABLE PROJECT_DETAILS;
DROP TABLE EMPLOYEE_DETAILS;
DROP TABLE REQUIREMENT_REQUEST_DETAILS;
DROP TABLE CANDIDATES_DETAILS;
DROP TABLE INTERVIEW_DETAILS;
DROP TABLE DOCUMENTS_DETAILS;
COMMIT;

SELECT * FROM DOCUMENTS_DETAILS; 

CREATE SEQUENCE SEQ_LOGIN_DETAILS INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_PROJECT_DETAILS INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_EMPLOYEE_DETAILS INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REQUIREMENT_REQUEST_DETAILS INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_CANDIDATES_DETAILS INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_INTERVIEW_DETAILS INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DOCUMENTS_DETAILS INCREMENT BY 1 START WITH 1;



DROP SEQUENCE SEQ_LOGIN_DETAILS;
DROP SEQUENCE SEQ_PROJECT_DETAILS;
DROP SEQUENCE SEQ_EMPLOYEE_DETAILS;
DROP SEQUENCE SEQ_REQUIREMENT_REQUEST_DETAILS;
DROP SEQUENCE SEQ_CANDIDATES_DETAILS;
DROP SEQUENCE SEQ_INTERVIEW_DETAILS;
DROP SEQUENCE SEQ_DOCUMENTS_DETAILS;



