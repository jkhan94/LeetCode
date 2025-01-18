select today.id
from weather as today join weather as yesterday 
        on today.recordDate = date_add(yesterday.recordDate, Interval 1 day)
where today.temperature > yesterday.temperature

-- SELECT w1.id
-- FROM Weather w1 JOIN Weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
-- WHERE w1.temperature > w2.temperature;