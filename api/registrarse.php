<?php header("Access-Control-Allow-Origin: *");

include('conexion.php');

$email = $_POST["email"];
$password = $_POST["password"];
$name = $_POST["name"];
$last_name = $_POST["last_name"];
$nick_name = $_POST["nick_name"];
$user_role = $_POST["user_role"];

$usuario_registrado = register( $email, $password, $name, $last_name, $nick_name, $user_role );

echo($usuario_registrado); 	


?>