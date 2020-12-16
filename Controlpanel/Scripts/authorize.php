<?php

    function isCorrectToken ($serverip, $token) {
        try {
            if (file_get_contents($serverip . "isCorrect?secrettoken=" . $token) == "1") {
                return true;
            } else {
                return false;
            }
        } catch (Exception $e) {
            return false;
        }
    }