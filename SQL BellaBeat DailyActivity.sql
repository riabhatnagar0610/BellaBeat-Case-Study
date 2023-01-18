select *
from [Bellabeat Case Study]..dailyActivity_merged$

-- looking for duplicates
select distinct Id, count(distinct Id)
from [Bellabeat Case Study]..dailyActivity_merged$
group by Id

-- total steps, distance and calories per user
select distinct Id, sum(TotalSteps) as total_steps_per_user, sum(TotalDistance) as total_distance_per_user,
sum(Calories) as total_calories_burned_per_user
from [Bellabeat Case Study]..dailyActivity_merged$
group by Id


-- to see if the tracker is accurate
select Id, TotalDistance, TrackerDistance, (TotalDistance - TrackerDistance) as tracker_accuracy
from [Bellabeat Case Study]..dailyActivity_merged$
where TotalDistance - TrackerDistance != 0 -- we can clearly see that the tracker is faulty mainly for the user 7007744171

--  user type
select distinct Id, avg(TotalSteps) as avg_steps,
case when avg(TotalSteps) < 5000 then 'sedentary'
when avg(TotalSteps) >= 5000 and avg(TotalSteps) <= 7499 then 'lightly active'
when avg(TotalSteps) >= 7500 and avg(TotalSteps) <=9999 then 'moderately active'
when avg(TotalSteps) >= 10000 then 'very active'
end as User_Type
into #userType
from [Bellabeat Case Study]..dailyActivity_merged$
group by Id

select * from #userType

select User_Type, count(User_Type) as num_of_users
from #userType
group by User_Type