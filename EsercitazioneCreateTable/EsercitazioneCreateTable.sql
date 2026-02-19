CREATE DATABASE if not exists EsercitazioneCreateTable;
USE EsercitazioneCreateTable;

CREATE TABLE if not exists Utenti(
	ID_utente varchar(5) PRIMARY KEY,
    Nome varchar(50) NOT NULL,
    Cognome varchar(50) NOT NULL,
    Mail varchar(254) NOT NULL UNIQUE,
    Eta int NOT NULL CHECK(Eta>=14)
);

CREATE TABLE if not exists Libri(
	ID_libro varchar(5) PRIMARY KEY,
    Titolo varchar(40) NOT NULL,
    Autore varchar(40) NOT NULL,
    ISBN varchar(13) UNIQUE,
    Anno_pubblicazione int NOT NULL CHECK(Anno_pubblicazione>=1500)
);

CREATE TABLE if not exists Prestiti(
	ID_prestito varchar(5) PRIMARY KEY,
    Data_prestito date NOT NULL, 
    Data_restituzione date CHECK(Data_restituzione>=Data_prestito),
    ID_utente varchar(5),
    ID_libro varchar(5),
    
    CONSTRAINT FK_utente
		FOREIGN KEY (ID_utente)
        REFERENCES Utenti(ID_utente),
        
	CONSTRAINT FK_libro
		FOREIGN KEY (ID_libro)
        REFERENCES Libri(ID_libro)
);

INSERT INTO Utenti VALUES
('U001','Francesca','Galli','francesca.galli@gmail.com',28),
('U002','Federico','Bianchi','federico.bianchi@yahoo.com',22),
('U003','Luca','Morelli','luca.morelli@gmail.com',19),
('U004','Martina','Bellini','martina.bellini@hotmail.com',31),
('U005','Giulia','Bruni','giulia.bruni@gmail.com',17),
('U006','Nicolo','Rossi','nicolo.rossi@gigi.com',24),
('U007','Fabio','Conti','fabio.conti@gmail.com',35),
('U008','Elena','Galli','elena.galli@gmail.com',20),
('U009','Marco','Borrelli','marco.borrelli@gmail.com',27),
('U010','Sara','Lombardi','sara.lombardi@yahoo.com',30);
    
INSERT INTO Libri VALUES
('L001','Storia Antica','Alessandro Manzoni','1234567890123',1850),
('L002','Amore e Guerra','Giovanni Verdi','2234567890123',1899),
('L003','Il codice segreto','Umberto Eco',NULL,1980),
('L004','La storia infinita','Michael Ende','3234567890123',1979),
('L005','Manuale di Informatica','Ada Lovelace','4234567890123',1700),
('L006','L amore proibito','Maria Rossi',NULL,1600),
('L007','I promessi sposi','Alessandro Manzoni','5234567890123',1827),
('L008','Storia moderna','Luigi Bianchi','6234567890123',2005),
('L009','Amore eterno','Giuseppe Verdi','7234567890123',1500),
('L010','La Divina Commedia','Dante Alighieri','8234567890123',1500);
    
INSERT INTO Prestiti VALUES
('P001','2024-02-10','2024-02-20','U001','L001'),
('P002','2024-05-15',NULL,'U002','L002'),
('P003','2023-03-01','2023-03-15','U003','L003'),
('P004','2022-07-12','2022-07-20','U004','L004'),
('P005','2021-09-10','2021-09-30','U006','L005'),
('P006','2020-01-05','2020-01-25','U001','L006'),
('P007','2020-06-18','2020-07-01','U007','L007'),
('P008','2025-04-11',NULL,'U008','L008'),
('P009','2024-11-21','2024-12-01','U009','L009'),
('P010','2023-12-30',NULL,'U006','L001'),
('P011','2022-02-14','2022-02-28','U003','L002'),
('P012','2021-05-19','2021-06-01','U010','L003');

SELECT * FROM Utenti WHERE Eta > 25;

SELECT * FROM Utenti WHERE Nome LIKE 'F%';

SELECT * FROM Utenti WHERE Mail LIKE '%gmail%';

SELECT * FROM Utenti WHERE Cognome LIKE '%lli';

SELECT * FROM Utenti WHERE Eta BETWEEN 18 AND 30;

SELECT DISTINCT Autore FROM Libri;

SELECT * FROM Libri WHERE Titolo LIKE '%amore%';

SELECT * FROM Libri WHERE Anno_pubblicazione < 1900;

SELECT * FROM Libri WHERE ISBN IS NOT NULL;

SELECT * FROM Prestiti WHERE Data_restituzione IS NULL;

SELECT * FROM Prestiti WHERE Data_prestito BETWEEN '2024-01-01' AND '2024-12-31';

SELECT Utenti.Nome, Utenti.Cognome, Prestiti.Data_prestito FROM Utenti, Prestiti WHERE Utenti.ID_utente = Prestiti.ID_utente;

SELECT Libri.Titolo, Libri.Autore FROM Libri, Prestiti WHERE Libri.ID_libro = Prestiti.ID_libro;

SELECT DISTINCT Libri.Titolo FROM Libri JOIN Prestiti ON Libri.ID_libro = Prestiti.ID_libro;

SELECT U.Nome, L.Titolo FROM Utenti U JOIN Prestiti P ON U.ID_utente = P.ID_utente JOIN Libri L ON L.ID_libro = P.ID_libro;

TRUNCATE TABLE Utenti;

TRUNCATE TABLE Libri;

TRUNCATE TABLE Prestiti;