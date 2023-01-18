select *
from [Bellabeat Case Study]..sleepDay_merged$

-- user frequency
select Id, count(TotalSleepRecords) as UserFrequency
from [Bellabeat Case Study]..sleepDay_merged$
group by Id

-- user frequency type temp table
select Id, count(TotalSleepRecords) as UserFrequency, 
case when count(TotalSleepRecords) >= 1 and count(TotalSleepRecords) <= 10 then 'Low Use'
when count(TotalSleepRecords) >= 11 and count(TotalSleepRecords) <= 20 then 'Moderate Use'
when count(TotalSleepRecords) >= 21 and count(TotalSleepRecords) <= 35 then 'High Use'
end as UserFrequency_Type
into #User_Frequency_Type
from [Bellabeat Case Study]..sleepDay_merged$
group by Id

select * from #User_Frequency_Type

select UserFrequency_Type, count(UserFrequency_Type) as count_userFreq
from #User_Frequency_Type
group by UserFrequency_Type