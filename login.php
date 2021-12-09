<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Login</title>
    
    <style>
        body{
            margin: 0;
            padding: 0;
            background: url(img/desen.png);
            background-size: cover;
            background-position: center;
            font-family: sans-serif;
        }
    </style>
</head>
<body>
    <div class="modal-body modal-dialog ">
        <div class="container col-lg-11 row justify-conent-center pt-5 mt-5 m-1">
            <div class="modal-content col-lg-9 ">
                <form class="text-center" action="comprobar.php" method="post"><br>
                    <img src="img/logo.png" width="50%" height="auto" class="img-fluid">
                    <div class="mb-2 mx-sm-5"><br>
                        <input type="text" class="form-control" placeholder="Ingresar usuario" name="usuario">
                    </div><br>
                    <div class="mb-3 mx-sm-5">
                        <input type="password" class="form-control" placeholder="Ingresar contraseña" name="contraseña">
                    </div><br>
                    <button type="submit" class="btn btn-dark">Entrar</button>

                </form><br>
            </div>
        </div>
    </div>
</body> 
</html>