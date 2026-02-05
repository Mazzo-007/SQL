CREATE DATABASE if not exists EsercitazioneCreateTable;
USE EsercitazioneCreateTable;

CREATE TABLE if not exists Utenti(
	ID_utente varchar(5) PRIMARY KEY,
    Nome varchar(25) NOT NULL,
    Cognome varchar(25) NOT NULL,
    Mail varchar(40) NOT NULL UNIQUE,
    Età int NOT NULL CHECK(Età>=14)
);

CREATE TABLE if not exists Libri(
	ID_libro varchar(5) PRIMARY KEY,
    Titolo varchar(40) NOT NULL,
    Autore varchar(40) NOT NULL,
    ISBN varchar(13) UNIQUE,
    Anno_pubblicazione int NOT NULL CHECK(Anno_Pubblicazione>=1500)
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

INSERT INTO Utenti (ID_utente, Nome, Cognome, Mail, Età) VALUES
("AH562", "Luca", "Mazzoni", "luca.mazzoni@gmail.com", 18),
("BR104", "Giulia", "Rossi", "giulia.rossi@gmail.com", 22),
("CT778", "Marco", "Bianchi", "marco.bianchi@gmail.com", 30),
("DL990", "Sara", "Verdi", "sara.verdi@gmail.com", 19),
("EF321", "Paolo", "Neri", "paolo.neri@gmail.com", 45);
    
INSERT INTO Libri (ID_libro, Titolo, Autore, ISBN, Anno_pubblicazione) VALUES
("DS981", "Biancaneve", "Fratelli Grimm", "AOCU597NJ10LE", 1812),
("LB102", "1984", "George Orwell", "ISBN1984ORWL", 1949),
("MK450", "Il Signore degli Anelli", "J.R.R. Tolkien", "ISBNLOTR001", 1954),
("HP777", "Harry Potter", "J.K. Rowling", "ISBNHP00001", 1997),
("DV333", "Divina Commedia", "Dante Alighieri", "ISBNDANTE00", 1320);
    
INSERT INTO Prestiti (ID_prestito, Data_prestito, Data_restituzione, ID_utente, ID_libro) VALUES
("OT327", '2026-02-05', '2026-02-22', "AH562", "DS981"),
("PR101", '2026-01-10', '2026-01-25', "BR104", "LB102"),
("PR102", '2026-01-15', '2026-02-01', "CT778", "MK450"),
("PR103", '2026-02-01', '2026-02-15', "DL990", "HP777"),
("PR104", '2026-02-03', '2026-02-20', "EF321", "DV333");



TRUNCATE TABLE Utenti;

TRUNCATE TABLE Libri;

TRUNCATE TABLE Prestiti;