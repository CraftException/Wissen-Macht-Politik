<?php

include 'Scripts/authorize.php';
include 'Scripts/votemanager.php';

session_start();
if (!(isset($_SESSION['token']) || isset($_SESSION['serverip']))) {
    header('location:register.php');
    die;
}

if (!(isset($_GET['header']))) {
    header('location:controlpanel.php');
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

<form>

    <center><h1>Votes einer Umfrage</h1></center>

    <center><div class="container">

        <ul>
        <?php
        foreach (getVotes($_SESSION['serverip'], $_GET["header"]) as $vote) {
            ?>
                <li><?php echo $vote; ?></li>
            <?php
        }
        ?>
        </ul>

    </div>

        <button onclick="window.location.href='controlpanel.php'" style="max-width: 70%">Zurück</button>
    </center>
</form>

</body>

</html>