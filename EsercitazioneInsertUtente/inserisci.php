<?php
    if($_SERVER["REQUEST_METHOD"] === "POST") {
        // Recupero dati
        $id_utente = $_POST["id_utente"];
        $nome = $_POST["nome"];
        $cognome = $_POST["cognome"];
        $email = $_POST["e-mail"];
        $eta = $_POST["eta"];
        $errori = [];

        // Controllo id_utente
        if (empty($id_utente)) {
            $errori[] = "L'id_utente è obbligatorio.";
        } elseif (mb_strlen($id_utente) > 5) {
            $errori[] = "L'id_utente non può superare 5 caratteri.";
        }
        
        // Controllo nome
        if (empty($nome)) {
            $errori[] = "Il nome è obbligatorio.";
        } elseif (mb_strlen($nome) > 50) {
            $errori[] = "Il nome non può superare 50 caratteri.";
        }

        // Controllo cognome
        if (empty($cognome)) {
            $errori[] = "Il cognome è obbligatorio.";
        } elseif (mb_strlen($cognome) > 50) {
            $errori[] = "Il cognome non può superare 50 caratteri.";
        }

        // Controllo email
        if (empty($email)) {
            $errori[] = "L'email è obbligatoria.";
        } elseif (mb_strlen($email) > 254) {
            $errori[] = "L'email non può superare 254 caratteri.";
        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $errori[] = "Formato email non valido.";
        }

        //Controllo eta
        if (empty($eta)) {
            $errori[] = "L'età è obbligatoria.";
        } elseif ((int)$eta < 14) {
            $errori[] = "L'età non può essere inferiore a 14 anni.";
        }

        // Risultato
        if (empty($errori)) {
            echo "Dati validi ✅";

            $host = "localhost";
            $user = "root";
            $psw = "";
            $db = "EsercitazioneCreateTable";

            $conn = new mysqli($host, $user, $psw, $db);
            
            if ($conn->connect_error) {
                 die("Errore di connessione: " . $conn->connect_error);
            }

            $sql = "INSERT INTO Utenti(ID_utente, Nome, Cognome, Mail, Eta)
                    VALUES ('$id_utente', '$nome', '$cognome', '$email', $eta)";

            if ($conn -> query($sql)) { 
                echo "Dati inseriti correttamente";
            } else { 
                echo "Errore: " . mysqli_error($conn);
            }

            $conn -> close();
        } else {
            foreach ($errori as $errore) {
                echo "<p style='color:red;'>$errore</p>";
            }
        }
    }    
?>