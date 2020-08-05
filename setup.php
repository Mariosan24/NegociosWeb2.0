<?php

  require("./models/security/security.model.php");

  // geenrar la contraseña salada (salting)
  $usuario = obtainUserByEmail('admin@demo.com');
  if(empty($usuario)){
    $pswd = 'socazon20';
    $timestamp = time();
    $password = "";
    if($timestamp%2==0){
      $password = "admin@demo.com".$pswd.$timestamp;
    }
    else{
      $password = $timestamp."admin@demo.com".$pswd;
    }
    $password = md5($password.$timestamp);

    $result = newUser('admin@demo.com','Administrador',$password,$timestamp).addRole('ADM',1);
    
    echo "Administrador creado: correo: admin@demo.com, contraseña: socazon20";
    echo "<br /><br />Cambiarla lo mas pronto posible";
  }
?>
