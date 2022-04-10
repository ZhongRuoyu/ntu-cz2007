SELECT CategoryName
FROM Category
WHERE NOT EXISTS
        (SELECT CategoryName
         FROM Category AS C
         WHERE C.BelongsTo = Category.CategoryName );


SELECT ISBN,
       Title,
       Author,
       NoPages,
       PubYear,
       PublisherName
FROM Book
WHERE ISBN IN
        (SELECT ISBN
         FROM
             (SELECT CopyNumber,
                     ISBN
              FROM Copy
              EXCEPT SELECT Copy,
                            ISBN
              FROM Loan
              WHERE ReturnDate > CURRENT_TIMESTAMP) AS Available);


SELECT ISBN,
       Title,
       Author,
       NoPages,
       PubYear,
       PublisherName
FROM Book
WHERE NoPages > 2 *
        (SELECT AVG(NoPages)
         FROM Book);


SELECT DISTINCT Surname
FROM Reader
WHERE City = 'New York';

