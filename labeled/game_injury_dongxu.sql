Total = 16

1. How many games are held after season 2007?

SELECT count(*)
FROM game
where season >= 2007

2. List the date of games descendingly by home team names.

SELECT Date
FROM game
order by home_team desc

3. List the season, home team, away team of all the games.

SELECT season, home_team, away_team
FROM game

4. What is the maximum, minimum and average home games does each stadium hold?

select max(home_games), min(home_games), avg(home_games)
from stadium


5. What is the average attendance of stadiums reaches capacity 100%?

select average_attendance
from stadium
where capacity_percentage > 100


6. What are the player name, number of matches and information source who does not suffer from 'Knee problem'?

SELECT player, number_of_matches, source
FROM injury_accident
Where injury != 'Knee problem'


7. What is the season of the game which causes 'Walter Samuel' to get injured?

SELECT T1.season
FROM game as T1 join injury_accident as T2
on T1.id = T2.game_id
where T2.player = 'Walter Samuel'

8. What are the ids, scores and dates of the game which caused at least two accidents?

SELECT T1.id, T1.score, T1.date
FROM game as T1 join injury_accident as T2
on T2.game_id = T1.id
group by T1.id
having count(*) >= 2


9. What is the id and name of the stadium that most injury accidents happened?

SELECT T1.id, T1.name
FROM stadium as T1 join game as T2
on T1.id = T2.stadium_id
join injury_accident as T3
on T2.id = T3.game_id
group by T1.id
order by count(*) desc limit 1


10. In which season and which stadium did any player had 'Foot injury' or 'Knee problem'?

SELECT T1.season, T2.name
from game as T1 join stadium as T2
on T1.stadium_id = T2.id
join injury_accident as T3
on T1.id = T3.game_id
where T3.injury = 'Foot injury' or T3.injury = 'Knee problem'


11. How many different kinds of information sources are there?

select count(distinct source)
from injury_accident

12. How many games are free from injury accidents?

select count(*)
from game
where id not in (
select game_id from injury_accident
);

13. How many dinstinct kind of  injuries happened after season 2010?

select count(distinct T1.injury)
from injury_accident as T1 join game as T2
on T1.game_id = T2.id
where T2.season > 2010;


14. List the name of the stadium which both the player 'Walter Samuel' and
 the player 'Thiago Motta' got injuree.

SELECT T2.name
from game as T1 join stadium as T2
on T1.stadium_id = T2.id
join injury_accident as T3
on T1.id = T3.game_id
where T3.player = 'Walter Samuel'
intersect
SELECT T2.name
from game as T1 join stadium as T2
on T1.stadium_id = T2.id
join injury_accident as T3
on T1.id = T3.game_id
where T3.player = 'Thiago Motta'

15. Show name, average attendance, total attendance where no accidents happend

select name, average_attendance, total_attendance
from stadium
except
select T2.name, T2.average_attendance, T2.total_attendance
from game as T1 join stadium as T2
on T1.stadium_id = T2.id
join injury_accident as T3
on T1.id = T3.game_id

16. Which stadium name contains substring "Bank"?

select name
from stadium
where name like "%Bank%"


17. How many games has each stadium hold?

select T1.id, count(*)
from stadium as T1 join game as T2
on T1.id = T2.stadium_id
group by T1.id

18. Give me the date of games and the injured player name in the game, order by season descendingly.

SELECT T1.date, T2.player
from game as T1 join injury_accident as T2 on T1.id = T2.game_id
order by T1.season desc
