SELECT * FROM premierleague2425.premier_league_players;

-- CHECK FOR NULL VALUES IN CRITICAL COLUMNS
SELECT
	COUNT(*) as total_rows,
    COUNT(player) as non_null_players,
    COUNT(Team) as non_null_team,
    COUNT(position) as non_null_position,
    COUNT(minutes) as non_null_minutes,
    COUNT(goals) as non_null_goals
FROM premier_league_players;

-- Minutes played validation
SELECT
	MIN(minutes) as min_minutes,
	MAX(minutes) as max_minutes,
    AVG(minutes) as avg_minutes
FROM premier_league_players
WHERE minutes is not null;

-- Validating goal and assist range
SELECT 
	min(goals) as min_goals,
    max(goals) as max_goals,
    min(assists) as min_assists,
    max(assists) as max_assists
FROM premier_league_players;

-- Check for duplicate entries
SELECT 
    Player, 
    Team, 
    COUNT(*) AS duplicate_count
FROM premier_league_players
GROUP BY Player, Team
HAVING COUNT(*) > 1;

-- Verifying unique player-team combinations
SELECT 
    COUNT(DISTINCT Player) AS Players,
    COUNT(DISTINCT Team) AS Teams
FROM premier_league_players;

-- Validate total shot being within possible range in relation to shots on target
SELECT 
    SUM(CASE WHEN `Total Shoot` < `Shoot on Target` THEN 1 ELSE 0 END) AS invalid_shot_counts
FROM premier_league_players;

-- Ensure goals don't exceed total shots (not including penalty goals)
SELECT COUNT(*) as invalid_goals_record

FROM premier_league_players
WHERE Goals>`Total Shoot` and `Penalty Shoot on Goal`<1;

-- Check if progressive passes/carries make logical sense
SELECT COUNT(*) as invalid_pass_records
FROM premier_league_players
WHERE `Progressive Carries`>`Carries`
OR `Progressive Passes`> `Passes Attempted` ;

-- Verify valid positions
SELECT distinct position,
	COUNT(position) as position_count
FROM premier_league_players
GROUP BY position
ORDER BY position_count desc;

-- Check position-specific metric distributions
SELECT 
    Position,
    ROUND(AVG(Goals),2) AS avg_goals,
    ROUND(AVG(`Expected Goals (xG)`),2) AS avg_xg,
    ROUND(AVG(Tackles),2) AS avg_tackles
FROM premier_league_players
GROUP BY Position
ORDER BY avg_xg desc;

-- Check date range
SELECT 
    MIN(Date) AS earliest_date,
    MAX(Date) AS latest_date,
    COUNT(DISTINCT Date) AS unique_dates
FROM premier_league_players;

-- CHECK HIGHEST GOAL SCORERS
SELECT player, sum(goals) as Total_Goals
FROM premier_league_players
GROUP BY player
ORDER BY Total_goals desc;

-- AGGREGATE THE WHOLE DF BY PLAYER
SELECT Team, 
sum(goals) as TotalGoalsScored,
sum(assists) as TotalAssist

FROM premier_league_players
GROUP BY Team;

SELECT * 
FROM premier_league_players
