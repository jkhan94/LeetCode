select s.student_id, s.student_name, j.subject_name,
        count(e.subject_name) as attended_exams
from students as s
        join subjects as j 
        left join examinations as e on e.student_id=s.student_id and e.subject_name=j.subject_name
group by s.student_id, s.student_name, j.subject_name
order by s.student_id, j.subject_name
