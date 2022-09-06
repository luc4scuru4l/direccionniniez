<?php
    function mostrarConsulta($resultado){
        echo "<table border = 1 style='text-align:center'>";

        for($c = 0; $c < mysqli_num_fields($resultado); $c++){
            $info_campo = mysqli_fetch_field_direct($resultado, $c);
            echo "<th>" . $info_campo -> name . "</th>";
        }

        while($fila = mysqli_fetch_array($resultado)){
            echo "<tr>";
            for($c = 0; $c < mysqli_num_fields($resultado); $c++){
                echo "<td>" . $fila[$c]. "</td>";
            }
            echo "</tr>";
        }

        echo "</table>";
    }
    session_start();
    $resultado = unserialize($_SESSION['resultado']);
    $fechaDeNacimiento = new DateTime($resultado['FechaDeNacimiento']);
    $hoy = new DateTime();
    $edad = $hoy->diff($fechaDeNacimiento);

    $conexion = mysqli_connect("localhost", "root", "", "DireccionNiñez");
    if(!$conexion){
        die("Ha ocurrido un error al intentar conectarnos a la base de datos :(" . mysqli_connect_errno());
    }
    $sql = "SELECT P.`Nombre` AS `Parentesco`, C.`Nombre`, C.`Apellido`, C.`DNI`, C.`Telefono1`, C.`Telefono2` FROM `Menor` 
    INNER JOIN `Contacto-Menor` CM 
    ON `Menor`.`idMenor` = CM.`idMenor` 
    INNER JOIN `Contacto` C 
    ON C.`idContacto` = CM.`idContacto` 
    INNER JOIN `Parentesco` P 
    ON P.`idParentesco` = CM.`idParentesco` 
    WHERE `Menor`.`idMenor` = " . $resultado['idMenor'];
    $query = mysqli_query($conexion, $sql);

    $sql2 = "SELECT R.`Nombre` AS `Rol`, P.`Nombre`, P.`Apellido`, P.`DNI`, P.`Domicilio`, P.`Telefono1`, P.`Telefono2` FROM `Menor` 
    INNER JOIN `Personal-Menor` PM 
    ON `Menor`.`idMenor` = PM.`idMenor` 
    INNER JOIN `Personal` P 
    ON P.`idPersonal` = PM.`idPersonal` 
    INNER JOIN `Rol` R 
    ON R.`idRol` = P.`idRol` 
    WHERE `Menor`.`idMenor` = " . $resultado['idMenor'];
    $query2 = mysqli_query($conexion, $sql2);
    if(isset($_SESSION['alert'])){
        echo '<script language="javascript">alert("'.$_SESSION['alert'].'");</script>';
        unset($_SESSION['alert']);
    }
?>
<!DOCTYPE html>
<html lang="es-ar">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CALC</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <h1 style="text-align: center;">CALC: Sistema de gestión</h1>
    <?php
        echo "<h2 style='text-align: center;'>DNI: ".$resultado['DNI']."</h2>";
        echo "<p style='text-align: center;'><a href='editar.php'> Modificar datos </a></p>";
        echo "<div class='dos-columnas'>";
        echo "<div>";
        echo "<h3>Datos personales</h3>";
        echo "<p>";
        echo "<b>Nombre:</b> ".$resultado['Nombre']."<br>";
        echo "<b>Apellido:</b> ".$resultado['Apellido']."<br>";
        echo "<b>Fecha de nacimiento (Año/Mes/Dia):</b> ".$resultado['FechaDeNacimiento']."<br>";
        echo "<b>Edad:</b> ".$edad->y."<br>";
        echo "<b>Domicilio de origen:</b> ".$resultado['Domicilio_Origen']."<br>";
        echo "<b>Domicilio actual:</b> ".$resultado['Domicilio_Actual']."<br>";
        echo "<b>Observaciones:</b> ".$resultado['Observaciones'];
        echo "</p>";
        echo "</div>";
        echo "<div>";
        echo "<h3>Datos complementarios</h3>";
        $filas = mysqli_num_rows($query);
        if($filas == 0){
            echo "El menor no tiene contactos.<br>";
        }elseif($filas == 1){
            echo "<h4>Contacto:</h4>";
            mostrarConsulta($query);
        }else{
            echo "<h4>Contactos:</h4>";
            mostrarConsulta($query);
        }
        echo"<h3>Grupo de trabajo a cargo</h3>";
        mostrarConsulta($query2);
        echo "</div>";
        echo"</div>";
        unset($_SESSION['mensaje']);
    ?>
    <p class="centramelo"><a href="main.php" class="boton d-block">Realizar otra búsqueda</a></p>
</body>
</html>