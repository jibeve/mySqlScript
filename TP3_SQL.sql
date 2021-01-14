

CREATE DATABASE TPSQL3;
USE TPSQL3;

CREATE TABLE client(
	nocli int PRIMARY KEY AUTO_INCREMENT,
    nomcli varchar(50),
    ruecli varchar(50),
    cpcli int,
    villecli varchar(50),
    cacli real
);

CREATE TABLE affaire(
	noaff int PRIMARY KEY AUTO_INCREMENT,
    nocli int,
	nomat int,
    dataff date,
    nbmat int,
    nbliv int,
    FOREIGN KEY(nocli) REFERENCES client(nocli)
);

CREATE TABLE livraison(
	nobl int PRIMARY KEY AUTO_INCREMENT,
    noaff int,
    datexp date,
    datliv date,
    qtelive int
);

CREATE TABLE materiel(
	nomat int PRIMARY KEY AUTO_INCREMENT,
    libmat varchar(50),
    qtemat int,
    pvmat real
);

INSERT INTO client VALUES
(1, 'Dupont Jacques', '8 rue des Cordeliers', '13090', 'Aix en Provence', 56000.0),
(2, 'Dupuis Jean', 'Rue Du Bois Nouveau', '13100', 'Aix en Provence', 985000.0),
(3, 'Serra Albert', '5 rue Leon Blum', '13090', 'Aix en Provence', 553223.0),
(4, 'Danna Sidonie', 'Quartier Saint-Jean', '84130', 'Le Pontet', 812654.0),
(5, 'Sartous Robert', 'Rue de la Molle', '13100', 'Aix en Provence', 456258.0),
(6, 'Texeden Jean', 'Rue de la Republique', '13120', 'Puyricard', 32000.0),
(7, 'Loiseau Gerard', 'Rue de la Grande Place', '13240', 'Meyreuil', 12000.0),
(8, 'Josserand Melodie', 'Avenue de L''Europe', '13090', 'Aix en Provence', 75000.0),
(9, 'Roubaud Aurore', 'Rue Max Weber', '13700', 'Lambesc', 125000.0),
(10, 'Tamburini Franck', 'Boulevard de la Liberte', '13740', 'Saint Cannat', 453000.0),
(11, 'Poitrier Laurent', 'Chemin de Valcros', '13800', 'Aix les Milles', 70000.0),
(12, 'Parlos Jose', 'Chemin de la Bigotte', '13006', 'Marseille', 200000.0);

INSERT INTO materiel VALUES
(1, 'Perforateur A', 25, 3654.0),
(2, 'Electro Portatif', 15, 8975.0),
(3, 'Compresseur B', 30, 4658.0),
(4, 'Surpresseur', 45, 6000.0),
(5, 'Electro Pompe', 60, 2985.0),
(6, 'Groupe Electrogene', 28, 15685.0),
(7, 'Pompe Type H', 14, 4657.0),
(8, 'Marteau Piqueur', 145, 6189.0),
(10, 'Perforateur TTX', 42, 3589.0);

INSERT INTO materiel VALUES
(9, 'Compresseur B', 25, 8000.0);

INSERT INTO affaire VALUES
(1,1,8,'2011-09-03', 50,3),
(2,5,5,'2011-10-04', 9,5),
(3,8,5,'2011-11-05', 50,9),
(4,7,6,'2011-11-10', 26,8),
(5,1,4,'2011-12-11', 40,4),
(6,1,10,'2011-12-14', 30,3),
(7,2,7,'2012-01-06', 10,1),
(8,2,8,'2012-01-07', 50,2),
(9,1,8,'2012-01-13', 30, 3);

INSERT INTO livraison VALUES
(1,3,'2011-11-16', '2011-11-23', 10),
(2,3,'2011-11-23', '2011-12-10', 3),
(3,4,'2011-11-24', '2011-12-01', 2),
(4,5,'2011-12-19', '2011-12-25', 5);

UPDATE materiel;


-- REQUETES SIMPLES

-- 1 Affichage liste noms client avec addr complètes classé par ASC
SELECT nomcli, ruecli, cpcli, villecli
FROM client
ORDER BY nomcli;

-- 2 Liste CLient Marseille et Aix

SELECT nomcli, villecli
FROM client
WHERE villecli = 'Marseille' or villecli ='Aix en Provence';

-- 3 Afficher le materiel prix compris entre 4000 et 15000
SELECT libmat, pvmat
FROM materiel
WHERE pvmat>=4000 AND pvmat <=15000;

-- 4 Afficher les clients dont nom commence par "a"
SELECT nomcli
FROM client
WHERE nomcli like 'a%';

-- 5 Affiche nom et adrr client dont nom est DUPONT ou DANNA
SELECT nomcli, ruecli
FROM client
WHERE nomcli like '%dupont%' OR nomcli like '%Danna%';

-- 6 Affich nom et adrr

SELECT nomcli as nom_du_client, ruecli as lieu_de_domicile FROM client
WHERE (nomcli like 'd%' OR nomcli like 'p%')AND (villecli = 'Aix en Provence') AND 
(cacli >=50000 AND cacli < 100000);

-- 8 Calcul du nombre total des matériels 
SELECT SUM(qtemat), AVG(pvmat)
FROM materiel;

-- REQUETES SELCTIONS MULTI TACHES

-- Afficher la liste des numéros d'affaires avec pour chacun le nom du client
SELECT noaff, nomcli
FROM affaire, client
WHERE affaire.nocli = client.nocli;

-- Afficher la liste de tous les noms et les adresses des clients de l'entreprise
SELECT nomcli, ruecli, noaff
FROM client, affaire
WHERE client.nocli = affaire.nocli;

-- Afficher les affaires réalisées dans les 50 derniers jours avec le nom du client concerné


SELECT dataff, nomcli
FROM affaire, client
WHERE affaire.nocli = client.nocli;

-- Afficher la liste triée par ordre alphabétique des noms de client avec 1 ou plusieurs affaires


SELECT dataff, nomcli
FROM affaire, client
WHERE affaire.nocli = client.nocli
ORDER BY nomcli;

-- Afficher numéros affaire avec nom client dont date livraison +10 > date exped
-- Faire un JOIN ??

SELECT 
affaire.noaff as numero_affaire, 
nomcli as nom_client,
datliv as date_livraison
FROM 
livraison
LEFT JOIN client ON
	noaff = nocli
LEFT JOIN affaire ON 
	affaire.nocli = client.nocli
WHERE datliv > (datexp+10);

-- Idem que précédemment avec affichage nbre de jour de retard
-- On insert une nouvelle collonne "nbrejourderetard" dans la table livraison









