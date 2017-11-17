DROP database if exists BDDPPE;
create database BDDPPE;
use BDDPPE;

CREATE TABLE Site(
idSite int primary key,
nomVille varchar(30)
) Engine InnoDB;

CREATE TABLE Salle(
idSalle int primary key,
nomSalle varchar(30),
idSite int,
foreign key (idSite) references Site(idSite)
)Engine InnoDB;

CREATE TABLE Joueur(
pseudo varchar(15) primary key,
prenom varchar(20),
nom varchar(20),
dateNaissance date,
adresse varchar(100),
codePostal char(5),
mail varchar(50),
portable char(10),
credit float,
derniereVisite date,
visible bool
)ENGINE innodb;

CREATE TABLE Partie(
idPartie int primary key,
dateHeure datetime,
idSalle int,
foreign key (idSalle) references Salle(idSalle)
)ENGINE InnoDB;

CREATE TABLE Joueur_Partie(
pseudo varchar(15),
idPartie int,
prix float,
primary key(pseudo, idPartie),
foreign key (pseudo) references Joueur(pseudo),
foreign key (idPartie) references Partie(idPartie)
)ENGINE InnoDB;

CREATE TABLE Credit(
pseudo varchar(15),
dateCredit date,
montant float,
primary key(pseudo, dateCredit),
foreign key (pseudo) references Joueur(pseudo)
)ENGINE InnoDB;

CREATE TABLE Commentaire(
pseudo varchar(15),
idPartie int,
texte varchar(1000),
cheminPhoto varchar(100),
primary key (pseudo,idPartie),
foreign key (pseudo) references Joueur(pseudo),
foreign key (idPartie) references Partie(idPartie)
)ENGINE InnoDB;

CREATE TABLE Obstacle(
idObstacle int primary key,
typeObstacle varchar(30)
)ENGINE InnoDB;

CREATE TABLE Equiper(
idPartie int,
idObstacle int,
positionObstacle int,
primary key(idPartie,idObstacle),
foreign key (idPartie) references Partie(idPartie),
foreign key (idObstacle) references Obstacle(idObstacle)
)ENGINE InnoDB;

CREATE TABLE Utilisateur(
login varchar(20) primary key,
password varchar(20),
niveauAcred char(1) -- 1 pour un technicien, 2 pour un comptable, 3 pour la direction
)ENGINE InnoDB;

CREATE TABLE Site_Utilisateur(
idSite int,
login varchar(20),
primary key(idSite,login),
foreign key (idSite) references Site(idSite),
foreign key (login) references Utilisateur(login)
)ENGINE InnoDB;


insert into Site values (1, 'Annecy');
insert into Site values (2, 'Bonneville');
insert into Site values (3, 'Thonon');
insert into Site values (4, 'Chamonix');

insert into Salle values (1,'Rouge',1);
insert into Salle values (2,'Prison',1);
insert into Salle values (3,'Ecole',1);
insert into Salle values (4,'Banque',1);
insert into Salle values (5,'Magasin',2);
insert into Salle values (6,'Caserne',3);
insert into Salle values (7,'Dinausore',3);
insert into Salle values (8,'Labo',4);

insert into Joueur values ('Lolo','Loic','Laporte','1997-11-02','10 route du sang', '74000', 'lolodu74@hotmail.fr','0620547899',0,'2016-09-02',1);
insert into Joueur values ('Clecle','Clement','Martinez','1996-11-16','50 route de l arbre', '74000', 'clecledu74@hotmail.fr','0660352544',0,'2016-09-01',1);
insert into Joueur values ('Dede','Damien','GG','1994-12-16','55 route de l arbre', '74000', 'dededu74@hotmail.fr','0660442544',0,'2016-09-05',1);
insert into Joueur values ('Fafa','Fanette','Doux','1998-04-14','500 route de la roche', '74800', 'fafadoux@hotmail.fr','0660442549',0,'2016-08-24',1);

insert into Partie values (1, '2015-12-02 14:00:00', 1);
insert into Partie values (2, '2016-01-02 18:00:00', 2);
insert into Partie values (3, '2016-02-01 15:00:00', 3);
insert into Partie values (4, '2016-09-02 15:00:00', 6);
insert into Partie values (5, '2016-09-01 11:00:00', 7);
insert into Partie values (6, '2016-09-05 09:00:00', 1);
insert into Partie values (7, '2016-08-24 16:00:00', 8);

insert into Joueur_Partie values('Clecle', 1, 20.2);
insert into Joueur_Partie values('Lolo', 1, 0);
insert into Joueur_Partie values('Dede', 2, 50);
insert into Joueur_Partie values('Fafa', 2, 0);
insert into Joueur_Partie values('Fafa', 7, 60.25);
insert into Joueur_Partie values('Clecle', 5, 70);
insert into Joueur_Partie values('Lolo', 4, 60.30);
insert into Joueur_Partie values('Dede', 6, 90);

insert into Credit values ('Clecle', '2015-01-01', 500);
update Joueur 
set credit =500 where pseudo='Clecle';
insert into Credit values ('Lolo', '2015-01-01', 400);
update Joueur 
set credit =400 where pseudo='Lolo';
insert into Credit values ('Fafa', '2015-01-01', 800);
update Joueur 
set credit =800 where pseudo='Fafa';
insert into Credit values ('Dede', '2015-01-01', 600);
update Joueur 
set credit =600 where pseudo='Dede';


insert into Commentaire values ('Clecle', 1, 'Bone partie', 'dffd.grogro');
insert into Commentaire values ('Lolo', 4, 'Genial', 'dffd.hoo');
insert into Commentaire values ('Dede', 6, 'Obstacle laser super', 'dffdjj.hoo');
insert into Commentaire values ('Fafa', 7, 'Love', 'dourner.hoo');

insert into Obstacle values (1,'Laser');
insert into Obstacle values (2,'Laser');
insert into Obstacle values (3,'Laser');
insert into Obstacle values (4,'Laser');
insert into Obstacle values (5,'Laser');
insert into Obstacle values (6,'Cadena');
insert into Obstacle values (7,'Cadena');
insert into Obstacle values (8,'Cadena');
insert into Obstacle values (9,'Cadena');
insert into Obstacle values (10,'Cadena');
insert into Obstacle values (11,'Souris');
insert into Obstacle values (12,'Souris');
insert into Obstacle values (13,'Souris');
insert into Obstacle values (14,'Souris');
insert into Obstacle values (15,'Souris');
insert into Obstacle values (16,'Souris');
insert into Obstacle values (17,'Vapeur');
insert into Obstacle values (18,'Vapeur');
insert into Obstacle values (19,'Vapeur');
insert into Obstacle values (20,'Vapeur');
insert into Obstacle values (21,'Vapeur');
insert into Obstacle values (22,'Pas de lumiere');
insert into Obstacle values (23,'Pas de lumiere');
insert into Obstacle values (24,'Pas de lumiere');
insert into Obstacle values (25,'Pas de lumiere');
insert into Obstacle values (26,'Pas de lumiere');

insert into  Equiper values (1, 1, 2);
insert into  Equiper values (1, 26, 1);
insert into  Equiper values (1, 15, 3);
insert into  Equiper values (1, 8, 4);
insert into  Equiper values (1, 20, 5);
insert into  Equiper values (2, 25, 1);
insert into  Equiper values (2, 16, 2);
insert into  Equiper values (2, 9, 3);
insert into  Equiper values (2, 2, 5);
insert into  Equiper values (3, 3, 1);
insert into  Equiper values (3, 11, 2);
insert into  Equiper values (3, 6, 3);
insert into  Equiper values (3, 17, 4);
insert into  Equiper values (3, 22, 5);
insert into  Equiper values (4, 2, 1);
insert into  Equiper values (4, 24, 3);
insert into  Equiper values (5, 4, 3);
insert into  Equiper values (5, 12, 5);
insert into  Equiper values (6, 14, 3);
insert into  Equiper values (6, 21, 4);
insert into  Equiper values (7, 10, 4);
insert into  Equiper values (7, 16, 1);

insert into Utilisateur values('Gregoire', 'jojo2452', '1');
insert into Utilisateur values('Camille', '1245', '2');
insert into Utilisateur values('Jean', 'francefr', '3');
insert into Utilisateur values('Hug', '9865', '3');
insert into Utilisateur values('Sandrine', '8521', '2');
insert into Utilisateur values('Rachel', '4545', '1');



insert into  Site_Utilisateur values( 1, 'Gregoire');
insert into  Site_Utilisateur values( 1, 'Camille');
insert into  Site_Utilisateur values( 1, 'Jean');
insert into  Site_Utilisateur values( 2, 'Hug');
insert into  Site_Utilisateur values( 2, 'Sandrine');
insert into  Site_Utilisateur values( 2, 'Rachel');

select * from Site_Utilisateur;

