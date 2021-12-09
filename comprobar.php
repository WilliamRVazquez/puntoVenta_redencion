<?php
include_once ('modal/Conexion.php');

$conexion= conectar();

$usuario=$_POST['usuario'];
$contraseña=$_POST['contraseña'];
session_start();

$_SESSION['usuario' ]= $usuario;

$consulta="SELECT * FROM `usuarios` WHERE `usuario` ='$usuario' AND `password`='$contraseña'";
$query=mysqli_query($conexion, $consulta );

$filas=mysqli_fetch_array($query);

// En caso de que las casillas del Login esten vacias o que en una le falte informacion
if (isset($_POST['usuario']) && isset($_POST['contraseña']) && $filas['id_cargo']==1) 
{
    header("location:dashboard/dashboard.php");
}
else{
    header("location:login.php");
}

//ESTE CODIGO NO SE OCUPA, PERO NO LO BORREN POR SI ACASO
/*if($filas['id_cargo']==1){
    header("location:index.php");
}
else
if($filas['id_cargo']==2){
    header("location:cliente.php");
}

else{
    ?>
    <?php
    include("index.php");
    ?>
    <h1 class="bad">ERROR DE AUTENTIFICACION</h1>
    <?php
}
*/
mysqli_free_result($resultado);
mysqli_close($conexion);