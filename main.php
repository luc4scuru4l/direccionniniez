<?php
    session_start();
    //unset($_SESSION['mensaje']);
    if(isset($_SESSION['mensaje'])){
        $mensaje = $_SESSION['mensaje'];
        unset($_SESSION['mensaje']);
    }
?>
<!DOCTYPE html>
<html lang="es-ar">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CALC</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="estilos.css">
</head>
<body class="centrado fondo">
    <div class="contenedor">
        <h1>CALC: Sistema de Gestión</h1>
        <p style="color:red; font-weight:bold;"><?php echo $mensaje;?></p>
        <form action="busqueda.php" method="get">
        <label for="dni">DNI:</label>
        <input type="number" name="dni" min="30000000" max="99999999" required>
        <input type="submit" value="Buscar">
        </form>
    </div>
</body>
</html>