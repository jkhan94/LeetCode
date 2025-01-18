select today.id
from weather as today join weather as yesterday 
        on today.recordDate = date_add(yesterday.recordDate, Interval 1 day)
where today.temperature > yesterday.temperature
