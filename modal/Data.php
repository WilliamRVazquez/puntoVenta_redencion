<?php
    include ("Conexion.php");

    $conexion = conectar();

    $consulta = "SELECT * FROM productos";
    $query = mysqli_query($conexion, $consulta);

    $row = mysqli_fetch_array($query);



//NO BORRAR CODIGO, SOLO POR SI ACASO
/*if ($inc) {
    $consulta = "SELECT * FROM productos";
    $resultado = mysqli_query($conexion, $consulta);

    ?>
    <?php
    if ($resultado) {
        while ($row = $resultado -> fetch_array()) {
            $id = $row['id'];
            $nombre = $row['nombre'];
            $precio = $row['precio'];
            $stock = $row['stock'];
            ?>
            <tr>
            <td><?php echo $id?></td>
            <td><?php echo $nombre?></td>
            <td><?php echo '$', $precio?></td>
            <td><?php echo $stock?></td>
            <td></td>
            </tr>

            <?php
        }
    }
    ?>

    <?php

}*/
?>