<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="../css/cssTienda/bootstrap.min.css">
<?php include("../vistas/dash_head.php");?>
<body>
    <?php
    include("../vistas/dash_superior.php")
    ?>
    <!--CONTENIDO A CREAR -->
    <div class="container" id="main">
        <div class="row">
            <div class="col-md-12">
                <fieldset>
                    <legend>Datos del producto</legend>
                    <form  method="POST" action="../crud/insert.php" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3"><br>
                                    <label class="form-label">Codigo</label>
                                    <input type="text" REQUIRED class="form-control" name="codigo" value="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3"><br>
                                    <label class="form-label">Nombre</label>
                                    <input type="text" REQUIRED class="form-control" name="nombre" value="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3"><br>
                                    <label class="form-label">Descripcion</label>
                                    <input type="text" REQUIRED class="form-control" name="descripcion" value="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Precio</label>
                                    <input type="number" REQUIRED class="form-control" name="precio" placeholder="$0" value="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Stock</label>
                                    <input type="number" REQUIRED class="form-control" name="prodExis" placeholder="0" value="">
                                </div>
                            </div>
                        </div>

                        <input type="submit" value="Añadir" class="btn btn-primary btn-block">
                        <a href="listaProductos.php" class="btn btn-default">Cancelar</a>
                    </form>
                </fieldset>
            </div>
        </div>
    </div>

    <?php include_once ('../vistas/dash_footer.php')?>

    </div>
    <?php
        include("../vistas/dash_inferior.php")
    ?>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="../js/jsTienda/bootstrap.min.js"></script>
</body>
</html>