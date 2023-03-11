SELECT 
    art.artist_name AS artista,
    alb.album_name AS album,
    COUNT(f.user_id) AS pessoas_seguidoras
FROM
    artists AS art
        INNER JOIN
    albums AS alb ON art.artist_id = alb.artist_id
        INNER JOIN
    following AS f ON art.artist_id = f.artist_id
GROUP BY artista , album
ORDER BY pessoas_seguidoras DESC , artista , album;

