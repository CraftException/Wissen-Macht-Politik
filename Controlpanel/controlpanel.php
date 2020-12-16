<?php

    include 'Scripts/authorize.php';
    include 'Scripts/tokenmanager.php';
    include 'Scripts/postmanager.php';

    session_start();
    if (!(isset($_SESSION['token']) || isset($_SESSION['serverip']))) {
        header('location:register.php');
        die;
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

        <link rel="stylesheet" type="text/css" href="assets/stylesheets/controlpanel.css">

        <title>Wissen Macht Politik - Control Panel</title>
    </head>

    <body>

        <form action="/controlpanel.php" method="post">

            <center><h1>Token erstellen</h1></center>

            <div class="container">

                <label for="points"><b>Punkte</b></label>
                <input type="number" placeholder="1" name="points" required>

                <button name="addtoken" type="submit">Bestätigen</button>

                <?php

                    if (isset($_POST["addtoken"])) {
                        $token = rand(0,99999);
                        createToken($_SESSION['serverip'], $token, $_POST["points"]);
                        ?>
                            Token: <?php echo $token; ?>
                        <?php
                    }

                ?>
            </div>
        </form>

        <form action="/controlpanel.php" method="post">

            <center><h1>Vote erstellen</h1></center>

            <div class="container">

                <b>Header</b>
                <input type="text" placeholder="" name="header" required><br><br>

                <b>Inhalt</b><br>
                <textarea name="desc" required></textarea><br><br>

                <b>Typ</b><br>
                <input type="radio" id="choice" name="type" value="choice">
                <label for="choice">Auswahlmöglichkeiten</label><br>
                <input type="radio" id="select" name="type" value="select">
                <label for="select">Freie Auswahl</label><br><br>

                <label for="img"><b>Bild</b></label><br>
                <input type="text" name="img" required><br><br>

                <label for="choices"><b>Auswahlmöglichkeiten (Wenn nötig). Mit einem Komma voneinander abtrennen</b></label><br>
                <input type="text" name="choices" required>

                <button name="addvote" type="submit">Bestätigen</button>


                <?php

                    if (isset($_POST["addvote"])) {
                        createVote($_SESSION['serverip'], $_POST["header"], $_POST["desc"], $_POST["img"], $_POST["type"], $_POST["choices"]);
                        ?>
                            <h2>Vote wurde erfolgreich erstellt!</h2>
                        <?php
                    }

                ?>
            </div>
        </form>        
        
        <form action="/controlpanel.php" method="post">

            <center><h1>Info erstellen</h1></center>

            <div class="container">

                <b>Header</b>
                <input type="text" placeholder="" name="header" required><br><br>

                <b>Inhalt</b><br>
                <textarea name="desc" required></textarea><br><br>

                <label for="img"><b>Bild</b></label><br>
                <input type="text" name="img" required><br><br>

                <button name="addinfo" type="submit">Bestätigen</button>

                <?php

                    if (isset($_POST["addinfo"])) {
                        createInfo($_SESSION['serverip'], $_POST["header"], $_POST["desc"], $_POST["img"]);
                        ?>
                            <h2>Info wurde erfolgreich erstellt!</h2>
                        <?php
                    }

                ?>
            </div>
        </form>          

        <form action="/controlpanel.php" method="post">

            <center><h1>Blog-Beitrag erstellen</h1></center>

            <div class="container">

                <b>Header</b>
                <input type="text" placeholder="" name="header" required><br><br>

                <b>Inhalt</b><br>
                <textarea name="desc" required></textarea><br><br>

                <label for="img"><b>Bild</b></label><br>
                <input type="text" name="img" required><br><br>

                <label for="author"><b>Autor</b></label><br>
                <input type="text" name="author" required><br><br>

                <label for="date"><b>Datum</b></label><br>
                <input type="date" name="date" required><br><br>

                <b>Kategorie</b><br>
                <select name="category">
                    <option value="news">Neuigkeiten</option>
                    <option value="covid">Covid-19</option>
                    <option value="germany">Deutschland</option>
                </select>

                <button name="addblog" type="submit">Bestätigen</button>

                <?php

                    if (isset($_POST["addblog"])) {
                        createInfo($_SESSION['serverip'], $_POST["header"], $_POST["desc"], $_POST["img"], $_POST["author"], $_POST["date"], $_POST["category"]);
                        ?>
                            <h2>Blog-Post wurde erfolgreich erstellt!</h2>
                        <?php
                    }

                ?>
            </div>
        </form>                        

    </body>

</html>