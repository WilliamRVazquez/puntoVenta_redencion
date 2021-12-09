<?php

    include ('../modal/Conexion.php');

    $conexion = conectar();

    $id = $_REQUEST['id'];
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $precio = $_POST['precio'];
    $stock = $_POST['stock'];

    $consulta = "UPDATE `productos` SET `codigo`='$codigo', `nombre`='$nombre', `descripcion`='$descripcion', `precio`='$precio',`prodExis`='$stock' WHERE `id`='$id'";
    $resultado = $conexion -> query($consulta);


    if ($resultado) {
        header("location:../dashboard/listaProductos.php");
    }

?>