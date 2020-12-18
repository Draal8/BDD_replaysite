set serveroutput on

CREATE OR REPLACE PROCEDURE liker(utilisateur number, video number)
IS
	p_compteur_like INT;
    p_test INT;
BEGIN 

    SELECT count(*) INTO p_test FROM LIKED_VIDEOS
    WHERE (idUser = utilisateur AND idVideo = video);
    
    SELECT nbLike INTO p_compteur_like FROM REGISTERED_USER
	WHERE idUser = utilisateur;

	IF (p_compteur_like < 300 AND p_test = 0) THEN
		INSERT INTO LIKED_VIDEOS VALUES (utilisateur, video);
		UPDATE REGISTERED_USER SET nbLike = nbLike + 1
		WHERE idUser = utilisateur;
		DBMS_OUTPUT.PUT_LINE('Like a fonctionné !');
        
    ELSIF (p_test = 1) THEN
        DELETE FROM LIKED_VIDEOS 
        WHERE (idUser = utilisateur AND idVideo = video);
        UPDATE REGISTERED_USER SET nbLike = nbLike - 1
		WHERE idUser = utilisateur;
        DBMS_OUTPUT.PUT_LINE('Unlike a fonctionné !');
        
	ELSE
		DBMS_OUTPUT.PUT_LINE('Limite de Like atteinte !');
    
    END IF;
    COMMIT;
    
END;
/

--AVEC CURSEUR
CREATE OR REPLACE PROCEDURE enlever(a_idvideo number)
IS
    v_id_program PROGRAM.idProgram%TYPE;
    v_nb_vues WATCH_COUNT.dayTotal%TYPE;
    
    CURSOR v_video IS 
    SELECT * FROM VIDEO WHERE idVideo = a_idvideo;
    
    CURSOR v_link IS
    SELECT * FROM VIDEO_LINK WHERE idVideo = a_idvideo;
    
    CURSOR v_broadcast IS
    SELECT * FROM BROADCAST WHERE idVideo = a_idvideo;
    
BEGIN 
    
    --Load id program
    SELECT idProgram INTO v_id_program FROM VIDEO 
    NATURAL JOIN EPISODES NATURAL JOIN PROGRAM
    WHERE idVideo = a_idvideo;
    
    --Load nb vues
    SELECT UNIQUE SUM(dayTotal) INTO v_nb_vues FROM VIDEO WHERE idVideo = a_idvideo;

    --ADD ARCHIVES
    INSERT INTO ARCHIVES VALUES (v_video.idVideo
                                 , v_id_program
                                 , v_video.idCategory
                                 , v_video.videoName
                                 , v_video.description
                                 , v_video.countryOrigin
                                 , v_video.duration
                                 , v_video.multiLanguage
                                 , v_video.imageFormat
                                 , v_nb_vues);
                                 
    --ADD ARCHIVES_LINK
    INSERT INTO ARCHIVES_LINK VALUES (v_link.link, v_link.idVideo);
    
    --ADD ARCHIVES_BROADCAST
    INSERT INTO ARCHIVES_BROADCAST VALUES (v_broadcast.idVideo, v_broadcast.broadcastDate);
    
    --DEL VIDEOS
    DELETE FROM LIKED_VIDEOS WHERE idVideo = a_idvideo;
    
    --DEL VIDEOLINK
    DELETE FROM VIDEO_LINK WHERE idVideo = a_idvideo;
    
    --DEL BROADCAST
    DELETE FROM BROADCAST WHERE idVideo = a_idvideo;
    
    COMMIT;
    
END;
/




--SANS CURSEUR
CREATE OR REPLACE PROCEDURE enlever_video(a_idvideo number)
IS
    
    v_video_idvideo VIDEO.idVideo%TYPE;
    v_id_program PROGRAM.idProgram%TYPE;
    v_video_idcategory VIDEO.idCategory%TYPE;
    v_video_videoname VIDEO.videoName%TYPE;
    v_video_description VIDEO.description%TYPE;
    v_video_countryorigin VIDEO.countryOrigin%TYPE;
    v_video_duration VIDEO.duration%TYPE;
    v_video_multilanguage VIDEO.multilanguage%TYPE;
    v_video_imageformat VIDEO.imageFormat%TYPE;
    v_nb_vues WATCH_COUNT.dayTotal%TYPE;
    
    v_link_link VIDEO_LINK.link%TYPE;
    v_link_idvideo VIDEO_LINK.idVideo%TYPE;

    v_broadcast_idvideo BROADCAST.idvideo%TYPE;
    v_broadcast_broadcastdate BROADCAST.broadcastDate%TYPE;
    
BEGIN 
    
    --Load id program
    SELECT idProgram INTO v_id_program FROM VIDEO 
    NATURAL JOIN EPISODES NATURAL JOIN PROGRAM
    WHERE idVideo = a_idvideo;
    
    --Load nb vues
    SELECT UNIQUE SUM(dayTotal) INTO v_nb_vues FROM WATCH_COUNT 
    WHERE idVideo = a_idvideo;

    --ADD ARCHIVES
    INSERT INTO ARCHIVES VALUES (v_video_idvideo
                                 , v_id_program
                                 , v_video_idcategory
                                 , v_video_videoname
                                 , v_video_description
                                 , v_video_countryorigin
                                 , v_video_duration
                                 , v_video_multilanguage
                                 , v_video_imageformat
                                 , v_nb_vues);
                                 
    --ADD ARCHIVES_LINK
    INSERT INTO ARCHIVES_LINK VALUES (v_link_link, v_link_idvideo);
    
    --ADD ARCHIVES_BROADCAST
    INSERT INTO ARCHIVES_BROADCAST VALUES (v_broadcast_idvideo, v_broadcast_broadcastdate);
    
    --DEL VIDEOS
    DELETE FROM LIKED_VIDEOS WHERE idVideo = a_idvideo;
    
    --DEL VIDEOLINK
    DELETE FROM VIDEO_LINK WHERE idVideo = a_idvideo;
    
    --DEL BROADCAST
    DELETE FROM BROADCAST WHERE idVideo = a_idvideo;
    
    COMMIT;
    
END;
/




CREATE OR REPLACE PROCEDURE video_to_json(a_idvideo number)
IS
BEGIN
    SELECT 
        JSON_OBJECT(
            'id_video', idVideo, 
            'id_categorie', idCategory, 
            'video_name', videoName, 
            'description', description, 
            'duree', duration, 
            'origine', countryOrigin,
            'multi_langue', multilanguage,
            'format', imageFormat
        ) AS json
    FROM VIDEO WHERE idVideo = a_idvideo;
END;
/