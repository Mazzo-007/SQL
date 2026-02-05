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
    Data_restituzione date,
    ID_utente varchar(5),
    ID_libro varchar(5),
    
    CONSTRAINT FK_utente
		FOREIGN KEY (ID_utente)
        REFERENCES Utenti(ID_utente),
        
	CONSTRAINT FK_libro
		FOREIGN KEY (ID_libro)
        REFERENCES Libri(ID_libro)
);