-- Write your query below
SELECT DISTINCT li1.account_id
FROM log_info li1
INNER JOIN log_info li2
    ON li1.account_id = li2.account_id
    AND li1.login <= li2.logout
    AND li1.logout >= li2.login
    AND li1.ip_address != li2.ip_address;
