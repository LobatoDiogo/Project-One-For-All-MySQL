SELECT 
    users.username AS pessoa_usuaria,
    IF(MAX(YEAR(history.reproduction_date)) >= 2021,
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
    users
        INNER JOIN
    history ON users.user_id = history.user_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
