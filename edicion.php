<?php
    session_start();
    $resultado = unserialize($_SESSION['resultado']); 
    $set ="";
    $_POST['DNI'] = strval($_POST['DNI']);
    foreach($_POST as $key => $value){
        $set .= '`'.$key.'`=\''.$value.'\', ';
    }
    $set = substr($set, 0, -2);
    $conexion = mysqli_connect("localhost", "root", "", "DireccionNiñez");
    if(!$conexion){
        die("Ha ocurrido un error al intentar conectarnos a la base de datos :(" . mysqli_connect_errno());
    }
    $sql = "UPDATE `Menor` SET $set WHERE `Menor`.idMenor = " . $resultado['idMenor'];
    if(mysqli_query($conexion, $sql)){
        $_SESSION['alert'] = "Edición realizada con éxito!";
        header("Location: busqueda.php?dni=".$_POST['DNI']);
    }else{
        $_SESSION['mensaje'] = "Algo salió mal: ". mysqli_error($conexion);
        header("Location: editar.php");
    }
    
?>