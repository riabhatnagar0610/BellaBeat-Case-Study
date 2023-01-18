select *
from [Bellabeat Case Study]..hourlySteps_merged$

-- total steps per user
select distinct Id, sum(StepTotal) as total_steps_per_user
from [Bellabeat Case Study]..hourlySteps_merged$
group by Id -- data is missing for certain dates that is why total steps from this table and daily activity table don't match

-- max steps for each user
select distinct Id, max(StepTotal) as max_steps
from [Bellabeat Case Study]..hourlySteps_merged$
group by Id


select distinct hs1.Id, max(hs2.StepTotal) as max_steps
from [Bellabeat Case Study]..hourlySteps_merged$ hs1
join [Bellabeat Case Study]..hourlySteps_merged$ hs2
on hs1.Id = hs2.Id
group by hs1.Id
order by hs1.Id asc


-- max steps 
select *
from [Bellabeat Case Study]..hourlySteps_merged$
where StepTotal = (select max(StepTotal) from [Bellabeat Case Study]..hourlySteps_merged$)

-- user type
select distinct Id, avg(StepTotal) as avg_steps,
case when avg(StepTotal) < 5000 then 'sedentary'
when avg(StepTotal) >= 5000 and avg(StepTotal) <= 7499 then 'lightly active'
when avg(StepTotal) >= 7500 and avg(StepTotal) <=9999 then 'moderately active'
when avg(StepTotal) >= 10000 then 'very active'
end as User_Type
from [Bellabeat Case Study]..hourlySteps_merged$
group by Id

select distinct Id, avg(StepTotal) as avg_steps
from [Bellabeat Case Study]..hourlySteps_merged$
group by Id


-- avg steps by date and time
select cast(ActivityHour as date) as Activity_Date, cast(ActivityHour as time) as Activity_Time
from [Bellabeat Case Study]..hourlySteps_merged$

select cast(ActivityHour as time) as Activity_Time, avg(StepTotal) as avg_steps_byTime
from [Bellabeat Case Study]..hourlySteps_merged$
group by cast(ActivityHour as time)
order by Activity_Time asc