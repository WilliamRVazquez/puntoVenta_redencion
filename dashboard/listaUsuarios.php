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
    <?php include('../modal/usuariosdata.php')?>
        <div class="container-fluid">
            <h1>LISTA DE USUARIOS</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th>USUARIO</th>
                        <th>NOMBRE</th>
                        <th>ROL</th>
                    </tr>
                   
                </thead>
                <tbody>
                    <?php 
                        while ($row = mysqli_fetch_array($query)) 
                        {   
                    ?>
                        <tr>
                        <th><?php echo $row['usuario']?></th>
                        <th><?php echo $row['nombre']?></th>
                        <th><?php 
                            if($row['id_cargo'] == 1){
                                echo 'Administrador';
                            }
                            else {
                                echo 'Cliente';
                            }
                            ?></th>
                        </tr>
                    
                    <?php 
                        }
                    ?>
                
                </tbody>
            </table>
        </div>
        <?php include_once ('../vistas/dash_footer.php')?>
    <?php include_once('../vistas/dash_inferior.php')?>
</body>
</html>