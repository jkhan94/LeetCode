-- 2019-07-27 포함 30일동안 하나라도 activity 참여한 사람
-- the user who did at least 1 acitivy during 30 days including the last day 2019-07-27
select activity_date as day, count(distinct user_id) as active_users
from activity
where date_sub('2019-07-27', interval 30 day) < activity_date and activity_date <= '2019-07-27'
group by activity_date