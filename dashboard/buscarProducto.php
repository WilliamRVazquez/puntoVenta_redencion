<!DOCTYPE html>
<html lang="es">
<?php include_once ('../vistas/dash_head.php')?>
<style>
    thead{
        background: #fb9509;
        color: #fff;
    }
</style>
<body>
    <?php include_once('../vistas/dash_superior.php')?>
    <?php include('../modal/Data.php')?>
        <div class="container-fluid">
                            <h1>Agregar Producto</h1>
                            <form action="" method="get" class="form_search">
                                <input type="text" name="busqueda" id="buscqueda" placeholder="Buscar...">
                                <input type="submit" name="buscar" value="Buscar" class="btnSearch">
                            </form>
                            <br><hr>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>CODIGO</th>
                                        <th>NOMBRE</th>
                                        <th>DESCRIPCION</th>
                                        <th>PRECIO</th>
                                        <th>ACCION</th>
                                        <th></th>
                                    </tr>
                                </thead>
                            <tbody>
                            <?php 
                                if (isset($_GET['buscar'])) {
                                    $busqueda = $_GET['busqueda'];
                                    $conexion = Conectar();
                            
                                    $consulta = "SELECT * FROM `productos` WHERE (`codigo` LIKE '%$busqueda%') OR (`nombre` LIKE '%$busqueda%')";
                                    $query = mysqli_query($conexion, $consulta);

                                    while($row = mysqli_fetch_array($query)){
                                
                            ?>
                                <tr>
                                    <th><?php echo $row['codigo']?></th>
                                    <th><?php echo $row['nombre']?></th>
                                    <th><?php echo $row['descripcion']?></th>
                                    <th><?php echo "$". $row['precio']?></th>
                                    <th><form action="buscarProducto.php" method="POST">
                                            <input type="hidden" name="txtId" value="<?php echo $row['id']?>">
                                            <input type="hidden" name="txtCodigo" value="<?php echo $row['codigo']?>">
                                            <input type="hidden" name="txtNombre" value="<?php echo $row['nombre']?>">
                                            <input type="hidden" name="txtDescripcion" value="<?php echo $row['descripcion']?>">
                                            <input type="hidden" name="txtPrecio" value="<?php echo $row['precio']?>">
                                            <input type="hidden" name="txtStock" value="<?php echo $row['prodExis']?>">
                                            <input type="number" name="cant" value="1" width="50px">
                                            <input type="submit" value="Agregar" name="btnAgregar">
                                        </form></th>
                                </tr>
                            <?php
                                }
                            }
                            ?>
                            </tbody>
                            </table>
                            <a href="dashboard.php"><button id="cerrar" class="buscarP">Cerrar</button></a>

                            <?php
                                if (isset($_REQUEST["btnAgregar"])) {
                                    $producto = $_REQUEST['txtNombre']; 
                                    $codigo = $_REQUEST['txtCodigo'];
                                    $descripcion = $_REQUEST['txtDescripcion'];
                                    $cantidad = $_REQUEST['cant'];
                                    $precio = $_REQUEST['txtPrecio'];

                                    $_SESSION["carrito"][$producto]["code"] = $codigo;
                                    $_SESSION["carrito"][$producto]["name"] = $producto;
                                    $_SESSION["carrito"][$producto]["desc"] = $descripcion;
                                    $_SESSION["carrito"][$producto]["canti"] = $cantidad;
                                    $_SESSION["carrito"][$producto]["precio"] = $precio;

                                    echo "<script>alert('Producto $codigo $producto $descripcion Agregado con exito.');</script>";
                                }
                            ?>
        </div>

</body>
</html>