-- 4. Display all the orders along with product name ordered by a customer having Customer_Id=2.

select o.*, c.cus_name, p.pro_name
from `order` o, customer c, product p, supplier_pricing sp 
where c.cus_id = o.cus_id and o.pricing_id = sp.pricing_id and sp.pro_id = p.pro_id and c.cus_id = 2;
