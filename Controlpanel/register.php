<?php

    include 'Scripts/authorize.php';

    session_start();
    if (isset($_SESSION['token']) && isset($_SESSION['serverip'])) {
        header('location:controlpanel.php');
        die;
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isCorrectToken($_POST['serverip'], $_POST['token'])) {
            $_SESSION['serverip'] = $_POST['serverip'];
            $_SESSION['token'] = $_POST['token'];
            header('location:controlpanel.php');
        }
    }

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <meta name="author" content="CraftException">
        <meta name="description" content="The Controlpanel for the Channel 'Wissen Macht Politik'">
        <meta name="keywords" content="Politic, Wissen">

        <link rel="stylesheet" type="text/css" href="assets/stylesheets/register.css">
    </head>

    <body>

        <form action="/register.php" method="post">

            <center><h1>WMP Controlpanel</h1></center>

            <div class="container">
                <label for="uname"><b>Serveradresse</b></label>
              <input type="text" placeholder="https://services.wmp.de" name="serverip" required>

                <label for="psw"><b>Passwort</b></label>
                <input type="password" placeholder="wmpiscool :P" name="token" required>

                <button type="submit">Bestätigen</button>
            </div>
        </form>
    </body>

</html>