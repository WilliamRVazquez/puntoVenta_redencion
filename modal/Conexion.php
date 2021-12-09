<?php
//$conexion = mysqli_connect("localhost", "root", "", "puntoventa_abarrotes");

    function conectar(){
        $host = "localhost";
        $user = "root";
        $pass = "";

        $db = "puntoventa_abarrotes2";

        $conexion = mysqli_connect($host, $user, $pass);

        mysqli_select_db($conexion, $db);

        return $conexion;

    }
?>