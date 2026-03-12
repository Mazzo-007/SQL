CREATE DATABASE if not exists IMPRESA;
USE IMPRESA;

CREATE TABLE if not exists DIPARTIMENTO (
	Codice VARCHAR(2) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sede VARCHAR(50) NOT NULL,
    Direttore INT
);

CREATE TABLE if not exists IMPIEGATO (
	Matricola INT AUTO_INCREMENT PRIMARY KEY,
    Cognome VARCHAR(50) NOT NULL,
    Stipendio INT NOT NULL,
    Dipartimento VARCHAR(2),
    
    CONSTRAINT FK_Dipartimento
		FOREIGN KEY (Dipartimento)
        REFERENCES Dipartimento(Codice)
);

CREATE TABLE if not exists PROGETTO (
	Sigla VARCHAR(50) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Bilancio INT NOT NULL,
    Responsabile INT,
    
    CONSTRAINT FK_Responsabile
		FOREIGN KEY (Responsabile)
        REFERENCES Impiegato(Matricola)
);

CREATE TABLE if not exists PARTECIPAZIONE (
	Impiegato INT,
    Progetto VARCHAR(50),
    
    CONSTRAINT PK_Partecipazione
		PRIMARY KEY (Impiegato, Progetto),
        
	CONSTRAINT FK_Impiegato
		FOREIGN KEY (Impiegato)
        REFERENCES Impiegato(Matricola),
    
    CONSTRAINT FK_Progetto
		FOREIGN KEY (Progetto)
        REFERENCES Progetto(Sigla)
);

ALTER TABLE Dipartimento ADD 
	CONSTRAINT FK_Direttore 
    FOREIGN KEY (Direttore)
    REFERENCES Impiegato(Matricola);