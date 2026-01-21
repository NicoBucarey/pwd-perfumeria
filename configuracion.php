<?php

header('Content-Type: text/html; charset=utf-8');
header("Cache-Control: no-cache, must-revalidate");

/////////////////////////////
// CONFIGURACION APP//
/////////////////////////////

$PROYECTO ='pwd-perfumeria';

//variable que almacena el directorio del proyecto
$ROOT = __DIR__ . "/";

include_once($ROOT.'util/funciones.php');

// Variable que define la pagina de autenticacion del proyecto
$host = $_SERVER['HTTP_HOST'];
$INICIO = "Location:https://$host/vista/inicio/home.php";

// variable que define la pagina principal del proyecto (menu principal)
$PRINCIPAL = "Location:https://$host/vista/inicio/home.php";

$_SESSION['ROOT']=$ROOT;

?>