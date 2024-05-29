create database if not exists Project_DB;
USE Project_DB;

drop table if exists sponsorship;
drop table if exists sponsors;
drop table if exists results;
drop table if exists players;
drop table if exists matchReferee;
drop table if exists referee;
drop table if exists matches;
drop table if exists teams;
drop table if exists stadiums;


CREATE TABLE stadiums (
    stadium_name VARCHAR(30),
    capacity INT,
    country VARCHAR(30),
    city VARCHAR(30),
    street VARCHAR(30),
    date_of_building DATE,
    PRIMARY KEY (stadium_name)
);


CREATE TABLE teams (
    team_name VARCHAR(30),
    stadium_name VARCHAR(30),
    
    PRIMARY KEY (team_name),
    FOREIGN KEY (stadium_name)
        REFERENCES stadiums (stadium_name)
);


CREATE TABLE players (
    player_id INT AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    nationality VARCHAR(30) NOT NULL,
    date_of_birth DATE,
    position VARCHAR(30),
    team VARCHAR(30),
    PRIMARY KEY (player_id),
    FOREIGN KEY (team)
        REFERENCES teams (team_name)
);


CREATE TABLE matches (
    match_id INT AUTO_INCREMENT,
    home_team VARCHAR(30),
    away_team VARCHAR(30),
    match_date DATE,
    match_start_time TIME,
    season YEAR,
    PRIMARY KEY (match_id),
    FOREIGN KEY (home_team)
        REFERENCES teams (team_name),
    FOREIGN KEY (away_team)
        REFERENCES teams (team_name)
);


CREATE TABLE referee (
    referee_id INT AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (referee_id)
);


CREATE TABLE matchReferee (
	match_referee_id int AUTO_INCREMENT,
    match_id INT,
    referee_id INT,
    PRIMARY KEY (match_referee_id),
    FOREIGN KEY (match_id)
        REFERENCES matches (match_id),
    FOREIGN KEY (referee_id)
        REFERENCES referee (referee_id)
);


CREATE TABLE results (
    result_id INT AUTO_INCREMENT,
    home_goals INT NOT NULL,
    home_yellowCard INT NOT NULL,
    home_redCard INT NOT NULL,
    home_fouls INT NOT NULL,
    home_shots INT NOT NULL,
    away_goals INT NOT NULL,
    away_yellowCard INT NOT NULL,
    away_redCard INT NOT NULL,
    away_fouls INT NOT NULL,
    away_shots INT NOT NULL,
    match_id INT,
	PRIMARY KEY (result_id),
    FOREIGN KEY (match_id)
        REFERENCES matches (match_id)
);


CREATE TABLE sponsors (
    sponsor_id INT AUTO_INCREMENT NOT NULL,
    sponsor_name VARCHAR(50) NOT NULL,
    contact_email VARCHAR(50) NOT NULL,
    description VARCHAR(150),
    PRIMARY KEY (sponsor_id)
);

CREATE TABLE sponsorship (
sponsorship_id INT AUTO_INCREMENT,
sponsor_id INT,
team_name VARCHAR(30),
PRIMARY KEY (sponsorship_id),
FOREIGN KEY (sponsor_id)
REFERENCES sponsors (sponsor_id),
FOREIGN KEY (team_name)
REFERENCES teams (team_name)
);