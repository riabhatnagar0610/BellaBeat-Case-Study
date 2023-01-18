select *
from [Bellabeat Case Study]..hourlyCalories_merged$

-- avg calories by user
select distinct Id, avg(Calories) as avg_calories
from [Bellabeat Case Study]..hourlyCalories_merged$
group by Id

