

select
      UserID,
      Gender,
      Email,
      Race,
      Age,
      Province,
      Channel2,
      RecordDate2
from `workspace`.`default`.`_bright_tv_dataset_` As A
left join `workspace`.`default`.`brightTV2` AS B
on A.UserID = B.UserID0


---Calcluting the males and females
Select gender, count(*) as Total
from `workspace`.`default`.`_bright_tv_dataset_`
group by Gender

---Calculating the Mininum age 
Select Min(age) As Min_age
from  `workspace`.`default`.`_bright_tv_dataset_`


---Calcluting the males and females
Select gender, count(*) as Total
from `workspace`.`default`.`_bright_tv_dataset_`
group by Gender

---Calculating the Mininum age 
Select Min(age) As Min_age
from  `workspace`.`default`.`_bright_tv_dataset_`


---Most watched to the least watched Channel in ASC
select Channel2
from `workspace`.`default`.`brightTV2`
group by Channel2
order by count(*) ASc


--- Seperating the 
select date(RecordDate2) 
from `workspace`.`default`.`brightTV2`

---

select RecordDate2,
       date(RecordDate2) as Date,
       hour(RecordDate2) as Hour,
       minute(RecordDate2) as Minute,
       second(RecordDate2) as Second
from `workspace`.`default`.`brightTV2`

--- count distinct
select 
      Count(distinct Province) As Total_Provinces
      from`workspace`.`default`.`_bright_tv_dataset_`

--- Total users by race and gender
    select count(*) As Total_users,
            race,
           gender
      from `workspace`.`default`.`_bright_tv_dataset_`
      where race in ('black','white', 'coloured', 'indian_asian')
      and gender in ('male','female')
      Group by race,gender
      order by race, gender
      
--- age catergory
select Gender, Race, Age,
       CASE
       when Age between 0 and 19 then 'young kids'
       when Age between 20 and 30 then 'Young Adults'
       when Age between 31 and 40 then 'Adults'
       when Age between 41 and 50 then 'Middle Aged'
       when Age >= 51 then 'Elderly'
       Else 'Unknown'
       END as Age_Category,
    CASE
        WHEN `Duration 2` BETWEEN 0 AND 0.2333 THEN 'Short_View'
        WHEN `Duration 2` BETWEEN 0.2334 AND 0.9833 THEN 'Standard_View'
        WHEN `Duration 2` BETWEEN 0.9834 AND 2.9833 THEN 'Engaged_View'
        ELSE 'Marathon_View'
    END AS Duration_Group,

    -- Time of Day Group
    CASE
        WHEN hour(RecordDate2) BETWEEN 6 AND 11 THEN 'Morning_06:00-11:59'
        WHEN hour(RecordDate2) BETWEEN 12 AND 16 THEN 'Afternoon_12:00-16:59'
        WHEN hour(RecordDate2) BETWEEN 17 AND 21 THEN 'Evening_17:00-21:59'
        ELSE 'Night_22:00-05:59'
    END AS Time_Group
    from `workspace`.`default`.`_bright_tv_dataset_` As A
    left Join `workspace`.`default`.`brightTV2` AS B
    on A.UserID = B.UserID0


--- Most watched Channel
select Channel2, count(Channel2) as Most_watched_Channel
from `workspace`.`default`.`brightTV2`
group by Channel2
order by count(Channel2) Desc
