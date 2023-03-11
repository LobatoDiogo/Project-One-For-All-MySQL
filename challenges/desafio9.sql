SELECT 
    COUNT(user_id) AS musicas_no_historico
FROM
    history
WHERE
    user_id = 1;
    