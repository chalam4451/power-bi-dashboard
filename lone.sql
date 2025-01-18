create database financial_lone


select * from loans

--total applications

select count(id) as total_applications
from loans

--mtd--month to date 

select count(id) as mtd_total_applications
from loans
where month( issue_date) = 12

---pmtd--privious month to date


select count(id) as pmtd_total_applications
from loans
where month( issue_date) = 11


--total funded amount

select sum(loan_amount) as total_funded_amount
from loans


---mtd of funded amount
select sum(loan_amount) as total_funded_amount_mtd
from lones
where month(issue_date) = 12

---pmtd

select sum(loan_amount) as total_funded_amount_mtd
from loans
where month(issue_date) = 11


---total receive amount

select * from loans

select sum(total_payment) as total_received_amount
from loans


---mtd

select sum(total_payment) as mtd_total_received_amount
from loans
where month(issue_date) = 12

----pmtd
select sum(total_payment) as pmtd_total_received_amount
from loans
where month(issue_date) = 11


---avg interst rate

select round(avg(int_rate),4)*100 as avg_intrest_rate
from loans

---mtd

select round(avg(int_rate),4)*100 as avg_interst_rate_of_mtd
from loans
where month(issue_date) = 12

--pmtd

select round(avg(int_rate),4)*100 as avg_interst_rate_of_pmtd
from loans
where month(issue_date) = 11

select * from loans

---avg_dti

select avg(dti)*100 as avg_dti
from loans


---mtd

select round(avg(dti),4)*100 as mtd_avg_dti
from loans
where month(issue_date) = 12


--pmtd

select round(avg(dti),4)*100 as pmtd_avg_dti
from loans
where month(issue_date) = 11


----caliculate the good lone percentage

select * from loans

SELECT 
    loan_status,
    CASE 
        WHEN loan_status IN ('fully paid', 'current') THEN 'good loan'
        ELSE 'bad loan'
    END AS status
FROM loans


select
	(count(case WHEN loan_status IN ('fully paid', 'current') then id
	end) * 100.0) / count(id) as good_loan_percentage
from loans
  

 ----good loan applications

select count(id) as good_loan_applications
from loans
where loan_status in ('fully paid', 'current')


 ----good lone funded amount

 select sum(loan_amount) as good_loan_funded_amount
 from loans
where loan_status in ('fully paid', 'current')


 ----good lone received amount

 select sum(total_payment) as good_loan_received_amount
 from loans
where loan_status in ('fully paid', 'current')



----bad loan applications

select count(id) as bad_loan_applications
from loans
where loan_status = 'charged off'


 ----bad lone funded amount

 select sum(loan_amount) as bad_loan_funded_amount
 from loans
where loan_status = 'charged off'


 ----bad lone received amount

 select sum(total_payment) as bad_loan_received_amount
 from loans
where loan_status = 'charged off'


---lone status 

select * from loans


select 
		loan_status,
		count(id) as total_applications,
		sum (loan_amount) as total_funded_amount,
		sum(total_payment) as total_received_amount,
		avg(int_rate * 100) as avg_intrest_rate,
		avg(dti * 100) as avg_dti
from loans
		group by loan_status


select 
		loan_status,
		sum (loan_amount) as mtd_total_funded_amount,
		sum(total_payment) as mtd_total_received_amount
from loans
		where month(issue_date) = 12
		group by loan_status




----monthaly trend by issue date

select 
	month(issue_date) as month_number,
	datename(month,issue_date) as month_name,
	count(id) as total_loan_applications,
	sum(total_payment) as total_received_amount,
	sum(loan_amount) as total_funded_amount
from loans
	group by month(issue_date),datename(month,issue_date)
	order by month(issue_date) 
		


---reginal analysis by state

select 
	address_state as state,
	count(id) as total_loan_applications,
	sum(total_payment) as total_received_amount,
	sum(loan_amount) as total_funded_amount
from loans
	group by address_state
	order by address_state



---loan terma analysis

select * from loans

select 
	term,
	count(id) as total_loan_applications,
	sum(total_payment) as total_received_amount,
	sum(loan_amount) as total_funded_amount
from loans
	group by term
	order by term


---lengh analysis

select 
	emp_length,
	count(id) as total_loan_applications,
	sum(total_payment) as total_received_amount,
	sum(loan_amount) as total_funded_amount
from loans
	group by emp_length
	order by emp_length


--lone purpose analysis

select 
	purpose,
	count(id) as total_loan_applications,
	sum(total_payment) as total_received_amount,
	sum(loan_amount) as total_funded_amount
from loans
	group by purpose
	order by purpose


---home ownershi anlysis

select 
	home_ownership,
	count(id) as total_loan_applications,
	sum(total_payment) as total_received_amount,
	sum(loan_amount) as total_funded_amount
from loans
	group by home_ownership
	order by home_ownership








