WITH
  best_goal_scorer
  AS
  (
    SELECT
      CONCAT('{"id":', id,
    ', "nationality":"', nationality, 
    '", "fifa_ranking":', fifa_ranking, 
    ', "national_team_kit_sponsor":"', 
    national_team_kit_sponsor, '", "position":"', 
    position, '", "national_team_jersey_number":', 
    national_team_jersey_number, ', "player_dob":"', 
    player_dob, '", "club":"', club, '", "player_name":"',
    player_name, '", "appearances":', 
    appearances, ', "goals_scored":', 
    goals_scored, ', "assists_provided":', 
    assists_provided, ', "dribbles_per_90":', 
    dribbles_per_90, ', "interceptions_per_90":', 
    interceptions_per_90, ', "tackles_per_90":', 
    tackles_per_90, ', "total_duels_won_per_90":', 
    total_duels_won_per_90, ', "save_percentage":', 
    save_percentage, ', "clean_sheets":', 
    clean_sheets, ', "brand_sponsorbrand_used":"', 
    brand_sponsorbrand_used, '"}') AS player
    FROM wc_players
    WHERE goals_scored NOT IN ('N.A', 'N,A')
    ORDER BY goals_scored DESC
  

FETCH FIRST 1 ROWS ONLY
), best_assist_provider AS
(
  SELECT
  CONCAT('{"id":', id,
    ', "nationality":"', nationality, 
    '", "fifa_ranking":', fifa_ranking, 
    ', "national_team_kit_sponsor":"', 
    national_team_kit_sponsor, '", "position":"', 
    position, '", "national_team_jersey_number":', 
    national_team_jersey_number, ', "player_dob":"', 
    player_dob, '", "club":"', club, '", "player_name":"',
    player_name, '", "appearances":', 
    appearances, ', "goals_scored":', 
    goals_scored, ', "assists_provided":', 
    assists_provided, ', "dribbles_per_90":', 
    dribbles_per_90, ', "interceptions_per_90":', 
    interceptions_per_90, ', "tackles_per_90":', 
    tackles_per_90, ', "total_duels_won_per_90":', 
    total_duels_won_per_90, ', "save_percentage":', 
    save_percentage, ', "clean_sheets":', 
    clean_sheets, ', "brand_sponsorbrand_used":"', 
    brand_sponsorbrand_used, '"}') AS player
FROM wc_players
WHERE goals_scored NOT IN ('N.A', 'N,A')
ORDER BY assists_provided DESC
FETCH FIRST 1 ROWS ONLY
),
best_player AS
(
   SELECT
  CONCAT('{"id":', id,
    ', "nationality":"', nationality, 
    '", "fifa_ranking":', fifa_ranking, 
    ', "national_team_kit_sponsor":"', 
    national_team_kit_sponsor, '", "position":"', 
    position, '", "national_team_jersey_number":', 
    national_team_jersey_number, ', "player_dob":"', 
    player_dob, '", "club":"', club, '", "player_name":"',
    player_name, '", "appearances":', 
    appearances, ', "goals_scored":', 
    goals_scored, ', "assists_provided":', 
    assists_provided, ', "dribbles_per_90":', 
    dribbles_per_90, ', "interceptions_per_90":', 
    interceptions_per_90, ', "tackles_per_90":', 
    tackles_per_90, ', "total_duels_won_per_90":', 
    total_duels_won_per_90, ', "save_percentage":', 
    save_percentage, ', "clean_sheets":', 
    clean_sheets, ', "brand_sponsorbrand_used":"', 
    brand_sponsorbrand_used, '"}') AS player
FROM wc_players
WHERE goals_scored NOT IN ('N.A', 'N,A')
  AND assists_provided NOT IN ('N.A', 'N,A')
ORDER BY goals_scored DESC, 
  assists_provided DESC
FETCH FIRST 1 ROWS ONLY
)
  SELECT 'overall_best_player' AS title, best_player.*
  FROM best_player
UNION
  SELECT 'highest_goal_scorer' AS title, best_goal_scorer.*
  FROM best_goal_scorer
UNION
  SELECT 'highest_assist_provider' AS title, best_assist_provider.*
  FROM best_assist_provider;