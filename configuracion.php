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

// Incluir clases de control
include_once($ROOT.'control/Session.php');
include_once($ROOT.'control/AbmProducto.php');
include_once($ROOT.'control/AbmUsuario.php');
include_once($ROOT.'control/AbmRol.php');
include_once($ROOT.'control/AbmCompra.php');
include_once($ROOT.'control/AbmCompraItem.php');
include_once($ROOT.'control/AbmCompraEstado.php');
include_once($ROOT.'control/AbmMenu.php');
include_once($ROOT.'control/AbmMenuRol.php');
include_once($ROOT.'control/AbmUsuarioRol.php');
include_once($ROOT.'control/AbmCompraEstadoTipo.php');

// Incluir clases de modelo
include_once($ROOT.'modelo/conector/BaseDatos.php');
include_once($ROOT.'modelo/Producto.php');
include_once($ROOT.'modelo/Usuario.php');
include_once($ROOT.'modelo/Rol.php');
include_once($ROOT.'modelo/Compra.php');
include_once($ROOT.'modelo/CompraItem.php');
include_once($ROOT.'modelo/CompraEstado.php');
include_once($ROOT.'modelo/CompraEstadoTipo.php');
include_once($ROOT.'modelo/Menu.php');
include_once($ROOT.'modelo/MenuRol.php');
include_once($ROOT.'modelo/UsuarioRol.php');

// Variable que define la pagina de autenticacion del proyecto
$host = $_SERVER['HTTP_HOST'];
$INICIO = "Location:https://$host/vista/inicio/home.php";

// variable que define la pagina principal del proyecto (menu principal)
$PRINCIPAL = "Location:https://$host/vista/inicio/home.php";

$_SESSION['ROOT']=$ROOT;

?>