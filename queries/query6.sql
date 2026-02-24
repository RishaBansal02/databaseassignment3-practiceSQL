--Query 6: Creative addition. Make an interesting query that uses a GROUP statement and at least two tables.
SELECT 
    tr.GenreId,
    COUNT(mv.TrackId) AS VideoCount
FROM "Music Video" mv
JOIN tracks tr ON mv.TrackId = tr.TrackId
GROUP BY tr.GenreId;