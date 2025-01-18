select e.name, b.bonus
from employee as e left join bonus as b on e.empId=b.empId
where b.bonus<1000 || b.bonus is null