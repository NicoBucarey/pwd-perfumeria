<?php
/**
 * Test de conexión a MySQL en Railway
 */

echo "<h2>🔍 Diagnóstico de BD en Railway</h2>";

echo "<h3>Variables de entorno disponibles:</h3>";
echo "<pre>";

// Verificar variables con getenv() y $_ENV
$mysqlVars = ['MYSQLHOST', 'MYSQLDATABASE', 'MYSQLUSER', 'MYSQLPASSWORD', 'MYSQLPORT'];
foreach($mysqlVars as $var) {
    $value1 = getenv($var);
    $value2 = $_ENV[$var] ?? 'NO SET';
    echo "$var:\n";
    echo "  getenv(): " . ($value1 ? '[CONFIGURADO]' : 'NO SET') . "\n";
    echo "  \$_ENV: " . ($value2 !== 'NO SET' ? '[CONFIGURADO]' : 'NO SET') . "\n\n";
}
echo "</pre>";

echo "<h3>Intentando conexión manual:</h3>";

// Intentar con diferentes configuraciones
$configs = [
    'Configuración 1 (getenv)' => [
        'host' => getenv('MYSQLHOST') ?: 'localhost',
        'database' => getenv('MYSQLDATABASE') ?: 'bdcarritocompras',
        'user' => getenv('MYSQLUSER') ?: 'root',
        'pass' => getenv('MYSQLPASSWORD') ?: ''
    ],
    'Configuración 2 ($_ENV)' => [
        'host' => $_ENV['MYSQLHOST'] ?? 'localhost',
        'database' => $_ENV['MYSQLDATABASE'] ?? 'bdcarritocompras',
        'user' => $_ENV['MYSQLUSER'] ?? 'root',
        'pass' => $_ENV['MYSQLPASSWORD'] ?? ''
    ]
];

foreach($configs as $name => $config) {
    echo "<p><strong>$name:</strong></p>";
    echo "<ul>";
    echo "<li>Host: " . ($config['host'] ?: 'NO CONFIGURADO') . "</li>";
    echo "<li>Database: " . ($config['database'] ?: 'NO CONFIGURADO') . "</li>";
    echo "<li>User: " . ($config['user'] ?: 'NO CONFIGURADO') . "</li>";
    echo "<li>Password: " . (empty($config['pass']) ? 'NO CONFIGURADO' : '[CONFIGURADO]') . "</li>";
    echo "</ul>";
    
    if (!empty($config['host']) && !empty($config['database'])) {
        try {
            $dns = "mysql:dbname={$config['database']};host={$config['host']}";
            $pdo = new PDO($dns, $config['user'], $config['pass']);
            echo "<p style='color: green;'>✅ CONEXIÓN EXITOSA</p>";
            break;
        } catch (Exception $e) {
            echo "<p style='color: red;'>❌ Error: " . $e->getMessage() . "</p>";
        }
    } else {
        echo "<p style='color: orange;'>⚠️ Faltan variables de entorno</p>";
    }
}

echo "<h3>Instrucciones:</h3>";
echo "<p>Si ves variables vacías, ve a Railway → MySQL → Connect → y copia las variables al proyecto pwd-perfumeria</p>";
?>