create temporary table DBB
select account_id, replace(replace(type,'PRIJEM','INCOMING'),'VYDAJ','OUTGOING') as ntype, round(sum(amount)) as total
from trans
group by account_id , type
order by account_id asc;

select account_id, sum(if(ntype='INCOMING', amount,0)), sum(if(ntype='OUTGOING', amount,0)) 
from DBB;

select account_id, sum(if(type='PRIJEM',amount,0)) as incoming_amount, sum(if(type='VYDAJ',amount,0)) as outgoing_amount
from trans 
group by 1
order by 3 desc
limit 10;

select account_id, round(sum(if(type='PRIJEM',amount,0))-sum(if(type='VYDAJ',amount,0))) as diff
from trans 
group by 1
order by 2 desc
limit 10;