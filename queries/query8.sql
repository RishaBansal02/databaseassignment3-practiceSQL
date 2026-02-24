--Query 8:  Write a query that lists all the tracks that are not in one of the top 5 genres with longer duration in the database. 
SELECT 
    t.TrackId,
    t.Name AS TrackName,
    g.Name AS Genre,
    ROUND(t.Milliseconds / 60000.0, 2) AS DurationMinutes
FROM tracks t
JOIN genres g ON t.GenreId = g.GenreId
WHERE t.GenreId NOT IN (
    SELECT g.GenreId
    FROM genres g
    JOIN tracks t ON g.GenreId = t.GenreId
    GROUP BY g.GenreId
    ORDER BY AVG(t.Milliseconds) DESC
    LIMIT 5
)
ORDER BY g.Name, t.Name;