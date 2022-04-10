SELECT DISTINCT Departure.destination
FROM Departure,
     Airplane,
     Model
WHERE Departure.airplaneID = Airplane.airplaneID
    AND Airplane.modelID = Model.ModelID
    AND (Model.capacity - Departure.bookedSeats) >
        (SELECT AVG(M.capacity - D.bookedSeats)
         FROM Departure AS D,
              Airplane AS A,
              Model AS M
         WHERE D.airplaneID = A.airplaneID
             AND A.modelID = M.ModelID );

