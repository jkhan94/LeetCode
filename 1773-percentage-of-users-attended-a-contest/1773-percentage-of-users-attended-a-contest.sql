select r.contest_id, round(100*count(r.user_id)/(select count(user_id) from users),2) as percentage
from users as u join register as r on u.user_id=r.user_id
group by r.contest_id
order by percentage desc, r.contest_id