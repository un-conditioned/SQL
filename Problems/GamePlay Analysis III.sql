https://leetcode.com/problems/game-play-analysis-iii/

--Using Window Function( Much more intuitive )
select player_id, event_date, 
sum(games_played) over (partition by player_id order by event_date asc) as games_played_so_far 
from activity

--Using Join 
select x.player_id, x.event_date, sum(b.games_played) from activity x 
join activity b on  x.player_id = b.player_id
where b.event_date<=x.event_date
group by x.player_id, x.event_date order by player_id,event_date asc