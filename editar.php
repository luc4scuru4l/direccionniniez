<?php
    session_start();
    $menor = unserialize($_SESSION['resultado']);
    $claves = array_keys($menor);
    if(isset($_SESSION['mensaje'])){
        echo "<p style='color:red;'>".$_SESSION['mensaje']."</p>";
    }
?>
<!DOCTYPE html>
<html lang="es-ar">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar</title>
</head>
<body>
    <h1>Modificar datos</h1>
    <form action="edicion.php" method="post">
        <label for="<?php echo $claves[1];?>"><?php echo $claves[1];?>:</label>
        <input type="text" name="<?php echo $claves[1];?>" value="<?php echo $menor["$claves[1]"];?>" required><br>
        <label for="<?php echo $claves[2];?>"><?php echo $claves[2];?>:</label>
        <input type="text" name="<?php echo $claves[2];?>" value="<?php echo $menor["$claves[2]"];?>" required><br>
        <label for="<?php echo $claves[3];?>">Fecha de nacimiento:</label>
        <input type="date" name="<?php echo $claves[3];?>" value="<?php echo $menor["$claves[3]"];?>" required><br>
        <label for="<?php echo $claves[4];?>"><?php echo $claves[4];?>:</label>
        <input type="number" name="<?php echo $claves[4];?>" value="<?php echo $menor["$claves[4]"];?>" min="30000000" max="99999999" required><br>
        <label for="<?php echo $claves[5];?>">Domicilio de origen:</label>
        <input type="text" name="<?php echo $claves[5];?>" value="<?php echo $menor["$claves[5]"];?>" required><br>
        <label for="<?php echo $claves[6];?>">Domicilio actual:</label>
        <input type="text" name="<?php echo $claves[6];?>" value="<?php echo $menor["$claves[6]"];?>" required><br>
        <label for="<?php echo $claves[7];?>"><?php echo $claves[7];?>:</label>
        <input type="text" name="<?php echo $claves[7];?>" value="<?php echo $menor["$claves[7]"];?>" required><br>
        <input type="submit" value="Editar">
    </form>
    <a href="resultado.php">Cancelar</a>
</body>
</html>