select s.machine_id,
       round(avg(e.timestamp-s.timestamp),3) as processing_time
from (select *
        from activity
        where activity_type like "start") as s
    join
        (select *
        from activity
        where activity_type like "end") as e
    on s.machine_id=e.machine_id and s.process_id=e.process_id
group by s.machine_id 

-- 모범답안1: 1.0을 곱하지 않으면 소수점 아래가 잘린다.
-- SELECT 
--     machine_id,
--     ROUND(SUM(CASE 
--                     WHEN activity_type='start' THEN timestamp*-1 
--                         ELSE timestamp 
--                 END)*1.0 / (SELECT COUNT(DISTINCT process_id)) ,3) 
--         AS processing_time
-- FROM Activity
-- GROUP BY machine_id

-- 모범답안2:
-- SELECT a.machine_id, 
--        ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
-- FROM Activity a,  Activity b
-- WHERE 
--     a.machine_id = b.machine_id  AND    a.process_id = b.process_id 
--     AND   
--     a.activity_type = 'start'    AND    b.activity_type = 'end'
-- GROUP BY machine_id