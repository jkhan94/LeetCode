-- the number of players logged in at least 2 days since first logged in / total number of players
-- 첫 로그인을 구하고, 그것과 간격이 1차이인 날짜가 있는지 구하면 분자 나옴
with first_login as (select *
from activity
where (player_id, event_date) in (select player_id, min(event_date) from activity group by player_id)
)

select round(sum(if(datediff(a.event_date, f.event_date)=1,1,0))/count(distinct a.player_id),2) as fraction
from activity as a join first_login as f on a.player_id=f.player_id