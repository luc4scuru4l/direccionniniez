<?php
    session_start();
    $conexion = mysqli_connect("localhost", "root", "", "DireccionNiñez");
    if(!$conexion){
        die("Ha ocurrido un error al intentar conectarnos a la base de datos :(" . mysqli_connect_errno());
    }
    $dni = trim(strval($_GET['dni']));
    $sql = "SELECT * FROM Menor WHERE DNI = '$dni'";
    $query = mysqli_query($conexion, $sql);
    if(mysqli_num_rows($query) == 0){
        $_SESSION['mensaje'] = "El número de DNI $dni no se encuentra en la base de datos.";
        header("Location: main.php");
    }else{
        unset($_SESSION['mensaje']);
        $fila = mysqli_fetch_array($query,MYSQLI_ASSOC);
        $_SESSION['resultado'] = serialize($fila);
        header("Location: resultado.php");
    }
?>