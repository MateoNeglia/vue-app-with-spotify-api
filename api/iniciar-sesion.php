<?php header("Access-Control-Allow-Origin: *");

include('conexion.php');

$nombre = $_POST["email"];
$password = $_POST["password"];

$usuario_logeado = logIn( $nombre, $password );

echo($usuario_logeado); 	


?>