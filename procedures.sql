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
        DBMS_OUTPUT.PUT_LINE('Unlike a conftionné !');
        DELETE FROM LIKED_VIDEOS 
        WHERE (idUser = utilisateur AND idVideo = video);
        UPDATE REGISTERED_USER SET nbLike = nbLike - 1
		WHERE idUser = utilisateur;    
        
	ELSE
		DBMS_OUTPUT.PUT_LINE('Limite de Like atteinte !');
    
    END IF;
    COMMIT;
    
END;
/
