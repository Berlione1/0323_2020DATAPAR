CREate temporary table T1
select t.title_id, au_id, round(advance*royaltyper/100) as advance, round(price*ytd_sales*royalty/100*royaltyper/100)  as sales_royalty
from titles t
inner join  titleauthor ta on t.title_id=ta.title_id
inner join sales s on t.title_id=s.title_id; 

create temporary table T2
select title_id, au_id, sum(sales_royalty) as totalr, advance
from T1
group by title_id; 

select au_id, advance+totalr as profit
from T2
group by title_id 
order by profit desc
limit 3;


