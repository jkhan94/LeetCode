select p.product_name, sum(o.unit) as unit
from products as p right join orders as o on p.product_id = o.product_id
where date_format(o.order_date,'%Y-%m') like '2020-02%'
group by p.product_name
having unit>=100