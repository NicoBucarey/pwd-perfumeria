<?php
/**
 * Script para resetear contraseñas del proyecto de portafolio
 * Todas las contraseñas serán cambiadas a "123456"
 */

include_once 'configuracion.php';
include_once $ROOT.'modelo/conector/BaseDatos.php';

$db = new BaseDatos();

if ($db->Iniciar()) {
    // MD5 de "123456"
    $nuevaPassword = md5('123456');
    
    $sql = "UPDATE usuario SET uspass = '$nuevaPassword' WHERE idusuario > 0";
    
    if ($db->Ejecutar($sql)) {
        echo "<h2>✅ Contraseñas actualizadas exitosamente</h2>";
        echo "<h3>Credenciales para el portafolio:</h3>";
        echo "<ul>";
        echo "<li><strong>Admin:</strong> admin@mail.com / 123456</li>";
        echo "<li><strong>Deposito:</strong> deposito@mail.com / 123456</li>";
        echo "<li><strong>Cliente:</strong> cliente@mail.com / 123456</li>";
        echo "<li><strong>Nico:</strong> nicolas@gmail.com / 123456</li>";
        echo "<li><strong>Todos los demás usuarios:</strong> [email] / 123456</li>";
        echo "</ul>";
        echo "<p><a href='vista/inicio/home.php'>🏠 Ir al inicio</a></p>";
    } else {
        echo "❌ Error al actualizar las contraseñas: " . $db->getError();
    }
} else {
    echo "❌ Error de conexión a la base de datos: " . $db->getError();
}
?>