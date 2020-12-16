<?php

    session_start();
    echo 'Du wirst sofort weitergeleitet...';

    if (!isset($_SESSION['token']) || !isset($_SESSION['serverip'])) {
        header('location:register.php');
    } else {
        header('location:controlpanel.php');
    }

    die;