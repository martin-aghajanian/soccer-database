
-- functiuon 

DELIMITER //

CREATE FUNCTION GetTotalGoals(matchId INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE homeGoals INT;
    DECLARE awayGoals INT;
    DECLARE totalGoals INT;

    -- Get home and away goals for the specified match
    SELECT home_goals, away_goals INTO homeGoals, awayGoals
    FROM results
    WHERE match_id = matchId;

    -- Calculate total goals
    SET totalGoals = homeGoals + awayGoals;

    -- Return the total goals
    RETURN totalGoals;
END //

DELIMITER ;



SELECT 
    match_id,
    GetTotalGoals(match_id) AS TotalGoals
FROM results;


-- indexing 


-- indexing however it is not neede but we did 
CREATE INDEX idx_players_id ON players (player_id);

SHOW INDEXES FROM players WHERE Key_name = 'idx_players_id';


-- view where you cannot see the player_ID


CREATE VIEW anonymized_players AS
SELECT
  first_name,
  last_name,
  nationality,
  date_of_birth,
  position,
  team
FROM players;



select * 
from anonymized_players;

