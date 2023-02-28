-- 3. Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

select count(r.cus_id) as total_no_of_customers, r.cus_gender as gender
from (
	select cus_gender, cus_name, c.cus_id 
    from customer c 
    inner join (
		select ord_id, cus_id 
        from `order` 
        where ord_amount >= 3000
	) as o 
    on c.cus_id = o.cus_id 
    group by c.cus_id
) as r 
group by r.cus_gender;
