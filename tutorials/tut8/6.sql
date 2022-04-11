CREATE TRIGGER UpdateSpecialExams
BEFORE INSERT ON registeredFor
FOR EACH ROW BEGIN
DECLARE clash CHAR(2);
SELECT Exams.examTime INTO clash
FROM Exams,
     registeredFor
WHERE Exams.course = registeredFor.course
    AND Exams.examDate = registeredFor.examDate
    AND registeredFor.student = NEW.student
    AND Exams.course <> NEW.course
    AND Exams.examDate = NEW.examDate
    AND Exams.examTime =
        (SELECT examTime
         FROM Exams
         WHERE Exams.course = NEW.course
             AND Exams.examDate = NEW.examDate );
IF clash IS NOT NULL THEN
    INSERT INTO SpecialExams
    VALUES (NEW.student,
            NEW.course,
            NEW.examDate,
            CASE
                WHEN clash = 'AM' THEN 'PM'
                WHEN clash = 'PM' THEN 'AM'
                ELSE NULL
            END);
END IF;
END;

