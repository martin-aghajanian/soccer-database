# Soccer Database System Project

This project is a comprehensive database system for managing soccer-related information, implemented using MySQL. The project includes various SQL scripts for creating and managing the database, inserting sample data, and performing various queries and operations.

## Files Included

- `create.sql`
- `insert.sql`
- `functions.sql`
- `queries.sql`
- `triggers.sql`

## Description of Files

### create.sql

This script creates the database `Project_DB` and its tables, including:

- `stadiums`
- `teams`
- `players`
- `matches`
- `referee`
- `matchReferee`
- `results`
- `sponsors`
- `sponsorship`

It defines the relationships between these tables using foreign keys and sets up the primary keys for each table.

### insert.sql

This script populates the database with sample data for testing and demonstration purposes. It includes data for:

- Stadiums
- Teams
- Players
- Matches
- Referees
- MatchReferee (associating referees with matches)
- Results (match outcomes)
- Sponsors
- Sponsorship (associating sponsors with teams)

### functions.sql

This script contains user-defined functions and indexing operations. Examples include:

- `GetTotalGoals(matchId INT)`: Calculates the total number of goals scored in a match.
- Index creation for the `players` table.
- Creation of a view `anonymized_players` to display player information without revealing player IDs.

### queries.sql

This script contains a variety of SQL queries to perform complex data retrieval operations, such as:

- Finding the age of all players in Arsenal.
- Counting the number of stadiums each referee has worked in.
- Calculating total results for each team hosting matches.
- Identifying matches with and without results.
- Calculating the average capacity of stadiums by country.
- Finding the stadium with the maximum capacity.
- Calculating the average age of players for each team.
- Finding all stadiums with a capacity greater than 60,000.
- Finding the oldest stadium.
- Calculating the average stadium capacity by city.
- Identifying teams playing in Manchester.
- Finding the oldest and youngest players.
- Calculating the average number of players per team.
- Identifying teams with sponsorships.

### triggers.sql

This script contains SQL triggers to automate database operations, such as:

- Adding a default result entry when a new match is inserted.
- Automatically creating a team entry when a new stadium is inserted.
- Preventing the deletion of a team if it has an ongoing sponsorship or associated players.
- Ensuring stadium capacity is at least 10,000 before insertion.

## How to Use

1. **Create the Database and Tables:**
   Run the `create.sql` script to create the database and tables.

2. **Insert Sample Data:**
   Run the `insert.sql` script to populate the database with sample data.

3. **Define Functions and Views:**
   Execute the `functions.sql` script to create functions, indexes, and views.

4. **Run Queries:**
   Use the `queries.sql` script to perform various data retrieval operations.

5. **Set Up Triggers:**
   Execute the `triggers.sql` script to create the necessary triggers for automating database operations.

## Summary

This project provides a robust framework for managing soccer data, including teams, players, matches, and more. It leverages SQL's powerful features to ensure data integrity, automate operations, and enable complex queries for data analysis.
