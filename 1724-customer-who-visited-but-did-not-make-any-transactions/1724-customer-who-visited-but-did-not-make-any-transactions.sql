-- 서브 쿼리 활용
select customer_id, count(visit_id) as count_no_trans
from visits
where visit_id not in (select distinct visit_id from transactions)
group by customer_id

-- ​left join 활용
-- select v.customer_id, count(*) as count_no_trans
-- from visits as v left join transactions as t on v.visit_id=t.visit_id
-- where t.transaction_id is null
-- group by v.customer_id