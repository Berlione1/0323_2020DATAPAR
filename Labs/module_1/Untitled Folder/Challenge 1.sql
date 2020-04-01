#1 
select *
from (
select client_id
from client
order by district_id asc
limit 5) as T1
order by client_id asc;

#2
select client_id
from client 
where district_id='72'
order by client_id desc
limit 1;

#3
select amount 
from loan 
order by amount asc
limit 3;

#4 
select distinct(status)
from loan  
order by status asc;

#5
select loan_id, payments, amount
from loan
order by payments desc
limit 1; #-> 6415

#6 
select account_id,  amount
from loan
order by account_id asc
limit 5;

#7
select account_id
from loan
where duration='60'
order by amount asc
limit 5;

#8
select distinct(k_symbol)
from order_items;

#9
select order_id
from order_items
where account_id='34';

#10
select account_id
from order_items
where order_id between 29540 and 29560;

#11
select amount
from order_items
where account_to='30067122';

#12
select trans_id, date as date_trans, type as type_trans, amount
from trans 
where account_id='793'
order by date desc
limit 10;

