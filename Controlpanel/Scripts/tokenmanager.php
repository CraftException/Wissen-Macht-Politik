<?php

    function createToken ($serverip, $token, $points) {
        try {
            if (file_get_contents($serverip . "registercode?secrettoken=" . $_SESSION['token'] . "&code=" . $token . "&points=" . $points) == "1") {
                return true;
            } else {
                return false;
            }
        } catch (Exception $e) {
            return false;
        }
    }