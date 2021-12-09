<?php

    include ('../modal/Conexion.php');

    $conexion = conectar();

    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $precio = $_POST['precio'];
    $productExist = $_POST['prodExis'];


    $consulta = "INSERT INTO `productos`(`codigo`,`nombre`, `descripcion` ,`precio`, `prodExis`) VALUES ('$codigo','$nombre','$descripcion','$precio','$productExist')";

    $resultado = $conexion -> query($consulta);

    if ($resultado) {
        header("location:../dashboard/listaProductos.php");
    }
    else {
        echo 'Hay un error';
    }

?>