select s.user_id,round(sum(if(c.action like 'confirmed', 1, 0))/count(s.user_id),2) as confirmation_rate
from signups as s left join confirmations as c on s.user_id=c.user_id
group by s.user_id