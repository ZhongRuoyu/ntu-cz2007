SELECT DISTINCT citedArticleID,
                citedIssueID
FROM Citation
WHERE (citedArticleID,
       citedIssueID) =
        (SELECT citedArticleID,
                citedIssueID
         FROM Citation
         GROUP BY citedArticleID,
                  citedIssueID
         ORDER BY COUNT(*) DESC
         LIMIT 1);


SELECT Article.author,
       COUNT(*)
FROM Article,
     Citation
WHERE Article.issueID = Citation.citedIssueID
    AND Article.articleID = Citation.citedArticleID
    AND Article.author IN (
    SELECT DISTINCT Article.author
    FROM Article,
         Issue WHERE Article.issueID = Issue.issueID
    AND Issue.date < CURRENT_DATE - INTERVAL 10 YEAR;

)
GROUP BY Article.author;

