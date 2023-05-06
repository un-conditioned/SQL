https://leetcode.com/problems/count-salary-categories/

-- Not considering the edge case of zero categories
select case when income<20000 then 'Low Salary'
		    when income >= 20000 and income <=50000 then 'Average Salary'
		    when income >50000 then 'High Salary'
		end as category, count(account_id)
		from accounts 
		group by 1

--Considering zero case also 

select 'Low Salary' as category, sum(case when income<20000 then 1 else 0 end) as x from accounts group by category
UNION ALL
select 'Medium Salary' as category, sum(case when income >= 20000 and income <=50000 then 1 else 0 end) as x from accounts group by category
UNION ALL
select 'High Salary' as category, sum(case when income >50000 then 1 else 0 end) as x from accounts group by category

--Faster than using case statements to use simple statements
SELECT 'Low Salary' AS category, count(*) AS accounts_count
FROM Accounts
WHERE income <20000
UNION
SELECT 'Average Salary' AS category, count(*) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000
UNION
SELECT 'High Salary' AS category, count(*) AS accounts_count
FROM Accounts
WHERE income > 50000;