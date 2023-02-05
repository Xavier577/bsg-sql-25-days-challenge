SELECT position, 
CONCAT(
MAX(DATE_PART('year', CURRENT_DATE::date) - DATE_PART('year', player_dob::date)),
 '-', 
 MIN(DATE_PART('year', CURRENT_DATE::date) - DATE_PART('year', player_dob::date))) AS range 
FROM wc_players GROUP BY position;