-- day one of sql


SELECT
  ROW_NUMBER() OVER(ORDER BY player_name, position) AS SERIAL_NO,  
  player_name,
  position,
  appearances,
  nationality, 
  player_dob,
  club AS club_playing_for,
  fifa_ranking AS national_team_fifa_ranking,
  goals_scored,
  assists_provided,
  dribbles_per_90,
  interceptions_per_90,
  tackles_per_90,
  total_duels_won_per_90,
  save_percentage,
  clean_sheets,
  brand_sponsorbrand_used
from wc_players ORDER BY player_name, position ASC;
