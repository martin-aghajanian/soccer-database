-- triger for when we have a new match it adds to result


DELIMITER //

DROP TRIGGER IF EXISTS after_match_insert;

CREATE TRIGGER after_match_insert
AFTER INSERT ON matches
FOR EACH ROW
BEGIN
    INSERT INTO results (
        home_goals,
        home_yellowCard,
        home_redCard,
        home_fouls,
        home_shots,
        away_goals,
        away_yellowCard,
        away_redCard,
        away_fouls,
        away_shots,
        match_id
    ) VALUES (
        0,  -- default values for home team
        0,
        0,
        0,
        0,
        0,  -- default values for away team
        0,
        0,
        0,
        0,
        NEW.match_id
    );
END;
//

DELIMITER ;
 
 INSERT INTO matches (home_team, away_team, match_date, match_start_time, season)
VALUES ('Chelsea', 'Manchester City', '2023-01-16', '15:00:00', 2023);



SELECT * FROM results;

-- trigger for when we add new data to staduim we update team


DELIMITER //

DROP TRIGGER IF EXISTS after_stadium_insert;

CREATE TRIGGER after_stadium_insert
AFTER INSERT ON stadiums
FOR EACH ROW
BEGIN
    INSERT INTO teams (team_name, stadium_name)
    VALUES (CONCAT('Team_', NEW.stadium_name), NEW.stadium_name);
END;
//

DELIMITER ;


INSERT INTO stadiums (stadium_name, capacity, country, city, street, date_of_building)
VALUES ('Stadium_A', 50000, 'Country_A', 'City_A', 'Street_A', '2023-01-01');



SELECT * FROM teams
;


-- trigger to prevent the delete of a team if it has a sponsorship

DELIMITER //

DROP TRIGGER IF EXISTS prevent_team_delete_sponsorship;


CREATE TRIGGER prevent_team_delete_sponsorship
BEFORE DELETE ON teams
FOR EACH ROW
BEGIN
    DECLARE team_count INT;

    -- Check if the team has an ongoing sponsorship
    SELECT COUNT(*) INTO team_count
    FROM sponsorship
    WHERE team_name = OLD.team_name;

    -- If the team has an ongoing sponsorship, prevent deletion
    IF team_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete team with ongoing sponsorship';
    END IF;
END;
//
DELIMITER ;


DELETE FROM teams
WHERE team_name = 'Arsenal';

-- trigger to prevent the delete of a team if here are players associated with that team

DELIMITER //

DROP TRIGGER IF EXISTS prevent_team_delete_player;


CREATE TRIGGER prevent_team_delete_player
BEFORE DELETE ON teams
FOR EACH ROW
BEGIN
    DECLARE player_count INT;

    -- Check if there are players associated with the team
    SELECT COUNT(*) INTO player_count
    FROM players
    WHERE team = OLD.team_name;

    -- If there are players, prevent deletion
    IF player_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete team with associated players';
    END IF;
END;

//

DELIMITER ;


DELETE FROM teams
WHERE team_name = 'Arsenal';


-- Trigger to check stadium capacity
DELIMITER //

DROP TRIGGER IF EXISTS before_insert_stadium;


CREATE TRIGGER before_insert_stadium
BEFORE INSERT ON stadiums
FOR EACH ROW
BEGIN
    IF NEW.capacity < 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stadium capacity must be at least 10000';
    END IF;
END;
//

DELIMITER ;


INSERT INTO stadiums (stadium_name, capacity, country, city, street, date_of_building)
VALUES ('Small Stadium', 5000, 'Country', 'City', 'Street', '2022-01-01');

