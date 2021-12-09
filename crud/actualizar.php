<?php

    include ('../modal/Conexion.php');
    $conexion = conectar();

    $id = $_GET['id'];

    $consulta = "SELECT * FROM `productos` WHERE 1`id`='$id'";
    $query = mysqli_query($conexion, $consulta);

    $row = mysqli_fetch_array($query);
?>