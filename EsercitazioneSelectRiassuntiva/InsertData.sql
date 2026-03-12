USE IMPRESA;

INSERT INTO Dipartimento (Codice, Nome, Sede) VALUES
('D1', 'Ricerca', 'Roma'),
('D2', 'Sviluppo', 'Milano'),
('D3', 'Marketing', 'Roma'),
('D4', 'HR', 'Torino');

INSERT INTO Impiegato (Cognome, Stipendio, Dipartimento) VALUES
('Rossi', 80, 'D1'),
('Bianchi', 55, 'D1'),
('Verdi', 40, 'D1'),
('Neri', 70, 'D2'),
('Gialli', 65, 'D2'),
('Blu', 50, 'D2'),
('Rosa', 90, 'D3'),
('Viola', 45, 'D3'),
('Grigi', 62, 'D4'),
('Marroni', 30, 'D4');

UPDATE Dipartimento
SET Direttore = 1
WHERE Codice = 'D1';

UPDATE Dipartimento
SET Direttore = 4
WHERE Codice = 'D2';

UPDATE Dipartimento
SET Direttore = 7
WHERE Codice = 'D3';

UPDATE Dipartimento
SET Direttore = 9
WHERE Codice = 'D4';

INSERT INTO Progetto (Sigla, Nome, Bilancio, Responsabile) VALUES
('P1', 'AI System', 200, 1),
('P2', 'Web Platform', 120, 4),
('P3', 'Mobile App', 80, 5),
('P4', 'Market Analysis', 150, 7),
('P5', 'HR Tool', 60, 9);

INSERT INTO Partecipazione VALUES
(1, 'P1'),
(2, 'P1'),
(2, 'P2'),
(3, 'P2'),
(4, 'P2'),
(5, 'P3'),
(5, 'P1'),
(6, 'P3'),
(7, 'P4'),
(8, 'P4'),
(9, 'P5');