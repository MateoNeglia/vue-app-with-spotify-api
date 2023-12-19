<?php header("Access-Control-Allow-Origin: *");

$cnx = mysqli_connect('localhost', 'id21660595_root', 'Password@123','id21660595_apdm_neglia_mateo' );

function traer_usuarios($cantidad = null ) {
	global $cnx;
	$c = "SELECT * FROM users ORDER BY user_id";
	if($cantidad != null){
		$c.=" limit $cantidad";
	}
	$f = mysqli_query($cnx, $c);
	$retorno = array();
	
	while($a = mysqli_fetch_assoc($f)){
		$retorno[] = $a;
	}
		
	return json_encode($retorno);
	
}

function traer_albumes() { 
	global $cnx;
	$c = "SELECT * FROM album_ids ORDER BY album_id";	
	$f = mysqli_query($cnx, $c);
	$retorno = array();
	
	while($a = mysqli_fetch_assoc($f)){
		$retorno[] = $a;
	}
		
	return json_encode($retorno);
	
}

function logIn($nombre, $password) {
    global $cnx;
    $query = "SELECT * FROM users WHERE email = ?";
    $stmt = mysqli_prepare($cnx, $query);
    mysqli_stmt_bind_param($stmt, "s", $nombre);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    
    if ($result && $a = mysqli_fetch_assoc($result)) {
        if (password_verify($password, $a['password'])) {            
            return json_encode($a);
        }
    }
    
    return false;
}

function register($email, $password, $name, $last_name, $nick_name, $user_role) {
    $hashPass = password_hash($password, PASSWORD_DEFAULT);
    global $cnx;
    $query = "INSERT INTO users (email, password, name, nick_name, last_name, user_role) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($cnx, $query);
    mysqli_stmt_bind_param($stmt, "sssssi", $email, $hashPass, $name, $nick_name, $last_name, $user_role);
    mysqli_stmt_execute($stmt);

    $affectedRows = mysqli_stmt_affected_rows($stmt);
    mysqli_stmt_close($stmt);

    if ($affectedRows > 0) {        
        return json_encode(['message' => 'Registration successful']);
    } else {        
        return json_encode(['error' => 'Registration failed']);
    }
}



?>