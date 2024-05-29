-- Find the age of all players who play in Arsenal showing the player's full name and age.
select
  concat(first_name, ' ', last_name) AS full_name,
  FLOOR(DATEDIFF(CURDATE(), date_of_birth) / 365) AS age
from players p
where p.team = 'Arsenal';


-- Show how many stadiums each referee has worked in.
SELECT r.referee_id,
  CONCAT(r.first_name, ' ', r.last_name) AS referee,
       COUNT(DISTINCT t.stadium_name) AS stadiums_worked
FROM referee r JOIN matchReferee mr ON r.referee_id = mr.referee_id
  JOIN matches m ON mr.match_id = m.match_id
  JOIN teams t ON m.home_team = t.team_name OR m.away_team = t.team_name
GROUP BY r.referee_id;

-- Find the total results for each team hosting the match.
WITH home_stadiums (team, stadium_name, city) AS (SELECT teams.team_name,
														 stadiums.stadium_name,
														 stadiums.city
													FROM teams
													RIGHT JOIN stadiums ON teams.stadium_name = stadiums.stadium_name)
SELECT home_stadiums.city,
		home_stadiums.stadium_name,
		matches.home_team,
		sum(results.home_goals),
		sum(results.home_yellowCard),
		sum(results.home_redCard),
		sum(results.home_fouls),
		sum(results.home_shots)
FROM matches
JOIN home_stadiums ON matches.home_team = home_stadiums.team
LEFT JOIN results ON matches.match_id = results.match_id
GROUP BY home_stadiums.city,
		 home_stadiums.stadium_name,
		 matches.home_team;
        
        
-- find matches that dont have results
SELECT *
FROM matches
WHERE NOT EXISTS (
    SELECT *
    FROM results
    WHERE results.match_id = matches.match_id
);


-- find matches that have results
SELECT *
FROM matches
WHERE EXISTS (
    SELECT *
    FROM results
    WHERE results.match_id = matches.match_id
);


-- Calculate the average capacity of stadiums in each country
SELECT
    country,
    AVG(capacity) AS avg_capacity
FROM
    stadiums
GROUP BY
    country;


-- Find the stadium with the maximum capacity
SELECT
    stadium_name,
    capacity,
    country
FROM
    stadiums
WHERE
    capacity = (SELECT MAX(capacity) FROM stadiums);



-- Find the average age of all players for each team.
SELECT
    team,
    FLOOR(AVG(DATEDIFF(CURDATE(), date_of_birth) / 365)) AS 'Average Age'
FROM
    players p
GROUP BY team;


-- Find all stadiums with a capacity greater than 50,000

SELECT stadium_name, capacity, city
FROM stadiums
WHERE capacity > 60000;

-- find the oldest steduim 
SELECT stadium_name, date_of_building
FROM stadiums
ORDER BY date_of_building ASC
LIMIT 1;


-- avrage steduim cpacity 

SELECT city, AVG(capacity) AS average_capacity
FROM stadiums
GROUP BY city;


-- where team playing in Manchester
SELECT teams.team_name, stadiums.city
FROM teams
INNER JOIN stadiums ON teams.stadium_name = stadiums.stadium_name
WHERE stadiums.city = 'Manchester';


-- find oldest and youngest players 
SELECT *
FROM players
WHERE players.date_of_birth = (
    SELECT MIN(players.date_of_birth) FROM players
)
UNION ALL
SELECT *
FROM players
WHERE players.date_of_birth = (
    SELECT MAX(players.date_of_birth) FROM players
);



-- Find the average number of players per team 
SELECT AVG(team_count) AS average_players_per_team
FROM (
    SELECT teams.team_name, COUNT(*) AS team_count
    FROM players
    INNER JOIN teams ON players.team = teams.team_name
    GROUP BY teams.team_name
) AS subquery;


-- find the average age for each teams
SELECT
    t.team_name,
    AVG(FLOOR(DATEDIFF(CURDATE(), p.date_of_birth) / 365)) AS average_age
FROM
    players p
JOIN
    teams t ON p.team = t.team_name
GROUP BY
    p.team;


-- find teams that have sponsorships
SELECT DISTINCT team_name
FROM teams
WHERE team_name IN (SELECT DISTINCT team_name FROM sponsorship);
