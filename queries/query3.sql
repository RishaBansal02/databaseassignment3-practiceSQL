--Query 3:  Insert another video for the track "Voodoo", assuming that you don't know the TrackId, so your insert query should specify the TrackId directly.
INSERT INTO "Music Video" ("TrackId", "VideoDirector") 
VALUES (
    (SELECT TrackId FROM tracks WHERE Name = 'Voodoo'),
    'Director 9'
);