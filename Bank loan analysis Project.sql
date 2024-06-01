create database bank_loan_project;

use bank_loan_project;
select * from finance_1;
select * from finance_2;

select count(*) from finance_1;


# KPI 1

SELECT YEAR(issue_d) AS Year_of_issue_date, SUM(loan_amnt) AS Total_Amount
FROM finance_1
GROUP BY  YEAR(issue_d)
ORDER BY Year_of_issue_date;

#KPI 2

Select grade, sub_grade, sum(revol_bal) AS Total_Revol_Bal
from finance_1 
inner join finance_2 on finance_1.id = finance_2.id
group by grade,sub_grade
order by grade,sub_grade;


#KPI 3

select verification_status, round(sum(total_pymnt),2) as Total_Payment
from finance_1 
inner join finance_2 on finance_1.id = finance_2.id
group by verification_status;

# KPI 4

SELECT 
 EXTRACT(MONTH FROM issue_d) AS loan_month, loan_status,addr_state
from finance_1 
inner join finance_2 on finance_1.id = finance_2.id
GROUP BY 
    EXTRACT(MONTH FROM issue_d), loan_status,addr_state
ORDER BY loan_month,loan_status,addr_state;

# KPI 5

select home_ownership,last_pymnt_d 
from finance_1 
inner join finance_2 on finance_1.id = finance_2.id
group by home_ownership,last_pymnt_d 
order by home_ownership,last_pymnt_d DESC;
