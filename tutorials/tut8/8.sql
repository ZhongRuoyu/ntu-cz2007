CREATE ASSERTION CHECK (
    NOT EXISTS
            (SELECT customer_name
             FROM ACCOUNT_OWNERS
             GROUP BY customer_name
             HAVING COUNT(*) > 5
             INTERSECT SELECT ACCOUNT_OWNERS.customer_name
             FROM ACCOUNT_OWNERS,
                 ACCOUNTS
             WHERE ACCOUNT_OWNERS.account_number = ACCOUNTS.account_number
             GROUP BY ACCOUNT_OWNERS.customer_name
             HAVING SUM(ACCOUNTS.balance) <= 50000)
);

