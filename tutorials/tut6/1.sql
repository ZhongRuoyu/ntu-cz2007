SELECT PROF.Pname
FROM PROF,
     DEPT
WHERE PROF.Dname = DEPT.Dname
    AND DEPT.Numphds < 50;


SELECT STUDENT.Sname,
       MAJOR.Dname
FROM STUDENT,
     MAJOR,
     ENROLL,
     COURSE
WHERE STUDENT.Sid = MAJOR.Sid
    AND STUDENT.Sid = ENROLL.Sid
    AND ENROLL.Dname = COURSE.Dname
    AND ENROLL.Cno = COURSE.Cno
    AND COURSE.Cname = 'Database System';


SELECT Sid,
       Sname,
       GPA
FROM STUDENT
WHERE NOT EXISTS
        (SELECT Dname,
                Cno
         FROM COURSE
         WHERE Dname = 'Civil Engineering'
         EXCEPT SELECT Dname,
                       Cno
         FROM ENROLL
         WHERE Dname = 'Civil Engineering'
             AND ENROLL.Sid = STUDENT.Sid );

