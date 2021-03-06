CREATE VIEW  V_CLIENT_HAS_INSTRUCTOR
AS
    SELECT CLIENT.FNAME AS CLIEN_NAME,CLIENT.LNAME AS CLIENT_SURNAME,
           INSTRUCTOR.FNAME AS INSTRUCTOR_NAME,INSTRUCTOR.LNAME AS INSTUCTOR_SURNAME
     FROM CLIENT,INSTRUCTOR
     WHERE INSTRUCTOR.EGN=INSTRUCTOR_EGN AND (INSTRUCTOR_EGN IS NOT NULL);
----------------------------------------------------------------------------------------
CREATE VIEW V_CLIENT_HAS_CARD_FOR_PERIOD
AS
    SELECT CLIENT.FNAME AS CLIEN_NAME,CLIENT.LNAME AS CLIENT_SURNAME, START_DATE,END_DATE
    FROM CLIENT, CARD
    WHERE PHONE_CLIENT=PHONE AND START_DATE IS NOT NULL AND END_DATE IS NOT NULL;
--------------------------------------------------------------------------------------------
CREATE  VIEW V_CARD_REMINDER
AS
     SELECT CLIENT.FNAME AS CLIEN_NAME,CLIENT.LNAME AS CLIENT_SURNAME, CLIENT.PHONE
     FROM CLIENT, CARD
     WHERE CARD.END_DATE- CURRENT_DATE =1 AND  CARD.PHONE_CLIENT=CLIENT.PHONE;

---------------------------------------------------------------------------------------------
CREATE VIEW  V_TOP_INSTRUCTOR
AS
SELECT FNAME, LNAME, TYPE
FROM INSTRUCTOR
WHERE SALARY >= (SELECT MAX(SALARY) AS SALARY
                 FROM INSTRUCTOR);

--------------------------------------------------------------------------------------------------
CREATE VIEW V_CREATE_CARD_COUNT
AS
    SELECT RECEPTIONIST.FNAME,RECEPTIONIST.LNAME,  COUNT (RECEPTIONIST_EGN) AS COUNT
        FROM RECEPTIONIST,CARD
        WHERE EGN=RECEPTIONIST_EGN
        GROUP BY FNAME,LNAME;
------------------------------------------------------------------------------------------------------
CREATE VIEW  V_CLIENT_USE_EQUIPMENT
AS
     SELECT CLIENT.FNAME, CLIENT.LNAME, EQUIPMENT.NAME
         FROM CLIENT,EQUIPMENT,USE
         WHERE CLIENT.PHONE=USE.PHONE_CLIENT AND EQUIPMENT.ID=USE.ID_EQUIPMENT
         GROUP BY CLIENT.FNAME, CLIENT.LNAME, EQUIPMENT.NAME;

SELECT * FROM V_CLIENT_HAS_INSTRUCTOR;
SELECT * FROM V_CLIENT_HAS_CARD_FOR_PERIOD;
SELECT * FROM V_CARD_REMINDER;
SELECT * FROM V_TOP_INSTRUCTOR;
SELECT * FROM V_CREATE_CARD_COUNT;
SELECT * FROM V_CLIENT_USE_EQUIPMENT;
