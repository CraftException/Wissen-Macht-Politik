<?php

    function createVote ($serverip, $header, $desc, $img, $type, $choices) {
        try {
            if (file_get_contents($serverip . "registercode?secrettoken=" . $_SESSION['token'] . "&header='" . $header . "'&desc='" . $desc. "'&img=" . $img. "&type='" . $type. "'&choices=" . $choices) == "1") {
                return true;
            } else {
                return false;
            }
        } catch (Exception $e) {
            return false;
        }
    }

    function createInfo ($serverip, $header, $desc, $img) {
        try {
            if (file_get_contents($serverip . "addinfo?secrettoken=" . $_SESSION['token'] . "&header=" . $header . "&desc=" . $desc. "&img=" . $img) == "1") {
                return true;
            } else {
                return false;
            }
        } catch (Exception $e) {
            return false;
        }
    }    

    function createBlog ($serverip, $header, $desc, $img, $author, $date, $group) {
        try {
            if (file_get_contents($serverip . "addinfo?secrettoken=" . $_SESSION['token'] . "&header=" . $header . "&desc=" . $desc. "&img=" . $img . "&author=" . $author . "&date=" . $date. "&group=" . $group) == "1") {
                return true;
            } else {
                return false;
            }
        } catch (Exception $e) {
            return false;
        }
    }        