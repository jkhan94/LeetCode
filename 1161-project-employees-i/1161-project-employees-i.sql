select p.project_id, round(sum(e.experience_years)/count(p.employee_id),2) as average_years
from project as p join employee as e on p.employee_id=e.employee_id
group by p.project_id