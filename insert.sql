USE Project_DB;

delete from sponsorship;
delete from sponsors;
delete from results;
delete from players;
delete from matchReferee;
delete from referee;
delete from matches;
delete from teams;
delete from stadiums;


INSERT INTO stadiums (stadium_name, capacity, country, city, street, date_of_building)
VALUES
('Old Trafford', 74310, 'England', 'Manchester', 'Sir Matt Busby Way', '1910-02-19'),
('Etihad Stadium','55097','England','Manchester', 'Rowsley Street', '2002-07-11'),
('Emirates Stadium', '60704', 'England', 'London', 'Ashburton Grove', '2006-07-22'),
('Stamford Bridge', 40834, 'England', 'London', 'Fulham Road', '1876-04-22'),
('Anfield', '54074','England', 'Liverpool', 'Anfield Road', '1884-09-01');


INSERT INTO teams (team_name, stadium_name)
VALUES
('Manchester United', 'Old Trafford'),
('Manchester City', 'Etihad Stadium'),
('Arsenal', 'Emirates Stadium'),
('Chelsea', 'Stamford Bridge'),
('Liverpool', 'Anfield');


INSERT INTO players (first_name, last_name, nationality, date_of_birth, position, team)
VALUES


('David', 'de Gea', 'Spain', '1990-11-07', 'GK', 'Manchester United'),
('Bruno', 'Fernandes', 'Portugal', '1994-11-08', 'CAM', 'Manchester United'),
('Harry', 'Maguire', 'England', '1993-03-05', 'CB', 'Manchester United'),
('Scott', 'McTominay', 'Scotland', '1996-12-08', 'CM', 'Manchester United'),
('Cristiano', 'Ronaldo', 'Portugal', '1985-02-05', 'ST', 'Manchester United'),
('Victor', 'Lindelöf', 'Sweden', '1994-07-17', 'CB', 'Manchester United'),
('Fred', 'Rodrigues', 'Brazil', '1993-05-05', 'CM', 'Manchester United'),
('Jadon', 'Sancho', 'England', '2000-03-25', 'RW', 'Manchester United'),
('Raphaël', 'Varane', 'France', '1993-04-25', 'CB', 'Manchester United'),
('Aaron', 'Wan-Bissaka', 'England', '1997-11-24', 'RB', 'Manchester United'),
('Diogo', 'Dalot', 'Portugal', '1999-03-18', 'RB', 'Manchester United'),
('Luke', 'Shaw', 'England', '1995-07-12', 'LB', 'Manchester United'),
('Alex', 'Telles', 'Brazil', '1992-12-15', 'LB', 'Manchester United'),
('Nemanja', 'Matic', 'Serbia', '1988-08-01', 'CDM', 'Manchester United'),
('Paul', 'Pogba', 'France', '1993-03-15', 'CM', 'Manchester United'),
('Mason', 'Greenwood', 'England', '2001-10-01', 'ST', 'Manchester United'),
('Anthony', 'Elanga', 'Sweden', '2002-04-27', 'FW', 'Manchester United'),
('Marcus', 'Rashford', 'England', '1996-10-31', 'FW', 'Manchester United'),
('Edinson', 'Cavani', 'Uruguay', '1987-02-14', 'ST', 'Manchester United'),


('Ederson', 'Moares', 'Brazil', '1993-08-17', 'GK', 'Manchester City'),
('João', 'Cancelo', 'Portugal', '1994-05-27', 'RB', 'Manchester City'),
('Rodri', 'Hernández', 'Spain', '1996-06-22', 'DM', 'Manchester City'),
('Bernardo', 'Silva', 'Portugal', '1994-08-10', 'RW', 'Manchester City'),
('Aymeric', 'Laporte', 'France', '1994-05-27', 'CB', 'Manchester City'),
('Rúben', 'Dias', 'Portugal', '1997-05-14', 'CB', 'Manchester City'),
('Kevin', 'De Bruyne', 'Belgium', '1991-06-28', 'CM', 'Manchester City'),


('Édouard', 'Mendy', 'Senegal', '1992-03-01', 'GK', 'Chelsea'),
('Thiago', 'Silva', 'Brazil', '1988-09-22', 'CB', 'Chelsea'),
('Trevoh', 'Chalobah', 'England', '1999-03-05', 'CB', 'Chelsea'),
('Reece', 'James', 'England', '1999-12-08', 'RB', 'Chelsea'),
('Mason', 'Mount', 'England', '1999-01-10', 'AM', 'Chelsea'),
('Alisson', 'Becker', 'Brazil', '1992-10-02', 'GK', 'Liverpool'),
('Virgil', 'van Dijk', 'Netherlands', '1991-07-08', 'CB', 'Liverpool'),
('Bukayo', 'Saka', 'England', '2001-09-05', 'LW/RW', 'Arsenal'),
('Gabriel', 'Magalhães', 'Brazil', '1997-06-19', 'CB', 'Arsenal'),
('Aaron', 'Ramsdale', 'England', '1998-05-14', 'GK', 'Arsenal'),
('Ben', 'White', 'England', '1997-10-08', 'CB', 'Arsenal'),
('Martin', 'Ødegaard', 'Norway', '1998-12-17', 'CAM', 'Arsenal'),
('Granit', 'Xhaka', 'Switzerland', '1992-09-27', 'CM', 'Arsenal'),
('Thomas', 'Partey', 'Ghana', '1993-06-13', 'CDM', 'Arsenal'),
('Kieran', 'Tierney', 'Scotland', '1997-06-05', 'LB', 'Arsenal'),
('Emile', 'Smith Rowe', 'England', '2000-07-28', 'AM', 'Arsenal'),
('Gabriel', 'Martinelli', 'Brazil', '2001-06-18', 'LW', 'Arsenal'),
('Alexandre', 'Lacazette', 'France', '1991-05-28', 'ST', 'Arsenal'),
('Takehiro', 'Tomiyasu', 'Japan', '1998-11-05', 'RB', 'Arsenal');


INSERT INTO matches (home_team, away_team, match_date, match_start_time, season)
VALUES
('Manchester United', 'Chelsea', '2023-8-07',  '15:00:00',2022),
('Manchester United', 'Manchester City', '2023-5-07',  '16:00:00',2022),
('Manchester United', 'Arsenal', '2023-5-17',  '17:00:00',2022),
('Manchester United', 'Liverpool', '2023-8-17',  '17:00:00',2022),

('Manchester City', 'Manchester United', '2023-5-07',  '16:00:00',2022),
('Manchester City', 'Chelsea', '2023-6-07',  '12:00:00',2022),
('Manchester City', 'Arsenal', '2023-2-07',  '13:00:00',2022),
('Manchester City', 'Liverpool', '2023-2-07',  '13:00:00',2022),


('Arsenal', 'Manchester City', '2023-4-17',  '18:00:00',2022),
('Arsenal', 'Liverpool', '2023-4-22',  '18:00:00',2022),
('Arsenal', 'Chelsea', '2023-1-22',  '18:00:00',2022),
('Arsenal', 'Manchester United', '2023-9-22',  '18:00:00',2022),


('Chelsea', 'Manchester United', '2023-12-07', '18:00:00', 2023),
('Chelsea', 'Liverpool', '2023-6-16', '15:00:00', 2023),
('Chelsea', 'Arsenal', '2023-6-25', '12:00:00', 2023),
('Chelsea', 'Manchester City', '2023-3-16', '15:00:00', 2023);


 
INSERT INTO matches (home_team, away_team, match_date, match_start_time, season)
VALUES
('Manchester United', 'Chelsea', '2024-8-07',  '15:00:00',2024),
('Chelsea', 'Manchester City', '2025-3-16', '15:00:00', 2025);



INSERT INTO referee (first_name, last_name)
VALUES
  ('Mike', 'Johnson'),
  ('Anthony','Taylor' ),
  ('Graham','Scott'),
  ('Martin','Atkinson'),
  ('Paul','Tierney')
  ;


INSERT INTO matchReferee (match_id, referee_id)
VALUES
(16, 5),
(7, 3),
(12, 2),
(5, 4),
(11, 3),
(2, 1),
(10, 1),
(15, 1),
(3, 2),
(6, 4),
(1, 4),
(14, 5),
(8, 3),
(4, 5),
(9, 2),
(13, 3);


INSERT INTO results ( home_goals, home_yellowCard, home_redCard, home_fouls, home_shots,
 away_goals, away_yellowCard, away_redCard,
 away_fouls, away_shots, match_id )
VALUES
 (1,1,0,13,22,0,2,1,11,23,1),
 (2,2,1,12,14,1,3,2,13,11,2),
 (3,3,0,12,25,1,1,2,21,14,3),
 (5,2,1,13,29,0,1,0,14,9,4),
 (0,1,0,12,8,1,1,3,17,18,5),
 (2,2,0,6,12,0,0,0,14,8,6),
 (1,1,0,0,11,16,0,0,1,14,7),
 (0,0,0,10,18,0,0,0,8,5,8),
(1,0,0,12,22,0,0,0,12,21,9),
(0,0,0,12,22,1,0,0,11,21,10),
 (1,1,0,12,19,0,1,0,13,22,11),
 (3,0,0,10,12,4,0,0,12,26,12),
 (4,1,1,21,24,0,0,1,21,22,13),
(1,0,0,12,21,0,0,0,10,24,14),
 (0,1,0,11,28,0,1,0,9,19,15),
 (2,2,0,29,24,2,1,1,16,29,16)
 ;
 

INSERT INTO sponsors (sponsor_name, contact_email, description) VALUES
    ('Nike', 'info@nike.com', 'Global Sportswear Brand'),
    ('Coca-Cola', 'info@coca-cola.com', 'Beverage Partner'),
    ('Microsoft', 'info@microsoft.com', 'Technology Innovation Sponsor'),
    ('Adidas', 'info@adidas.com', 'Official Apparel and Equipment Partner'),
    ('Toyota', 'info@toyota.com', 'Automotive Sponsor');


INSERT INTO sponsorship (sponsor_id, team_name) VALUES
    (1, 'Manchester United'),
    (2, 'Manchester United'),
    (3, 'Manchester City'),
    (4, 'Arsenal'),
    (5, 'Arsenal'),
    (1, 'Chelsea'),
    (2, 'Liverpool'),
    (3, 'Liverpool'),
    (4, 'Liverpool'),
    (5, 'Manchester City');


