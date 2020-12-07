	1)
SELECT categoryName, sum(recentViews) categoryViews
FROM CATEGORY
NATURAL JOIN VIDEO
NATURAL JOIN RECENT_WATCH_COUNT
GROUP BY categoryName;

	2)
SELECT ru.idUser, a.nbLikes, b.nbVidWatched, c.nbProgSubs
FROM REGISTERED_USER ru
LEFT JOIN (
	SELECT idUser, count(idVideo) nbLikes
	FROM LIKED_VIDEOS
	GROUP BY idUser
) a
ON ru.idUser = a.idUser
LEFT JOIN (
	SELECT idUser, count(idVideo) nbVidWatched
	FROM WATCH_HISTORY
	GROUP BY idUser
) b
ON ru.idUser = b.idUser
LEFT JOIN (
	SELECT idUser, count(idProgram) nbProgSubs
	FROM PROGRAMS_FOLLOWED
	GROUP BY idUser
) c
ON ru.idUser = c.idUser;

	3)
SELECT DISTINCT w.idVideo, FRviews, DEviews, FRviews-DEviews DiffViews
FROM WATCH_HISTORY w
FULL JOIN (
	SELECT idVideo, count(idUser) FRviews
	FROM REGISTERED_USER
	NATURAL JOIN WATCH_HISTORY
	WHERE country = 'France'
	GROUP BY idVideo
) a
ON a.idVideo = w.idVideo
FULL JOIN (
	SELECT idVideo, count(idUser) DEviews
	FROM REGISTERED_USER
	NATURAL JOIN WATCH_HISTORY
	WHERE country = 'Allemagne'
	GROUP BY idVideo
) b
ON b.idVideo = w.idVideo
WHERE FRviews IS NOT NULL OR DEviews IS NOT NULL
ORDER BY ABS(DiffViews) desc;

	4)
SELECT programName, idVideo, episodeNb
FROM EPISODES
NATURAL JOIN TOTAL_WATCH_COUNT twc
NATURAL JOIN PROGRAM p
NATURAL JOIN (
	SELECT DISTINCT idProgram, AVG(DISTINCT totalViews)
		OVER (PARTITION BY idProgram) meanProgramViews
	FROM EPISODES
	NATURAL JOIN TOTAL_WATCH_COUNT
) a
WHERE totalViews >= 2*meanProgramViews;

	5)
SELECT *
FROM (
	SELECT count(a.vid1) countCouples, a.vid1, a.vid2
	FROM (
		SELECT w1.idUser idUser, w1.idVideo vid1, w2.idVideo vid2
		FROM watch_history w1, watch_history w2 WHERE w1.idVideo < w2.idVideo
		AND w1.idUser=w2.idUser
		ORDER BY w1.idVideo asc
	) a
	GROUP BY a.vid1, a.vid2
	ORDER BY countCouples desc
)
WHERE ROWNUM < 10;

