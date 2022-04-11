CREATE ASSERTION NoRedAndGreen CHECK (
    NOT EXISTS
            (SELECT Catalog.sid
             FROM Catalog,
                  Parts
             WHERE Catalog.pid = Parts.pid
                 AND Parts.color = 'red'
             INTERSECT SELECT Catalog.sid
             FROM Catalog,
                  Parts
             WHERE Catalog.pid = Parts.pid
                 AND Parts.color = 'green' )
);


CREATE ASSERTION NoLowerPrice CHECK (
    NOT EXISTS
            (SELECT C1.pid
             FROM Catalog AS C1,
                  Catalog AS C2
             WHERE C1.sid = 1
                 AND C2.sid <> 1
                 AND C1.pid = C2.pid
                 AND C1.price > C2.price )
);

