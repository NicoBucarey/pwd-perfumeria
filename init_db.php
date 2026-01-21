<?php
/**
 * Script de inicialización para Railway
 * Crea las tablas y datos necesarios
 */

include_once 'configuracion.php';
include_once $ROOT.'modelo/conector/BaseDatos.php';

$db = new BaseDatos();

if ($db->Iniciar()) {
    echo "<h2>🚀 Inicializando Base de Datos en Railway</h2>";
    
    // Leer y ejecutar el archivo SQL
    $sqlFile = $ROOT . 'modelo/conector/bdcarritocompras.sql';
    $sql = file_get_contents($sqlFile);
    
    // Dividir el SQL en statements
    $statements = explode(';', $sql);
    
    $success = 0;
    $errors = 0;
    
    foreach ($statements as $statement) {
        $statement = trim($statement);
        if (!empty($statement)) {
            if ($db->Ejecutar($statement)) {
                $success++;
            } else {
                $errors++;
                echo "<p style='color: orange;'>⚠️ " . $db->getError() . "</p>";
            }
        }
    }
    
    echo "<h3>✅ Resultados:</h3>";
    echo "<p>🟢 Statements exitosos: $success</p>";
    echo "<p>🔴 Errores: $errors</p>";
    
    if ($errors == 0) {
        echo "<h3>🎉 ¡Base de datos inicializada correctamente!</h3>";
        echo "<p><strong>Credenciales:</strong></p>";
        echo "<ul>";
        echo "<li>Admin: admin@mail.com / 123456</li>";
        echo "<li>Deposito: deposito@mail.com / 123456</li>";
        echo "<li>Cliente: cliente@mail.com / 123456</li>";
        echo "</ul>";
    }
    
} else {
    echo "<h2>❌ Error de conexión</h2>";
    echo "<p>Error: " . $db->getError() . "</p>";
    echo "<p>Verifica que MySQL esté configurado en Railway.</p>";
}
?>