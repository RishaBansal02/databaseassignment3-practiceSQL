
--Query 1

CREATE TABLE "Music Video" (
    "TrackId" INTEGER NOT NULL,
    "VideoDirector" TEXT,
    PRIMARY KEY("TrackId"),
    FOREIGN KEY("TrackId") REFERENCES "tracks"("TrackId")
);

--Query 2

INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (1, 'Database 1');
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (2, 'Database 2');
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (3, 'Database 3');
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (4, NULL);
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (5, 'Database 4');
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (6, 'Database 5');
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (7, 'Database 6');
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (8, NULL);
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (9, 'Database 7');
INSERT INTO "Music Video" ("TrackId", "VideoDirector") VALUES (10, 'Database 8');

--Query 3

INSERT INTO "Music Video" ("TrackId", "VideoDirector") 
VALUES (
    (SELECT TrackId FROM tracks WHERE Name = 'Voodoo'),
    'Director 9'
);

--Query 4

SELECT *
FROM tracks
WHERE Name LIKE '%á%'
   OR Name LIKE '%é%'
   OR Name LIKE '%í%'
   OR Name LIKE '%ó%'
   OR Name LIKE '%ú%';


--Query 5

SELECT 
    ar.ArtistId,
    ar.Name AS ArtistName,
    al.AlbumId,
    al.Title AS AlbumTitle
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
ORDER BY ar.Name, al.Title;

--Query 6
SELECT 
    tr.GenreId,
    COUNT(mv.TrackId) AS VideoCount
FROM "Music Video" mv
JOIN tracks tr ON mv.TrackId = tr.TrackId
GROUP BY tr.GenreId;

--Query 7
SELECT DISTINCT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Email
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
JOIN tracks t ON ii.TrackId = t.TrackId
WHERE t.Milliseconds > (SELECT AVG(Milliseconds) FROM tracks)
  AND t.Milliseconds < 900000
ORDER BY c.LastName, c.FirstName;

--Query 8
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