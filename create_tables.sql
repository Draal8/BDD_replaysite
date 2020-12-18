CREATE TABLE CATEGORY
(
	idCategory number(8) PRIMARY KEY,
	categoryName varchar2(20) NOT NULL,
	CONSTRAINT uniq_catName UNIQUE(categoryName)
);

CREATE TABLE VIDEO
(
	idVideo number(16) PRIMARY KEY,
	idCategory number(8) NOT NULL,
	videoName varchar2(100) NOT NULL,
	description varchar2(1000),
	countryOrigin varchar2(85),
	duration number(16) NOT NULL,
	multilanguage number(1) NOT NULL,
	imageFormat varchar2(10),
	CONSTRAINT chk_countryOrigin CHECK (countryOrigin = INITCAP(countryOrigin)),
	CONSTRAINT chknb_video_duration CHECK (duration >= 0),
	CONSTRAINT chkbool_video_multilanguage CHECK (multilanguage IN (0,1)),
	FOREIGN KEY (idCategory) REFERENCES CATEGORY
);

CREATE TABLE VIDEO_LINK
(
	link varchar2(100) PRIMARY KEY,
	idVideo number(16) NOT NULL,
	CONSTRAINT fk_idVideo FOREIGN KEY (idVideo) REFERENCES VIDEO INITIALLY DEFERRED,
	CONSTRAINT uniq_idVideo UNIQUE (idVideo)
);

CREATE TABLE REGISTERED_USER
(
	idUser number(8) PRIMARY KEY,
	lastName varchar2(40) NOT NULL,
	firstName varchar2(40) NOT NULL,
	mail varchar2(100) NOT NULL,
	birthDate date NOT NULL,
	country varchar2(40) NOT NULL,
	nbLike number(8) NOT NULL,
	subscribedNews number(1) NOT NULL,
	CONSTRAINT chk_country CHECK (country = INITCAP(country)),
	CONSTRAINT chk_bool_subscribedNews CHECK (subscribedNews IN (1,0)),
	CONSTRAINT chk_nbLike CHECK ((nbLike >= 0) AND (nbLike <= 300)),
	CONSTRAINT chk_nomcase CHECK (
		lastName = INITCAP(lastName) AND
		firstName = INITCAP(firstName)
	),
	CONSTRAINT uniq_mail UNIQUE (mail)
);

CREATE TABLE LOGINFO
(
	idUser number(8) PRIMARY KEY,
	login varchar2(20),
	passwrd varchar(30) NOT NULL,
	CONSTRAINT uniq_login UNIQUE (login),
	CONSTRAINT fk_loginfo FOREIGN KEY (idUser) REFERENCES REGISTERED_USER INITIALLY DEFERRED
);

CREATE TABLE PROGRAM
(
	idProgram number(8) PRIMARY KEY,
	idCategory number(8) NOT NULL,
	programName varchar2(80) NOT NULL,
	nbEpisodes number(4) NOT NULL,
	CONSTRAINT chknb_nbEpisodes CHECK (nbEpisodes >= 0),
	CONSTRAINT uniq_programName UNIQUE (programName),
	FOREIGN KEY (idCategory) REFERENCES CATEGORY
);

CREATE TABLE EPISODES
(
	idVideo number(16) PRIMARY KEY,
	idProgram number(8) NOT NULL,
	episodeNb number(4) NOT NULL,
	CONSTRAINT chknb_episodeNb CHECK (episodeNb >= 0),
	FOREIGN KEY (idVideo) REFERENCES VIDEO ON DELETE CASCADE INITIALLY DEFERRED,
	FOREIGN KEY (idProgram) REFERENCES PROGRAM
);

CREATE TABLE BROADCAST
(
	idVideo number(16),
	broadcastDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT prk_broadcast PRIMARY KEY (idVideo, broadcastDate),
	CONSTRAINT fk_broadcast FOREIGN KEY (idVideo) REFERENCES VIDEO ON DELETE CASCADE INITIALLY DEFERRED
);

CREATE TABLE WATCH_COUNT
(
	idVideo number(16),
	watchDay date DEFAULT CURRENT_DATE,
	dayTotal number(16) DEFAULT 0,
	CONSTRAINT prk_watchCount PRIMARY KEY (idVideo, watchDay),
	CONSTRAINT fk_watchcount FOREIGN KEY (idVideo) REFERENCES VIDEO ON DELETE CASCADE INITIALLY DEFERRED
);

CREATE TABLE PROGRAMS_FOLLOWED
(
	idUser number(8),
	idProgram number(8),
	CONSTRAINT prk_programsFollowed PRIMARY KEY (idUser, idProgram),
	FOREIGN KEY (idUser) REFERENCES REGISTERED_USER,
	FOREIGN KEY (idProgram) REFERENCES PROGRAM
);

CREATE TABLE LIKED_VIDEOS
(
	idUser number(8),
	idVideo number(16),
	CONSTRAINT prk_likedVideos PRIMARY KEY (idUser,idVideo),
	FOREIGN KEY (idUser) REFERENCES REGISTERED_USER,
	FOREIGN KEY (idVideo) REFERENCES VIDEO ON DELETE CASCADE
);

CREATE TABLE WATCH_HISTORY
(
	idUser number(8),
	idVideo number(16),
	historyDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT prk_watchHistory PRIMARY KEY (idUser, idVideo, historyDate),
	FOREIGN KEY (idUser) REFERENCES REGISTERED_USER,
	FOREIGN KEY (idVideo) REFERENCES VIDEO ON DELETE CASCADE
);

CREATE TABLE CATEGORY_INTERESTED
(
	idUser number(8),
	idCategory number(8),
	CONSTRAINT prk_catInterested PRIMARY KEY (idUser, idCategory),
	FOREIGN KEY (idUser) REFERENCES REGISTERED_USER,
	FOREIGN KEY (idCategory) REFERENCES CATEGORY
);

CREATE TABLE ARCHIVES
(
	idArchived number(32) PRIMARY KEY,
	idProgram number(8),
    idCategory number(8),
	videoName varchar2(100) NOT NULL,
	description varchar2(1000),
	countryOrigin varchar2(85),
	duration number(16) NOT NULL,
	multilanguage number(1) NOT NULL,
	imageFormat varchar2(10),
	nbVues number(16) NOT NULL,
	FOREIGN KEY (idProgram) REFERENCES PROGRAM,
	CONSTRAINT chk_archivescountryOrigin CHECK (countryOrigin = INITCAP(countryOrigin)),
	CONSTRAINT chk_nbArchives_duration CHECK (duration > 0),
	CONSTRAINT chk_boolArchives_multilanguage CHECK (multilanguage IN (1,0))
);

CREATE TABLE ARCHIVES_LINK
(
	link varchar2(100) PRIMARY KEY,
	idArchived number(16) NOT NULL,
	CONSTRAINT fk_archlink FOREIGN KEY (idArchived) REFERENCES ARCHIVES ON DELETE CASCADE INITIALLY DEFERRED,
	CONSTRAINT uniq_idArchived UNIQUE (idArchived)
);

CREATE TABLE ARCHIVES_BROADCAST
(
	idArchived number(16) NOT NULL,
	broadcastDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT prk_archivesBroadcast PRIMARY KEY (idArchived, broadcastDate),
	CONSTRAINT fk_archbroadcast FOREIGN KEY (idArchived) REFERENCES ARCHIVES ON DELETE CASCADE INITIALLY DEFERRED
);
	
CREATE SEQUENCE seq_vid START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_usr START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_prg START WITH 1 INCREMENT BY 1;

