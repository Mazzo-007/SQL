USE EsercitazioneCreateTable;

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

SELECT U.Nome, L.Titolo 
	FROM Utenti U 
		JOIN Prestiti P 
			ON U.ID_utente = P.ID_utente 
		JOIN Libri L 
			ON L.ID_libro = P.ID_libro;
            
SELECT P.* 
FROM Prestiti P JOIN Utenti U ON P.ID_utente = U.ID_utente 
WHERE U.Cognome LIKE 'Galli';

SELECT L.*
FROM Libri L JOIN Prestiti P ON L.ID_libro = P.ID_libro
WHERE L.Titolo LIKE '%storia%';

SELECT DISTINCT U.Mail
FROM Utenti U JOIN Prestiti P ON U.ID_utente = P.ID_utente;

SELECT L.Titolo
FROM Libri L JOIN Prestiti P ON L.ID_libro = P.ID_libro
WHERE L.Anno_pubblicazione BETWEEN 1500 AND 1700;


SELECT * FROM Utenti WHERE Cognome LIKE 'B%';

SELECT DISTINCT L.*
FROM Libri L JOIN Prestiti P ON L.ID_libro = P.ID_libro
WHERE P.Data_prestito BETWEEN '2025-01-01' AND '2025-12-31';

SELECT L.*
FROM Libri L JOIN Prestiti P ON L.ID_libro = P.ID_libro
JOIN Utenti U ON P.ID_utente = U.ID_utente
WHERE U.Mail LIKE 'nicolo.rossi@gigi.com'; 

SELECT L.Titolo, U.Nome, U.Cognome, P.Data_prestito 
FROM Utenti U, Libri L, Prestiti P WHERE U.ID_utente = P.ID_utente AND L.ID_libro = P.ID_libro AND P.Data_prestito BETWEEN '2021-01-01' AND '2025-12-31';



    
