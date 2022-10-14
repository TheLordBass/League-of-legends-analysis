select
count(distinct matchid)
from participants;
-- from this query i got the total number of matches palyed which = 184069

create temporary table champpickcount
select
champs.id as id,
champs.name as champion, 
count(participants.player) as pickcount
from champs
left join participants
on champs.id = participants.championid
group by champs.name
order by 1;

-- this temp table was created to to be able to aquire the pick count of champions for ease of access

select
champion,
pickcount/184069 as pickrate 
from champpickcount
group by 1
order by 2 desc;

-- this query list the champions side by side with their pick rates for all 184069 matches from highest rate to the lowest


