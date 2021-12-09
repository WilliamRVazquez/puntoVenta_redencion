<?php session_start();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="css/cssTienda/bootstrap.min.css">

    <title>Tienda || Abarrotes</title>

    <style>
        body{
            background: #fff2e0e1;
        }
        
        thead{
            background: #fb9509;
            color: #fff;
        }
    </style>

</head>
<body>
<?php include('modal/Data.php')?>

    <nav class="navbar  navbar-expand-lg navbar-light" style="background-color: #d68112; ">
        <div class="container-fluid">
          <a class="navbar-brand">
            <img src="img/logocircular.png" alt="" width="80" height="80">
          </a>
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="" aria-label="Search">
            <button class="btn btn-outline-dark" type="submit">Buscar</button>
          </form>
        </div>
      </nav>

    <nav class="navbar navbar-dark bg-dark navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-fill w-100 me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="index.php">Inicio</a>
                </li>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Productos</a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">Bebidas</a></li>
                    <li><a class="dropdown-item" href="#">Frutas y verduras</a></li>
                    <li><a class="dropdown-item" href="#">Farmacia</a></li>
                    <li><a class="dropdown-item" href="#">Abarrotes</a></li>
                    <li><a class="dropdown-item" href="#">Lacteos</a></li>
                    <li><a class="dropdown-item" href="#">Dulceria</a></li>
                    <li><a class="dropdown-item" href="#">Botanas</a></li>
                    <li><a class="dropdown-item" href="#">Higiene personal</a></li>
                </ul>
                </li>
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <?php if (isset($_SESSION['usuario'])) {
                        echo $_SESSION['usuario'];
                    }  
                    else {
                        header('location:login.php');
                    }
                    ?></a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="index.php">Cerrar Sesion</a></li>
                </ul>
                </li>
            </ul>
            </div>
        </div>
        </nav>

        <br>
        <div align="center">
            <h3>PRODUCTOS</h3>

            <a href="carrito/carritoCompras.php"> <img src="img/shop.png" alt="carrito" width="50px"></a>
            <br><br>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>IMAGEN</th>
                    <th>PRECIO</th>
                    <th>CANTIDAD</th>

                    </tr>
                </thead>
                <tbody>
                <?php 
                        while ($row = mysqli_fetch_array($query)) 
                        {   
                    ?>
                        <tr>
                        <th><?php echo $row['id']?></th>
                        <th><?php echo $row['nombre']?></th>
                        <th><img height="75px" src="data: image/jpg; base64, <?php echo base64_encode($row['imagen']);?>" alt="producto"></th>
                        <th><?php echo $row['precio']?></th>
                        <th><form action="cliente.php" method="POST">
                            <input type="hidden" name="txtProducto" value="<?php echo $row['nombre']?>">
                            <input type="number" name="cant" value="1" width="50px">
                            <input type="hidden" name="txtPrecio" value="<?php echo $row['precio']?>">
                            <input type="submit" value="Agregar" name="btnAgregar">
                        </form></th>
                        </tr>
                    <?php
                        }
                    ?>
                </tbody>
            </table>
        </div>
        
        <?php
        
            if (isset($_REQUEST["btnAgregar"])) {
                $producto = $_REQUEST["txtProducto"];
                $cantidad = $_REQUEST["cant"];
                $precio = $_REQUEST["txtPrecio"];

                $_SESSION["carrito"][$producto]["cant"]=$cantidad;
                $_SESSION["carrito"][$producto]["precio"]=$precio;

                echo "<script>alert('Producto $producto agregado sin problemas al carrito de compras');</script>";
            }
        
        ?>
    
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="js/jsTienda/bootstrap.min.js"></script>
</body>
</html>