<?php
    $servername = "https://se.mfu.ac.th/phpmyadmin";
    $username = "wd22annop";
    $password = "6331305031";
    $dbname = "md22_annop_db";
    $table = "mfuwallet";

    $action = $_POST["action"];

    $conn = new mysqli($servername, $username, $password, $dbname);

    if($conn->connect_error){
        die("Connection failed: " . $conn->connect_error);
        return;
    }
    
    //get all db base
    
    




?>