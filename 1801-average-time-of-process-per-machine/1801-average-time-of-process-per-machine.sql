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

 