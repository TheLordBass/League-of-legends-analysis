select
champs.name,
count(case when stats1.win = 1 then stats1.win else null end)/ 
count(stats1.win) * 100 as 'Win Rate %',
participants.position,
count(matches.id) as 'matches played',
stats1.kills + stats1.deaths / stats1.assists as KDA
from champs
left join participants
on champs.id = participants.championid
left join stats1
on participants.id = stats1.id
left join matches
on participants.matchid = matches.id
group by 1
order by 2 desc;