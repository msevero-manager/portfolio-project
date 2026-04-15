-- Open in the terminal
$ sqlite3 fantasy_data.db
    - sqlite> 
        -- sqlite> PRAGMA foreign_keys = ON;
        $ PRAGMA foreign_keys = ON;
        -- Prepare the import statement to recognize CSV format with the following command:
        $  .mode csv

-- Run the following commands from the sqlite prompt to load the data. Run them in the order shown here:
sqlite> 
    PRAGMA foreign_keys = ON;
    .mode csv
    .import --skip 1 data/player_data.csv player
    .import --skip 1 data/performance_data.csv performance
    .import --skip 1 data/league_data.csv league
    .import --skip 1 data/team_data.csv team
    .import --skip 1 data/team_player_data.csv team_player


-- Use the following commands to verify that the correct number of records was loaded into each table.
sqlite> 
    select count(*) from player;
    -- 1018

    select count(*) from performance;
    -- 17306

    select count(*) from performance where last_changed_date > '2024-04-01';
    -- 2711

    select count(*) from league;
    -- 5

    select count(*) from team;
    -- 20

    select count(*) from team_player;
    -- 140