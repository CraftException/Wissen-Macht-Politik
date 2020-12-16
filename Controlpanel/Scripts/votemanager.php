<?php

    function getVotes ($serverip, $header) {

        $rawcontent = file_get_contents($serverip . "getvoteinsurvey?secrettoken=" . $_SESSION['token'] . "&header='" . $header);
        $rawcontent = ltrim($rawcontent, '[');
        $rawcontent = rtrim($rawcontent, ']');

        $content = array();
        foreach (explode(",",$rawcontent) as $vote) {
            array_push($content,$vote);
        }
        return $content;

    }