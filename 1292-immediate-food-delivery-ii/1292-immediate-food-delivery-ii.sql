select round(100*sum(if(datediff(order_date, customer_pref_delivery_date)=0,1,0))/count(*),2) as immediate_percentage
from delivery
where (customer_id, order_date) in (select customer_id, min(order_date) from delivery group by customer_id)