--1
INSERT INTO CATEGORY VALUES ( 1, 'Sci-fi');
INSERT INTO CATEGORY VALUES ( 2, 'Comedy');
INSERT INTO CATEGORY VALUES ( 3, 'Western');
INSERT INTO CATEGORY VALUES ( 4, 'Vlog');
INSERT INTO CATEGORY VALUES ( 5, 'Politique');
INSERT INTO CATEGORY VALUES ( 6, 'Pour la famille');
INSERT INTO CATEGORY VALUES ( 7, 'Dessin anime');
INSERT INTO CATEGORY VALUES ( 8, 'Musique');
INSERT INTO CATEGORY VALUES ( 9, 'Documentaire');
INSERT INTO CATEGORY VALUES ( 10, 'News');
INSERT INTO CATEGORY VALUES ( 11, 'Action');
INSERT INTO CATEGORY VALUES ( 12, 'Anime');
INSERT INTO CATEGORY VALUES ( 13, 'Drama');
INSERT INTO CATEGORY VALUES ( 14, 'Horror');
INSERT INTO CATEGORY VALUES ( 15, 'Romance');
INSERT INTO CATEGORY VALUES ( 16, 'Sport');
INSERT INTO CATEGORY VALUES ( 17, 'Thriller');
INSERT INTO CATEGORY VALUES ( 18, 'Pour adulte');
INSERT INTO CATEGORY VALUES ( 19, 'Tuto');
commit;

--2
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 8, 'Ice Cube is ANGRY at my Bass Solo for Snoop Dogg', 'Ice Cube isn''t happy about my bass solo for Snoop Dogg... He wants an epic slap bass solo too. OMG.'||chr(10)||'SLAP LIKE', 'Italy', 614, 1, 'jpeg');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 4, 'I Made a Song out of Among Us Sounds ONLY', 'Making a song out of Among Us'' sound effects (and my bass)'||chr(10)||'Will I succeed? watch all the video and SLAP like!', 'Italy', 495, 0, 'bmp');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 6, 'Can I Play the HARDEST Guitar Riff EVER on Bass?', 'Playing the hardest guitar riff, but on my bass guitar'||chr(38)||' more epic challenges!'||chr(10)||chr(10)||'slap like and subscribe. it''s the law.', 'Italy', 600, 1, 'gif');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 8, 'I Played Among Us Using ONLY a Bass (999+ IQ)', 'Among Us but I played it only using my bass guitar.'||chr(10)||'Incredible IQ playing and moves. slap like now if you have high IQ', 'Italy', 600, 0, 'png');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 9, 'Snoop Dogg Challenged Me to Play THIS on Bass', 'Snoop Dogg himself sent me this video where he challenged me to play and slap my bass. Incredible.'||chr(10)||'Slap like', 'Italy', 610, 1, 'ppm');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 10, 'I Change My Hairstyle For The First Time EVER', 'New hairstyle reveal..'||chr(10)||'Thanks for 8M subs.', 'Italy', 673, 0, 'jpeg');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 12, 'Donating to Musicians Streamers on Twitch BUT...', 'I went on Twitch and donated usd dollars to more musician streamers.. but they had to play or do something first...'||chr(10)||'slap like and subscribe, it''s the law.', 'Italy', 673, 0, 'bmp');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 1, 'Cursed Comments Has Gone Too Far...', NULL, 'United Kindgoms', 659, 1, 'gif');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 6, 'Funny Among Us Memes Haha', 'funny among us memes hehe\nFloor Gang Merch! https://represent.com/store/pewdiepie (Thank you)', 'United Kingdoms', 867, 1, 'png');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 3, 'I''m The Greatest At Lying', null, 'United Kingdoms', 1294, 1, 'ppm');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 13, 'Ending the Drama', NULL, 'United Kingdoms', 1293, 1, 'jpeg');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 18, 'Among Us But I RAGE QUIT #4', 'among is needs to be cancelled', 'United Kingdoms', 967, 1, 'bmp');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 15, 'You Laugh You Donate', null, 'United Kingdoms', 712, 1, 'gif');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 7, 'There Are No Accidents...', 'They Knew', NULL, 753, 1, 'png');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 14, 'The Biggest Lie of Me EXPOSED', NULL, 'United Kingdoms', 1258, 1, 'ppm');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 19, 'Si vous etes un/une prof de BDD vous devez REGARDER cette video !!!', NULL, 'France', 212, 0, NULL);
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 8, 'Through The Fire And Flames', 'Provided to YouTube by Universal Music Group'||chr(10)||chr(10)||'Through The Fire And Flames · DragonForce'||chr(10)||chr(10)||'Killer Elite', 'Usa', 439, 0, NULL);
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 8, 'Instalok - Turn Back Time Ft. Lunity (Ariana Grande - One Last Time PARODY)', 'LUNITY''S channel: https://www.youtube.com/lunity', 'Usa', 118, 1, 'jpeg');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 8, 'lofi hip hop radio - beats to relax/study to', 'Thank you for listening, I hope you will have a good time here :)', NULL, 0, 0, 'gif');
INSERT INTO VIDEO VALUES ( seq_vid.nextval, 18, 'Why is SQL fun ?', 'Everything is the title', 'Spain', 2520, 0, 'gif');
commit;

--3
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=wuO6GM5XDjc', 1);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=gUVdWLUZ8TA', 2);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=gPknTQlKGQk', 3);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=QidQiH4OwNw', 4);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=gbivRmx32X0', 5);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=dOtNAGAhsO0', 6);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=H0iNASSCWZI', 7);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=mQbU5KEOBKs', 8);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=pSOOt4-40gU', 9);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=HxTCdv7nz9k', 10);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=sd0_2zxQh10', 11);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=S_R67tMtnLk', 12);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=EPuYJTBl_QM', 13);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=ulTok4F_g04', 14);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=aiyNH2EJjxw', 15);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 16);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=ntG_EEfpasM', 17);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=qyXEsUhp8DM', 18);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.youtube.com/watch?v=5qap5aO4i9A', 19);
INSERT INTO VIDEO_LINK VALUES ( 'https://www.pornhub.com/view_video.php?viewkey=ph5d14eff990d59', 20);
commit;

--4
INSERT INTO REGISTERED_USER VALUES ( seq_usr.nextval, 'Mail', 'You''Ve Got', 'mail@nomdomaine.fr', DATE '1998-12-18', 'Usa', 1);
INSERT INTO REGISTERED_USER VALUES ( seq_usr.nextval, 'Bestwaifu', 'Rem', 'rem@bestwaifu.jp', DATE '2002-02-02', 'Japon', 0);
INSERT INTO REGISTERED_USER VALUES ( seq_usr.nextval, 'Remplircesfichiers', 'C''Estrelou', 'jen@imarre.fr', DATE '2020-10-04', 'France', 0);
INSERT INTO REGISTERED_USER VALUES ( seq_usr.nextval, 'Frey', 'Gabriel', 'gabrielFrey@unistra.fr', DATE '1982-06-24', 'France', 1);
INSERT INTO REGISTERED_USER VALUES ( seq_usr.nextval, 'Gitgud', 'User', 'user@mail.fr', DATE '1901-01-01', 'Allemagne', 0);
INSERT INTO REGISTERED_USER VALUES ( seq_usr.nextval, 'Greta', 'Thunberg', 'gt@ecologie.fr', DATE '2003-01-03', 'Allemagne', 0);
INSERT INTO REGISTERED_USER VALUES ( seq_usr.nextval, 'Unmonsieur', 'Avecunemoustache', 'lespiresheures@notrehistoire.com', DATE '1934-08-02', 'Allemagne', 0);
commit;

--5
INSERT INTO LOGINFO VALUES ( 1, 'Nora Ephron', 'weakpassword');
INSERT INTO LOGINFO VALUES ( 2, 'Rem', 'Str0Ng3R_paSS*Wrd');
INSERT INTO LOGINFO VALUES ( 3, 'wesh', 'wesh');
INSERT INTO LOGINFO VALUES ( 4, 'gaby', 'Féwöz/-3feRD#|~^u');
INSERT INTO LOGINFO VALUES ( 5, 'RandomITStudent', 'BDD_cured_my_cancer');
commit;

--6
INSERT INTO PROGRAM VALUES ( seq_prg.nextval, 2, 'Friday With Pewdiepie', 2);
INSERT INTO PROGRAM VALUES ( seq_prg.nextval, 8, 'Davie504 bass videos', 7);
INSERT INTO PROGRAM VALUES ( seq_prg.nextval, 19, 'Videos pour le cours de BDD', 2);
INSERT INTO PROGRAM VALUES ( seq_prg.nextval, 10, 'Tim pool news', 1);
commit;

--7
INSERT INTO EPISODES VALUES ( 8, 1, 2);
INSERT INTO EPISODES VALUES ( 15, 1, 1);
INSERT INTO EPISODES VALUES ( 1, 2, 7);
INSERT INTO EPISODES VALUES ( 2, 2, 6);
INSERT INTO EPISODES VALUES ( 3, 2, 5);
INSERT INTO EPISODES VALUES ( 4, 2, 4);
INSERT INTO EPISODES VALUES ( 5, 2, 3);
INSERT INTO EPISODES VALUES ( 6, 2, 2);
INSERT INTO EPISODES VALUES ( 7, 2, 1);
INSERT INTO EPISODES VALUES ( 16, 3, 1);
INSERT INTO EPISODES VALUES ( 20, 3, 2);
commit;

--8
INSERT INTO BROADCAST VALUES ( 1, TIMESTAMP '2020-10-29 08:22:33.10');
INSERT INTO BROADCAST VALUES ( 1, TIMESTAMP '2020-11-08 21:18:33.10');
INSERT INTO BROADCAST VALUES ( 1, TIMESTAMP '2020-11-03 21:48:18.10');
INSERT INTO BROADCAST VALUES ( 2, TIMESTAMP '2020-10-28 08:10:20.10');
INSERT INTO BROADCAST VALUES ( 3, TIMESTAMP '2020-11-01 02:30:42.10');
INSERT INTO BROADCAST VALUES ( 3, TIMESTAMP '2020-11-04 19:31:08.10');
INSERT INTO BROADCAST VALUES ( 4, TIMESTAMP '2020-11-08 23:58:01.10');
INSERT INTO BROADCAST VALUES ( 5, TIMESTAMP '2020-11-09 04:47:22.10');
INSERT INTO BROADCAST VALUES ( 5, TIMESTAMP '2020-11-08 19:08:27.10');
INSERT INTO BROADCAST VALUES ( 6, TIMESTAMP '2020-10-30 04:10:21.10');
INSERT INTO BROADCAST VALUES ( 7, TIMESTAMP '2020-11-03 05:55:20.10');
INSERT INTO BROADCAST VALUES ( 7, TIMESTAMP '2020-10-26 06:03:12.10');
INSERT INTO BROADCAST VALUES ( 7, TIMESTAMP '2020-11-01 12:21:25.10');
INSERT INTO BROADCAST VALUES ( 8, TIMESTAMP '2020-10-31 18:19:45.10');
INSERT INTO BROADCAST VALUES ( 8, TIMESTAMP '2020-11-08 15:53:20.10');
INSERT INTO BROADCAST VALUES ( 9, TIMESTAMP '2020-10-30 20:36:15.10');
INSERT INTO BROADCAST VALUES ( 10, TIMESTAMP '2020-11-09 12:51:19.10');
INSERT INTO BROADCAST VALUES ( 10, TIMESTAMP '2020-11-09 04:14:57.10');
INSERT INTO BROADCAST VALUES ( 11, TIMESTAMP '2020-11-01 20:23:09.10');
INSERT INTO BROADCAST VALUES ( 12, TIMESTAMP '2020-11-03 11:14:27.10');
INSERT INTO BROADCAST VALUES ( 13, TIMESTAMP '2020-11-02 14:42:51.10');
INSERT INTO BROADCAST VALUES ( 14, TIMESTAMP '2020-11-06 23:54:06.10');
INSERT INTO BROADCAST VALUES ( 15, TIMESTAMP '2020-10-26 12:34:47.10');
INSERT INTO BROADCAST VALUES ( 15, TIMESTAMP '2020-11-05 13:36:37.10');
INSERT INTO BROADCAST VALUES ( 16, TIMESTAMP '2020-11-05 01:30:17.10');
INSERT INTO BROADCAST VALUES ( 16, TIMESTAMP '2020-11-08 15:25:53.10');
INSERT INTO BROADCAST VALUES ( 16, TIMESTAMP '2020-10-28 20:59:15.10');
INSERT INTO BROADCAST VALUES ( 17, TIMESTAMP '2006-04-07 13:37:11.10');
INSERT INTO BROADCAST VALUES ( 18, TIMESTAMP '2009-11-25 08:36:20.10');
INSERT INTO BROADCAST VALUES ( 19, TIMESTAMP '2005-10-31 12:46:18.10');
INSERT INTO BROADCAST VALUES ( 20, TIMESTAMP '2001-01-18 11:09:38.10');
INSERT INTO BROADCAST VALUES ( 20, TIMESTAMP '2002-08-13 18:21:17.10');
INSERT INTO BROADCAST VALUES ( 20, TIMESTAMP '2001-09-21 06:35:59.10');
commit;

--9
INSERT INTO PROGRAMS_FOLLOWED VALUES ( 4, 3);
INSERT INTO PROGRAMS_FOLLOWED VALUES ( 1, 1);
INSERT INTO PROGRAMS_FOLLOWED VALUES ( 1, 2);
INSERT INTO PROGRAMS_FOLLOWED VALUES ( 2, 2);
INSERT INTO PROGRAMS_FOLLOWED VALUES ( 3, 1);
commit;

--10
INSERT INTO CATEGORY_INTERESTED VALUES ( 4, 19);
INSERT INTO CATEGORY_INTERESTED VALUES ( 1, 1);
INSERT INTO CATEGORY_INTERESTED VALUES ( 1, 2);
INSERT INTO CATEGORY_INTERESTED VALUES ( 1, 8);
INSERT INTO CATEGORY_INTERESTED VALUES ( 1, 9);
INSERT INTO CATEGORY_INTERESTED VALUES ( 1, 16);
INSERT INTO CATEGORY_INTERESTED VALUES ( 2, 2);
INSERT INTO CATEGORY_INTERESTED VALUES ( 2, 18);
INSERT INTO CATEGORY_INTERESTED VALUES ( 3, 8);
INSERT INTO CATEGORY_INTERESTED VALUES ( 3, 6);
INSERT INTO CATEGORY_INTERESTED VALUES ( 3, 4);
INSERT INTO CATEGORY_INTERESTED VALUES ( 3, 15);
INSERT INTO CATEGORY_INTERESTED VALUES ( 5, 2);
INSERT INTO CATEGORY_INTERESTED VALUES ( 5, 3);
INSERT INTO CATEGORY_INTERESTED VALUES ( 5, 9);
INSERT INTO CATEGORY_INTERESTED VALUES ( 5, 11);
INSERT INTO CATEGORY_INTERESTED VALUES ( 5, 10);
INSERT INTO CATEGORY_INTERESTED VALUES ( 5, 12);
commit;

--11
INSERT INTO LIKED_VIDEOS VALUES ( 1, 6);
INSERT INTO LIKED_VIDEOS VALUES ( 1, 7);
INSERT INTO LIKED_VIDEOS VALUES ( 1, 11);
INSERT INTO LIKED_VIDEOS VALUES ( 1, 16);
INSERT INTO LIKED_VIDEOS VALUES ( 1, 19);
INSERT INTO LIKED_VIDEOS VALUES ( 2, 1);
INSERT INTO LIKED_VIDEOS VALUES ( 2, 3);
INSERT INTO LIKED_VIDEOS VALUES ( 2, 5);
INSERT INTO LIKED_VIDEOS VALUES ( 2, 10);
INSERT INTO LIKED_VIDEOS VALUES ( 2, 15);
INSERT INTO LIKED_VIDEOS VALUES ( 2, 17);
INSERT INTO LIKED_VIDEOS VALUES ( 2, 18);
INSERT INTO LIKED_VIDEOS VALUES ( 4, 16);
INSERT INTO LIKED_VIDEOS VALUES ( 4, 20);
INSERT INTO LIKED_VIDEOS VALUES ( 5, 4);
INSERT INTO LIKED_VIDEOS VALUES ( 5, 8);
INSERT INTO LIKED_VIDEOS VALUES ( 5, 12);
INSERT INTO LIKED_VIDEOS VALUES ( 5, 13);
commit;

--12
INSERT INTO WATCH_HISTORY VALUES ( 1, 3, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 1, 3, TIMESTAMP '2020-10-15 16:02:58');
INSERT INTO WATCH_HISTORY VALUES ( 1, 4, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 1, 5, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 1, 6, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 1, 7, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 1, 11, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 1, 19, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 1, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 2, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 3, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 4, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 5, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 10, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 15, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 17, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 2, 18, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 7, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 8, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 9, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 10, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 11, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 12, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 13, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 16, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 3, 20, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 4, 13, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 4, 16, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 4, 20, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 4, 20, TIMESTAMP '2020-10-15 16:02:58');
INSERT INTO WATCH_HISTORY VALUES ( 5, 4, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 5, 9, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 5, 10, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 5, 13, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 6, 10, TIMESTAMP '2020-10-15 16:02:57');
INSERT INTO WATCH_HISTORY VALUES ( 7, 10, TIMESTAMP '2020-10-15 16:02:57');
commit;

--13
INSERT INTO WATCH_COUNT VALUES ( 1, DATE '2020-09-25', 10);
INSERT INTO WATCH_COUNT VALUES ( 1, DATE '2020-09-27', 2);
INSERT INTO WATCH_COUNT VALUES ( 1, DATE '2020-09-28', 1);
INSERT INTO WATCH_COUNT VALUES ( 1, DATE '2020-09-30', 3);
INSERT INTO WATCH_COUNT VALUES ( 2, DATE '2020-09-07', 15);
INSERT INTO WATCH_COUNT VALUES ( 3, DATE '2020-09-08', 28);
INSERT INTO WATCH_COUNT VALUES ( 3, DATE '2020-09-19', 10);
INSERT INTO WATCH_COUNT VALUES ( 4, DATE '2020-09-30', 4);
INSERT INTO WATCH_COUNT VALUES ( 5, DATE '2020-09-14', 425);
INSERT INTO WATCH_COUNT VALUES ( 5, DATE '2020-10-02', 25);
INSERT INTO WATCH_COUNT VALUES ( 6, DATE '2020-10-04', 666);
INSERT INTO WATCH_COUNT VALUES ( 7, DATE '2020-10-04', 15);
INSERT INTO WATCH_COUNT VALUES ( 7, DATE '2020-09-22', 77);
INSERT INTO WATCH_COUNT VALUES ( 7, DATE '2020-09-10', 17);
INSERT INTO WATCH_COUNT VALUES ( 8, DATE '2020-10-01', 58);
INSERT INTO WATCH_COUNT VALUES ( 8, DATE '2020-09-09', 88);
INSERT INTO WATCH_COUNT VALUES ( 9, DATE '2020-09-04', 59);
INSERT INTO WATCH_COUNT VALUES ( 10, DATE '2020-09-12', 110);
INSERT INTO WATCH_COUNT VALUES ( 10, DATE '2020-09-10', 55);
INSERT INTO WATCH_COUNT VALUES ( 11, DATE '2020-09-16', 66);
INSERT INTO WATCH_COUNT VALUES ( 12, DATE '2020-09-03', 144);
INSERT INTO WATCH_COUNT VALUES ( 13, DATE '2020-09-12', 166);
INSERT INTO WATCH_COUNT VALUES ( 14, DATE '2020-09-29', 258);
INSERT INTO WATCH_COUNT VALUES ( 15, DATE '2020-09-18', 56);
INSERT INTO WATCH_COUNT VALUES ( 15, DATE '2020-09-04', 437);
INSERT INTO WATCH_COUNT VALUES ( 16, DATE '2020-09-19', 1438);
INSERT INTO WATCH_COUNT VALUES ( 16, DATE '2020-09-08', 1);
INSERT INTO WATCH_COUNT VALUES ( 16, DATE '2020-10-03', 2);
INSERT INTO WATCH_COUNT VALUES ( 17, DATE '2020-09-17', 46);
INSERT INTO WATCH_COUNT VALUES ( 18, DATE '2020-09-16', 56);
INSERT INTO WATCH_COUNT VALUES ( 19, DATE '2020-09-04', 43);
INSERT INTO WATCH_COUNT VALUES ( 20, DATE '2020-10-02', 12);
INSERT INTO WATCH_COUNT VALUES ( 20, DATE '2020-09-03', 69);
INSERT INTO WATCH_COUNT VALUES ( 20, DATE '2020-09-18', 72);
commit;

--14
INSERT INTO ARCHIVES VALUES ( seq_vid.nextval, 4, 'A New Migrant Caravan of 2,000 People Is Now Heading For The US And Leftists Claim It''s A TRICK', 'SUBSCRIBE TO MY MAIN CHANNEL', 'Usa', 671, 1, 'jpeg', 125);
INSERT INTO ARCHIVES VALUES ( seq_vid.nextval, NULL, '「フィクサー - flower / fixer - nulut」をアレンジしてベース弾いてみた/ふぁみ。{Bass Cover}', '素晴らしい原曲', 'Japan', 106, 0, 'png', 58);
INSERT INTO ARCHIVES VALUES ( seq_vid.nextval, NULL, 'Nightcore - Turn Me On', 'Song :Alex Megane - Turn Me On', 'Allemagne', 152, 0, NULL, 2111);
commit;

--15
INSERT INTO ARCHIVES_LINK VALUES ('https://www.youtube.com/watch?v=AtfrYDYUTig', 21);
INSERT INTO ARCHIVES_LINK VALUES ('https://www.youtube.com/watch?v=jWzwGqSxcVU', 22);
INSERT INTO ARCHIVES_LINK VALUES ('https://www.youtube.com/watch?v=exDMA5YRH6A', 23);
commit;

--16
INSERT INTO ARCHIVES_BROADCAST VALUES ( 21, TIMESTAMP '2020-10-11 13:01:51');
INSERT INTO ARCHIVES_BROADCAST VALUES ( 22, TIMESTAMP '2020-10-12 13:01:51');
INSERT INTO ARCHIVES_BROADCAST VALUES ( 23, TIMESTAMP '2020-10-13 13:01:51');
commit;
