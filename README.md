# RAPPORT PARTIE 2 BDD

## Contraintes d'intégrité
REMARQUE : Les contraintes d'intégrité sont codée à l'aide de procédure et non de triggers.
On considère que la modification d'une valeur ne sera induite que par l'appel d'une fonction.
Et donc la vérification des contraintes se fait en même temps que l'action que modélise la procédure.
Par exemple un utilisateur like, on éxecute la procédure liker() et on vérifie la limite de 300 likes etc...


#### 1) Un utilisateur aura maximum 300 vidéos en favoris
Procédure liker() qui sert de "bouton" pour qu'un utilisateur like (=favorise) une vidéo.
Les vérifications d'intégrité sont faites directement dans la procédure.
Limite de like : 300. Si l'utilisateur a dejà liké, alors la vidéo est unlike !

#### 2) Si une diffusion d’une émission est ajoutée, les dates de disponibilités seront mises à jour.La nouvelle date de fin de disponibilité sera la date de la dernière diffusion plus 14 jours.


#### 3) La suppression d’une vidéo entraînera son archivage dans une tables des vidéos qui ne sontplus accessibles par le site de replay. 
Procédure enlever() qui sert de "bouton" pour enlever une vidéo.

On conisdère que : 
Un utilisateur peut like/unlike les vidéos archivées (=suprimées). 
Un programme (= émission) peut reste visible même avec 0 episodes en ligne.

```shell
La suppression d'une vidéo entraîne : 

PROGRAMME.nbepisodes -= 1

DELETE VIDEOS
ADD ARCHIVES

DELETE VIDEOLINK
ADD ARCHIVESLINK

DELETE BROADCAST
ADD ARCHIVESBROADCAST
```

#### 4) Afin de limiter le spam de visionnage, un utilisateur ne pourra pas lancer plus de  3visionnages par minutes.
C'est aussi une procédure qui sert de "bouton" c'est à dire que la 
Une variable globale est incrémentée à chaque fois qu'un utilisateur lance une vidéo, si il est dans la limite des 3 minutes.
