--Query 5: Creative addition. Make an interesting query that uses a JOIN of at least two tables.
SELECT 
    ar.ArtistId,
    ar.Name AS ArtistName,
    al.AlbumId,
    al.Title AS AlbumTitle
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
ORDER BY ar.Name, al.Title;