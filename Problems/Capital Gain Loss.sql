-- https://leetcode.com/problems/capital-gainloss/description/


--USing Case Statements
select stock_name, 
sum(case when operation = 'Buy' then -price
		 when operation = 'Sell' then price 
	end) as capital_gain_loss
from stocks
group by stock_name

--USing mirror tables 

SELECT b.stock_name, (SUM(s.price)-SUM(b.price)) as captial_gain_loss
FROM stocks b, stocks s
WHERE b.operation='Buy' and s.operation='Sell' and b.stock_name=s.stock_name
GROUP BY b.stock_name

-- Outer Query Sell price - Inner Query Buy
SELECT otr.stock_name, sum(price) - (SELECT sum(price) FROM Stocks inr
 WHERE inr.operation='Buy' AND inr.stock_name=otr.stock_name) AS 'capital_gain_loss' 
 FROM Stocks otr WHERE otr.operation='Sell' GROUP BY otr.stock_name;