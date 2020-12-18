# BDD_replaysite

Contraintes d'intégrité

#### 1) Un utilisateur aura maximum 300 vidéos en favoris
Procédure liker() qui sert au bouton pour qu'un utilisateur like une vidéo.
Les vérifications d'intégrité sont faites directement dans la procédure.
Limite de like : 300. Si l'utilisateur a dejà liké, alors la vidéo est unlike !

#### 2) Si une diffusion d’une émission est ajoutée, les dates de disponibilités seront mises à jour.La nouvelle date de fin de disponibilité sera la date de la dernière diffusion plus 14 jours.


#### 3) La suppression d’une vidéo entraînera son archivage dans une tables des vidéos qui ne sontplus accessibles par le site de replay. 
Procédure enlever() qui sert au bouton pour enlever une vidéo. 
On conisdère que : 
Un utilisateur peut like/unlike les vidéos archivées (=suprimées). 
Un programme (= émission) peut reste visible même avec 0 episodes en ligne.
La suppression d'une vidéo entraîne : 

PROGRAMME.nbepisodes -= 1

DEL VIDEOS
ADD ARCHIVES

DEL VIDEOLINK
ADD ARCHIVESLINK

DEL BROADCAST
ADD ARCHIVESBROADCAST


#### 4) Afin de limiter le spam de visionnage, un utilisateur ne pourra pas lancer plus de  3visionnages par minutes.
