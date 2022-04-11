CREATE TRIGGER registration_Insert
BEFORE INSERT ON course
REFERENCING NEW ROW AS NewTuple
FOR EACH ROW
WHEN NOT EXISTS
    (SELECT course.course_id
     FROM course
     WHERE course.course_id = NewTuple.course_id )
BEGIN
    RAISE_EXCEPTION('FOREIGN KEY constraint was violated');
END;


CREATE TRIGGER registration_Update
BEFORE UPDATE ON course
REFERENCING NEW ROW AS NewTuple
FOR EACH ROW
WHEN NOT EXISTS
    (SELECT course.course_id
     FROM course
     WHERE course.course_id = NewTuple.course_id )
BEGIN
    RAISE_EXCEPTION('FOREIGN KEY constraint was violated');
END;


CREATE TRIGGER registration_Delete
AFTER DELETE ON course
REFERENCING OLD ROW AS OldTuple
FOR EACH ROW
WHEN NOT EXISTS
    (SELECT registration.course_id
     FROM registration
     WHERE registration.course_id = OldTuple.course_id )
BEGIN
    DELETE
    FROM course
    WHERE course_id = OldTuple.course_id;
END;

