<?php 
include ("Conexion.php");

$conexion = conectar();

$consulta = "SELECT * FROM usuarios";
$query = mysqli_query($conexion, $consulta);

$row = mysqli_fetch_array($query);

?>
