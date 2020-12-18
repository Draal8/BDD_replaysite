set serveroutput on

-----------------------------------------------------------------
--				CONTRAINTES D'INTEGRITE
-----------------------------------------------------------------

--Procedure a bind au bouton pour liker une video
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


--archivage d'une video AVEC CURSEUR
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


--archivage d'une video SANS CURSEUR
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


--hors des questions demandées mais en lien avec la question suivante
--Trigger qui incremente le nombre de vues dans watch_count
CREATE OR REPLACE TRIGGER TR_user_watch
BEFORE INSERT
ON WATCH_HISTORY
FOR EACH ROW
DECLARE
	cont INTEGER;
	dat DATE;
BEGIN
	dat := current_date;
	
	--test si l'entree pour ajd existe => evite les plantages
	IF EXIST( SELECT * FROM WATCH_COUNT Wc
	WHERE Wc.idVideo = :new.idVideo AND Wc.watchDay = dat)
	THEN
		--on trouve le compte actuel
		SELECT dayTotal into cont
		FROM WATCH_COUNT Wc
		WHERE Wc.idVideo = :new.idVideo AND Wc.watchDay = dat;
		
		--et on l'ajoute en incrementant
		UPDATE WATCH_COUNT Wc2	SET dayTotal = cont+1
		WHERE Wc2.idVideo = :new.idVideo AND Wc2.watchDay = dat;
	ELSE
		--on créé l'entrée sinon
		INSERT INTO WATCH_COUNT VALUES (:new.idVideo, dat, :new.idUser);
	END IF;
END;
/


--Procedure a lier sur le bouton play et qui s'occupe du spam de visionnages
nb_vid = 0;
timestp = current_timestamp - 1; --minus 1 day

CREATE OR REPLACE PROCEDURE PR_play(idVideo INTEGER, idUser INTEGER)
IS
	
BEGIN
	IF (timestp - current_timestamp < interval '1' minute)
	THEN
		IF nb_vid < 3
		THEN
			INSERT INTO WATCH_HISTORY VALUES (idUser, idVideo, current_date);
			--trigger user watch
		
		ELSE
			DBMS_OUTPUT.PUT_LINE('Vous ne pouvez pas regarder plus de 3 videos en l''espace d''une minute');
		END IF;
	ELSE
		nb_vid = 1;
		INSERT INTO WATCH_HISTORY VALUES (idUser, idVideo, current_date);
			--trigger user watch
	END IF;
END;
/


-----------------------------------------------------------------
--				PROCEDURE et FONCTIONS
-----------------------------------------------------------------

--convertit les infos d'une video au format JSON
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


--Generateur de newsletter
CREATE OR REPLACE FUNCTION F_newsletter
RETURN CHAR
IS
	--curseur sur la table des nouvelles videos
	CURSOR news_curs IS
		SELECT * FROM VIDEO
		NATURAL JOIN BROADCAST
		WHERE CURRENT_TIMESTAMP-uploadDate >= interval '7' day;
	news_row news_curs%ROWTYPE;
	retour CHAR;
BEGIN
	retour := 'Voici les nouvelles videos sorties cette semaine qui pourraient vous intéresser :\n';
	
	FOR news_row IN news_curs
	LOOP
		--on concatene le resultat dans le string sous forme d'une liste
		retour := retour || news_row.videoName;
		retour := retour || '\n';
	END LOOP;
	
	RETURN retour;
END;
/


--Generer la liste des videos populaires parmis les categories apreciees
CREATE OR REPLACE FUNCTION F_fav (idUser INTEGER)
RETURN CHAR
IS
	--curseur sur les categories apppreciees
	CURSOR cat_curs IS
		SELECT * FROM REGISTERED_USER R
		NATURAL JOIN CATEGORY_INTERESTED
		WHERE R.idUser = idUser;
	cat_row cat_curs%ROWTYPE;
	--curseur sur les videos populaires
	CURSOR pop_curs IS
		SELECT * FROM RECOMMENDATIONS_POPULAR;
	pop_row pop_curs%ROWTYPE;
	retour CHAR;
BEGIN
	retour := 'Videos populaires dans les catégories qui vous intéressent :\n';
	
	--doubles boucle pour trouver les videos populaires dans les cat appreciees
	FOR cat_row IN cat_curs
	LOOP
		FOR pop_row IN pop_curs
		LOOP
			IF (cat_row.idCategory = pop_row.idCategory)
			THEN
				--on concatene le resultat dans le string sous forme d'une liste
				retour := retour || pop_row.videoName;
				retour := retour || '\n';
			END IF;
		END LOOP;
	END LOOP;
	RETURN retour;
END;
/

