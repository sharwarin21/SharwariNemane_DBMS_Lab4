-- 9. Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. 

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_supplier_rating_info`()
BEGIN
	select report.supp_id as supplier_id, report.supp_name as supplier_name, report.average_rating as average_rating, 
		case
			when report.average_rating = 5 then 'Excellent Service'
			when report.average_rating > 4 then 'Good Service'
			when report.average_rating > 2 then 'Average Service'
			else 'Poor Service'
		end
	as type_of_service
	from (
		select s.supp_name, f.supp_id, f.average_rating 
        from (
			select sp_o_r.supp_id, avg(sp_o_r.rat_ratstars) as average_rating 
            from (
				select sp.supp_id, o_r.ord_id, o_r.rat_ratstars 
                from supplier_pricing sp
				inner join (
					select o.pricing_id, o.ord_id, r.rat_ratstars 
                    from `order` o 
					inner join rating r 
                    on o.ord_id = r.ord_id
				) as o_r 
				on o_r.pricing_id = sp.pricing_id
			) as sp_o_r
			group by sp.supp_id
		) as f 
		inner join 
		supplier s
		where f.supp_id = s.supp_id
	) as report;
END
    
call get_supplier_rating_info();
