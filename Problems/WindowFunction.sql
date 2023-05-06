-- Create Schema
CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

--Using simple Group function clubbing the all rows in a group and returns single record for a group

select department, round(avg(salary),2) from employees 
group by department;

select department, max(salary), min (salary), round(avg(salary),2) from employees 
group by department;

-- Basic Window Function using aggregate function over (ALL rows in window)
 
SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;
 
SELECT 
    emp_no, 
    department, 
    round(avg(salary) over(),2), 
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;


-- Window Function using aggregates after making partions by 

SELECT 
    emp_no, 
    department, 
    salary,
	round(avg(salary) OVER(),2) as company_avg,
	round(avg(salary) OVER(partition by department),2) as department_avg,
	
    MIN(salary) OVER(partition by department) as min_salary_dept,
    MAX(salary) OVER(partition by department) as max_salary_dept
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
	count(*) over (partition by department) as dept_count,
	sum(salary) over (partition by department) as dept_payroll,
	sum(salary) over () as company_payroll
	
FROM employees;

-- USing Order by as cumulative sum 

SELECT 
    emp_no, 
    department, 
    salary,
	sum(salary) over (partition by department) as dept_payroll,
	sum(salary) over (partition by department order by salary asc) as cum_dept_salary
FROM employees;

--USing Order by with actual window functions and not aggregate function like rank 

SELECT 
    emp_no, 
    department, 
    salary,
	rank() over(order by salary desc) as overall_salary_rank, 
	rank() over(partition by department order by salary desc) as dept_salary_rank
FROM employees order by department;

-- USing Rank, Dense rank and row number
-- Rank - skips the secquence if there are ties
-- Dense rank - doesn't skips the dsequence
-- Row Number : simple sequence like index 

SELECT 
    emp_no, 
    department, 
    salary,
	row_number() over(partition by department order by salary desc) as dept_row_number,
	dense_rank() over(partition by department order by salary desc) as dept_salary_rank,
	
	rank() over(order by salary desc) as overall_salary_rank
	
FROM employees order by department;

SELECT 
    emp_no, 
    department, 
    salary,
	row_number() over(order by salary desc) as dept_row_number,
	dense_rank() over(partition by department order by salary desc) as dept_salary_rank,
	
	rank() over(order by salary desc) as overall_salary_rank
	
FROM employees order by overall_salary_rank;

--N TILE Window Function
--divides the partition into sub groups ranging from 1 to Number

SELECT 
    emp_no, 
    department, 
    salary,
	ntile(4) over( order by salary desc ) as salary_cortile,
	ntile(2) over( partition by department order by salary desc ) as dept_salary_cortile
FROM employees order by salary_cortile


-- First_Value in Window Function

SELECT 
    emp_no, 
    department, 
    salary,
	first_value(emp_no) over (order by salary desc) as highest_paid_company,
	first_value(emp_no) over (partition by department order by salary desc) as highest_paid_dept
FROM employees 

--Lead and Lag
-- used to make comparison from the rows succeeding, or preceeding 

SELECT 
    emp_no, 
    department, 
    salary,
	salary - lead(salary) over(order by salary desc) as salary_more_by
FROM employees; 
SELECT 
    emp_no, 
    department, 
    salary,
	salary-lag(salary) over(order by salary desc) salary_diff
FROM employees 