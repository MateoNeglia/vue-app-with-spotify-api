<?php header("Access-Control-Allow-Origin: *"); 

include('conexion.php');

$query = "SELECT * FROM reviews";

$res = mysqli_query($cnx, $query);

$salida = [];

while($fila = mysqli_fetch_assoc($res)) {
    $salida[] = $fila;
}

echo json_encode($salida);

