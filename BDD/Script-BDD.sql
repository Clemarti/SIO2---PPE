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
