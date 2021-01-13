CREATE DATABASE examen_db;

USE examen_db;

CREATE DATABASE examen_db;

USE examen_db;

CREATE TABLE Etudiant(
	Matricule varchar(50) PRIMARY KEY,
    Nom varchar(50),
    Prenom varchar(50),
    DateNaissance date,
    Niveau varchar(50)
);

CREATE TABLE Cours(
	Code varchar(50) PRIMARY KEY,
    NomCours varchar(50),
    Enseignant varchar(50)
);

CREATE TABLE Examen(
	Matricule varchar(50),
    Code varchar(50),
    Note float,
    CONSTRAINT pk_Examen PRIMARY KEY(Matricule,Code)
);

INSERT INTO ETUDIANT VALUES 
('e1','NOM1','PRENOM1','1991-06-11','M1'),
('e2','NOM2','PRENOM2','1978-11-04','M2'),
('e3','NOM3','PRENOM3','2001-12-24','M3'),
('e4','NOM4','PRENOM4','1981-03-01','M2'),
('e5','NOM5','PRENOM5','1987-10-22','M2');

INSERT INTO COURS VALUES 
('001','MAT1','PROF1'),
('002','MAT2','PROF2'),
('003','MAT3','PROF3'),
('004','MAT4','PROF4'),
('005','MAT5','PROF5');

INSERT INTO EXAMEN VALUES 
('e1','005',15.8),
('e2','004',17),
('e3','003',12),
('e4','002',8),
('e1','001',19),
('e5','003',12),
('e4','004',8),
('e5','001',13);

-- 1. Afficher la liste des étudiants triés par ordre croissant de date de naissance.

SELECT Nom, DateNaissance
FROM Etudiant
ORDER BY DateNaissance;

-- 2. Afficher tous les étudiants inscrits à M1 et tous les étudiants inscrits à M2.

SELECT *
FROM Etudiant
WHERE Niveau = 'M1'OR Niveau ='M2';

-- 3. Afficher les matricules des étudiants qui ont passé l'examen du cours 002.
SELECT Matricule
FROM Examen
WHERE Code ='002';

-- 4. Afficher les matricules de tous les étudiants qui ont passé l'examen du cours 001 et de tous
-- les étudiants qui ont passé l'examen du cours 002.

SELECT matricule
FROM Examen
WHERE Code ='001' OR Code ='002';

-- 5. Afficher le matricule, code, note /20 et note /40 de tous les examens classés par ordre
-- croissant de matricule et de code.
SELECT Matricule, Code, Note / 20, Note / 40
FROM Examen
ORDER BY Matricule, Code;

-- 6. Trouver la moyenne de notes de cours 002.

SELECT AVG(Note)
FROM Examen
WHERE Code ='002';

-- 7. Compter les examens passés par un étudiant (exemple avec matricule 'e1')
SELECT COUNT(Matricule)
FROM Examen
WHERE matricule='e1';

-- 8. Compter le nombre d'étudiants qui ont passé l'examen du cours 002.
SELECT COUNT(Matricule)
FROM Examen
WHERE code ='002';

-- 9. Calculer la moyenne des notes d'un étudiant (exemple avec matricule 'e1')
SELECT AVG(Note) as Moyenne_des_notes
FROM Examen
WHERE matricule ='e1';

-- 10. Compter les examens passés par chaque étudiant.
SELECT COUNT(distinct(Matricule))
FROM Examen
GROUP by Matricule;

-- 11. Calculer la moyenne des notes pour chaque étudiant.
SELECT Code, AVG(note) as Note_par_etudiant
FROM Examen
GROUP BY Code;

-- 12. La même au dessus, mais afficher seulement les étudiants (et leurs moyennes) dont la
-- moyenne est >= 15.
SELECT Code, AVG(note) as Moyenne
FROM Examen
GROUP BY Code
HAVING Moyenne >= 15;

-- 13. Trouver la moyenne de notes de chaque cours.

SELECT code, AVG(Note)
FROM Examen
GROUP by Code;

