<?php

    include ('../modal/Conexion.php');

    $conexion = conectar();

    $producto = $_GET['id'];

    $consulta = "DELETE FROM `productos` WHERE `id`='$producto'";
    $query = mysqli_query($conexion, $consulta);

    if ($query) {
        header("location:../dashboard/listaProductos.php");
    }
    else {
        echo 'Hay un error';
    }

?>