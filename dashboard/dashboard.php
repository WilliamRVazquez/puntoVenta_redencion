<?php 
    include_once ('../vistas/dash_head.php');
?>

<body id="page-top">
    <?php include_once('../vistas/dash_superior.php')?>

        <!-- CONTENIDO DEL DASHBOARD -->
        <div class="container-fluid">
                    <!-- Lista de Contenido -->
                        <a href="buscarProducto.php"><button class="buscarP" id="abrir">Agregar Producto</button></a>
                        <a href="dashboard.php?vaciar=true"><button class="buscarP" id="abrir">Vaciar</button></a>
                            <h1>LISTA DE PRODUCTOS</h1>
                            <br>
                            <?php

                                    $total = 0;
                                    if (isset($_SESSION["carrito"])) {
                                        ?>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>CODIGO</th>
                                        <th>NOMBRE</th>
                                        <th>DESCRIPCION</th>
                                        <th>CANTIDAD</th>
                                        <th>PRECIO</th>
                                        <th>ACCION</th>
                                    </tr>
                                </thead>
                            <tbody>
                            <?php
                                    foreach ($_SESSION["carrito"] as $indice => $arreglo) {
                                            $total += $arreglo["canti"] * $arreglo["precio"];                                        
                                            echo "<tr>";
                                            foreach ($arreglo as $key => $value) {
                                                echo "<th>" .$value. "</th>";
                                            }
                                            echo "<th><a href='dashboard.php?item=$indice' class='btn btn-danger'><i class='fas fa-trash'></a></th>";
                                            echo "</tr>";
                                        }
                                        ?>
                            </tbody>
                            </table>
                            <?php
                                    }
                                    echo "<h1>Total: $ $total</h1>";

                                    echo "<form action='dashboard.php' method='GET'>
                                            <input type='number' name='dinero'>
                                            </form>";

                                    echo "<a href='dashboard.php?pagar=true' class='pagarButton'><button class='buscarP' id='abrir'>Pagar</button></a>";
                                    
                                    
                                    if (isset($_REQUEST["vaciar"])) {
                                        unset($_SESSION["carrito"]);
                                    }

                                    if (isset($_REQUEST["item"])) {

                                        $producto = $_REQUEST["item"];
                                        unset($_SESSION["carrito"][$producto]);
                                    }

                                    if(isset($_REQUEST["pagar"])){
                                        include ('../modal/Conexion.php');
                                        $conexion = conectar();

                                        if (isset($_GET['dinero'])) {
                                        
                                        $dinero = $_POST['dinero'];
                                        $totalDef = 0;

                                        $totalDef = $_GET['dinero'] - $total;

                                        echo "<script>alert(SU CAMBIO ES DE $$totalDef);</script>";

                                        $date = date('Y-m-d');

                                        $consulta = "INSERT INTO `venta`(`total`, `fecha`) VALUES ('$total', '$date');";
                                        $resultado = $conexion -> query($consulta);
                                        unset($_SESSION["carrito"]);
                                        }
                                    }
                            ?>
                </div>

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <?php include_once ('../vistas/dash_footer.php')?>
            <!-- End of Footer -->

        </div>

    <?php include_once('../vistas/dash_inferior.php')?>