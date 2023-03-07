SELECT 
    m.music_name AS cancao, COUNT(h.music_id) AS reproducoes
FROM
    musics AS m
        INNER JOIN
    history AS h ON m.music_id = h.music_id
GROUP BY m.music_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
