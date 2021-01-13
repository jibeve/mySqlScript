CREATE DATABASE bd_avion;
USE bd_avion;

CREATE TABLE pilote(
	numpil int PRIMARY KEY,
    nompil VARCHAR(30),
    adr varchar(30),
    sal real 
);

CREATE TABLE avion(
	numav int PRIMARY KEY,
    nomav varchar(30),
    capacite int,
    loc varchar(30)
);

CREATE TABLE vol(
	numvol int,
    numpil int, FOREIGN KEY (numpil) REFERENCES pilote(numpil),
    numav int, FOREIGN KEY (numav) REFERENCES avion(numav),
    ville_dep varchar(30),
    ville_arr varchar(30),
    h_dep int, 
    h_arr int
);

INSERT INTO vol VALUES 
(1,100,2,'ORAN','NICE',18,20),
(2,204,3,'TANGER','SF',14,16),
(3,105,1,'TANGER','LA',17,18),
(4,106,4,'RABAT','PARIS',18,23),
(5,134,5,'TANGER','NY',12,14);

INSERT INTO pilote VALUES 
(100,'Jo','Casa',16000),
(105,'Boris','Constantine',15000),
(106,'Saber','Tunis',11000),
(134,'Khalicie','Fes',17000),
(204,'Sofian','Alger',13000);

INSERT INTO avion VALUES 
(1,'AF354',340,'TANGER'),
(2,'AF1234',265,'ORAN'),
(3,'AF9876',367,'TANGER'),
(4,'LU5374',450,'RABAT'),
(5,'AF6543',500,'TANGER');

-- 1. Donnez toutes les informations sur les pilotes de la compagnie.
SELECT *
FROM pilote;

-- 2. Quels sont les numéros des pilotes en service et les villes de départ de leurs vols ?
SELECT numpil, ville_dep
FROM vol;

-- 3. Donnez la liste des avions dont la capacité est supérieure à 350 passagers.
SELECT *
FROM avion
WHERE capacite >= 350;

-- 4. Quels sont les numéros et noms des avions localisés à 'Tanger' ?
SELECT numav, nomav
FROM avion
WHERE loc='Tanger';

-- 5. Dans combien de villes distinctes sont localisées des avions ?
SELECT COUNT(distinct(loc)) as nbre_de_ville_distinctes
FROM avion;

-- 6. Quel est le nom des pilotes domiciliés à 'Casa' dont le salaire est supérieur à 15000 DH ?
SELECT nompil
FROM pilote
WHERE adr='Casa' AND sal >= 15000;

-- 7. Quels sont les avions (numéro et nom) localisés à 'Tanger' ou dont la capacité est inférieure à
-- 350 passagers ?
SELECT numav, nomav
FROM avion
WHERE loc='Tanger' OR capacite < 350;

-- 8. Liste des vols au départ de 'Rabat' allant à 'Paris' après 18 heures ?
SELECT numvol
FROM vol
WHERE ville_dep='Rabat' AND ville_arr='Paris' AND h_arr > 18;

-- 10. Quels sont les vols (numéro, ville de départ) effectués par les pilotes de numéro 100 et 204 ?
SELECT numvol, ville_dep
FROM vol
WHERE numpil =100 OR numpil=204;

-- 11. Quels sont les pilotes dont le nom commence par « S » ?
SELECT *
FROM pilote
WHERE nompil like 'S%';

-- 12. Quels sont les pilotes qui comportent le groupe de caractères « cie » ?
SELECT *
FROM pilote
WHERE nompil like '%cie%';

-- 13. Quels sont les pilotes dont la troisième lettre est un « b » ?
SELECT *
FROM pilote
WHERE nompil like '__b%';