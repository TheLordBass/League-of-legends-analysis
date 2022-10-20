use league;

select
participants.position,
count(stats1.id) as 'Matches Played',
sum(stats1.kills) as 'Total Kills',
sum(stats1.deaths) as 'Total Deaths',
sum(stats1.assists) as 'Total assists'
from champs
left join participants
on champs.id = participants.championid
left join stats1
on participants.id = stats1.id
where champs.name ='Ivern'
group by 1