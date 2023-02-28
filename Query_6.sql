-- 6. Find the least expensive product from each category and print the table with category id, name, product name and price of the product.

set global sql_mode = (select replace (@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select c.cat_id, cat_name, pro_id, pro_name, min(min_price) as minimum_price 
from category c 
inner join (
	select p.pro_id, pro_name, cat_id, min_price 
    from product p 
    inner join (
		select pro_id, min(supp_price) as min_price 
        from supplier_pricing 
        group by pro_id
	) as sp 
    on p.pro_id = sp.pro_id
) as p_sp 
on c.cat_id = p_sp.cat_id 
group by cat_id;
