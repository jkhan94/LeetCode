select a.name
from employee as a 
join
(select managerId, count(*)
from employee
group by managerId
having count(*)>=5) as b on a.id=b.managerId