select case
        when mod(id,2)=1 then if(id=(select max(id) from seat), id, id+1)
        when mod(id,2)=0 then id-1
        end as id, student
from seat
order by id