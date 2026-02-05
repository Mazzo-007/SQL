CREATE DATABASE IF NOT EXISTS EsercitazioneDDL_1;
USE EsercitazioneDDL_1;

CREATE TABLE IF NOT EXISTS STUDENTE(
	matricola varchar(15) PRIMARY KEY,
    nome varchar(20) NOT NULL,
    cognome varchar(20) NOT NULL,
    data_nascita int NOT NULL CHECK(data_nascita>=18),
    email varchar(40) UNIQUE
);