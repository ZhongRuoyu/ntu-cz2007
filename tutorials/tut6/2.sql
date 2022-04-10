SELECT issueID,
       articleId,
       author,
       title
FROM Article
WHERE EXISTS
        (SELECT WordIs.wordText
         FROM WordAppears,
              WordIs
         WHERE WordAppears.issueID = Article.issueID
             AND WordAppears.articleID = Article.articleID
             AND WordAppears.wordID = WordIs.wordID
             AND WordIs.wordID = 'politician' )
    AND EXISTS
        (SELECT WordIs.wordText
         FROM WordAppears,
              WordIs
         WHERE WordAppears.issueID = Article.issueID
             AND WordAppears.articleID = Article.articleID
             AND WordAppears.wordID = WordIs.wordID
             AND WordIs.wordID = 'corruption' );

