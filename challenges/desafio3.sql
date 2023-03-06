SELECT 
    pu.username AS pessoa_usuaria,
    COUNT(h.music_id) AS musicas_ouvidas,
    ROUND(SUM(m.duration / 60), 2) AS total_minutos
FROM
    users AS pu
        INNER JOIN
    history AS h
        INNER JOIN
    musics AS m ON pu.user_id = h.user_id
        AND h.music_id = m.music_id
GROUP BY pu.user_id
ORDER BY pessoa_usuaria;
