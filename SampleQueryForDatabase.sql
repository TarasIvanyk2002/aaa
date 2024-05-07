SELECT
g.game_name,
pl.platform_name,
gp.release_year,
pub.publisher_name,
SUM(rs.num_sales) AS global_sales
FROM video_games.region_sales rs
INNER JOIN video_games.region r ON rs.region_id = r.id
INNER JOIN video_games.game_platform gp ON rs.game_platform_id = gp.id
INNER JOIN video_games.game_publisher gpub ON gp.game_publisher_id = gpub.id
INNER JOIN video_games.game g ON gpub.game_id = g.id
INNER JOIN video_games.platform pl ON gp.platform_id = pl.id
INNER JOIN video_games.publisher pub ON gpub.publisher_id = pub.id
GROUP BY g.game_name, pl.platform_name, gp.release_year, pub.publisher_name
ORDER BY SUM(rs.num_sales) DESC;