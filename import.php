<?php
include_once 'configuracion.php';
include_once $ROOT.'modelo/conector/BaseDatos.php';

echo "<h2>🚀 Importando Base de Datos desde phpMyAdmin</h2>";

$db = new BaseDatos();

if ($db->Iniciar()) {
    echo "<p style='color: green;'>✅ Conectado a Railway MySQL</p>";
    
    // Leer archivo SQL
    $sqlFile = $ROOT . 'modelo/conector/database.sql';
    
    if (file_exists($sqlFile)) {
        echo "<p>📂 Leyendo archivo: database.sql</p>";
        
        $sql = file_get_contents($sqlFile);
        
        // Dividir en statements individuales
        $statements = array_filter(array_map('trim', explode(';', $sql)));
        
        $success = 0;
        $errors = 0;
        
        echo "<h3>🔄 Ejecutando statements...</h3>";
        
        foreach ($statements as $statement) {
            if (!empty($statement) && !preg_match('/^\s*--/', $statement)) {
                
                // Mostrar solo los primeros 50 caracteres del statement
                $preview = substr(str_replace(["\n", "\r"], ' ', $statement), 0, 50) . '...';
                echo "<p>▶️ " . htmlspecialchars($preview) . "</p>";
                
                if ($db->Ejecutar($statement)) {
                    $success++;
                    echo "<p style='color: green; margin-left: 20px;'>✅ Éxito</p>";
                } else {
                    $errors++;
                    $error = $db->getError();
                    echo "<p style='color: orange; margin-left: 20px;'>⚠️ " . htmlspecialchars($error) . "</p>";
                }
            }
        }
        
        echo "<h3>📊 Resumen:</h3>";
        echo "<ul>";
        echo "<li>🟢 Statements exitosos: <strong>$success</strong></li>";
        echo "<li>🔴 Errores: <strong>$errors</strong></li>";
        echo "</ul>";
        
        if ($success > 0) {
            echo "<h3>🎉 ¡Importación completada!</h3>";
            echo "<p>✅ Las contraseñas son: <strong>123456</strong></p>";
            echo "<p><a href='vista/inicio/home.php' style='background: green; color: white; padding: 10px; text-decoration: none;'>🏠 Ver sitio con productos</a></p>";
        }
        
    } else {
        echo "<p style='color: red;'>❌ No se encontró el archivo database.sql</p>";
    }
    
} else {
    echo "<p style='color: red;'>❌ Error de conexión: " . $db->getError() . "</p>";
}
?>