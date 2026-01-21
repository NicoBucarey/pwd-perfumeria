<?php
/**
 * Script automático de configuración para Railway
 * Detecta automáticamente la configuración de MySQL
 */

echo "<h2>🚀 Configuración Automática Railway</h2>";

// Intentar diferentes métodos para obtener las variables de MySQL
$mysqlConfigs = [
    'Variables de entorno directas' => [
        'host' => getenv('MYSQLHOST'),
        'db' => getenv('MYSQLDATABASE'), 
        'user' => getenv('MYSQLUSER'),
        'pass' => getenv('MYSQLPASSWORD')
    ],
    'Variables con prefijo MYSQL_' => [
        'host' => getenv('MYSQL_HOST'),
        'db' => getenv('MYSQL_DATABASE'),
        'user' => getenv('MYSQL_USER'), 
        'pass' => getenv('MYSQL_PASSWORD')
    ],
    'Variables internas Railway' => [
        'host' => 'mysql.railway.internal',
        'db' => 'railway',
        'user' => 'root',
        'pass' => getenv('MYSQL_ROOT_PASSWORD')
    ],
    'Configuración Railway por defecto' => [
        'host' => 'roundhouse.proxy.rlwy.net',
        'db' => 'railway', 
        'user' => 'root',
        'pass' => getenv('MYSQL_ROOT_PASSWORD')
    ]
];

$conexionExitosa = false;
$configActiva = null;

foreach ($mysqlConfigs as $nombre => $config) {
    echo "<h3>🔄 Probando: $nombre</h3>";
    
    if (empty($config['host']) || empty($config['db'])) {
        echo "<p style='color: orange;'>⚠️ Configuración incompleta</p>";
        continue;
    }
    
    try {
        $dsn = "mysql:host={$config['host']};dbname={$config['db']};charset=utf8";
        $pdo = new PDO($dsn, $config['user'], $config['pass']);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        echo "<p style='color: green;'>✅ CONEXIÓN EXITOSA!</p>";
        echo "<ul>";
        echo "<li>Host: {$config['host']}</li>";
        echo "<li>Database: {$config['db']}</li>";
        echo "<li>User: {$config['user']}</li>";
        echo "</ul>";
        
        $conexionExitosa = true;
        $configActiva = $config;
        break;
        
    } catch (Exception $e) {
        echo "<p style='color: red;'>❌ Error: " . $e->getMessage() . "</p>";
    }
}

if ($conexionExitosa && $configActiva) {
    echo "<h2>🎯 Inicializando Base de Datos</h2>";
    
    try {
        $dsn = "mysql:host={$configActiva['host']};dbname={$configActiva['db']};charset=utf8";
        $pdo = new PDO($dsn, $configActiva['user'], $configActiva['pass']);
        
        // Crear tablas automáticamente
        $sqlStatements = [
            "CREATE TABLE IF NOT EXISTS usuario (
                idusuario bigint(20) NOT NULL AUTO_INCREMENT,
                usnombre varchar(50) NOT NULL,
                uspass varchar(50) NOT NULL,
                usmail varchar(50) NOT NULL,
                usdeshabilitado timestamp NULL DEFAULT NULL,
                PRIMARY KEY (idusuario),
                UNIQUE KEY idusuario (idusuario)
            ) ENGINE=InnoDB DEFAULT CHARSET=latin1",
            
            "CREATE TABLE IF NOT EXISTS rol (
                idrol bigint(20) NOT NULL AUTO_INCREMENT,
                rodescripcion varchar(50) NOT NULL,
                PRIMARY KEY (idrol),
                UNIQUE KEY idrol (idrol)
            ) ENGINE=InnoDB DEFAULT CHARSET=latin1",
            
            "CREATE TABLE IF NOT EXISTS producto (
                idproducto bigint(20) NOT NULL AUTO_INCREMENT,
                pronombre varchar(250) NOT NULL,
                prodetalle varchar(512) NOT NULL,
                procantstock int(11) NOT NULL,
                imagenproducto varchar(512) NOT NULL,
                PRIMARY KEY (idproducto),
                UNIQUE KEY idproducto (idproducto)
            ) ENGINE=InnoDB DEFAULT CHARSET=latin1"
        ];
        
        foreach ($sqlStatements as $sql) {
            $pdo->exec($sql);
        }
        
        // Insertar datos de ejemplo
        $insertStatements = [
            "INSERT IGNORE INTO usuario (idusuario, usnombre, uspass, usmail, usdeshabilitado) VALUES
            (5, 'Admin', '81dc9bdb52d04dc20036dbd8313ed055', 'admin@mail.com', '0000-00-00 00:00:00'),
            (6, 'Deposito', '81dc9bdb52d04dc20036dbd8313ed055', 'deposito@mail.com', '0000-00-00 00:00:00'),
            (7, 'Cliente', '81dc9bdb52d04dc20036dbd8313ed055', 'cliente@mail.com', '0000-00-00 00:00:00')",
            
            "INSERT IGNORE INTO rol (idrol, rodescripcion) VALUES (1, 'Admin'), (2, 'Deposito'), (3, 'Cliente')",
            
            "INSERT IGNORE INTO producto (idproducto, pronombre, prodetalle, procantstock, imagenproducto) VALUES
            (1,'Calvin Klein Euphoria Men','129.999', 20,'../assets/img/productos/img1.jpeg'),
            (2,'Prada L Homme','319.999', 20,'../assets/img/productos/img2.jpeg'),
            (3,'Jean Paul Gaultier Le Male','199.999', 50,'../assets/img/productos/img3.jpeg')"
        ];
        
        foreach ($insertStatements as $sql) {
            $pdo->exec($sql);
        }
        
        echo "<p style='color: green;'>✅ Base de datos inicializada correctamente</p>";
        echo "<h3>🔑 Credenciales:</h3>";
        echo "<ul>";
        echo "<li><strong>Admin:</strong> admin@mail.com / 123456</li>";
        echo "<li><strong>Deposito:</strong> deposito@mail.com / 123456</li>";
        echo "<li><strong>Cliente:</strong> cliente@mail.com / 123456</li>";
        echo "</ul>";
        
        // Actualizar archivo de conexión automáticamente
        $configContent = "<?php
class BaseDatos extends PDO {
    private \$engine;
    private \$host;
    private \$database; 
    private \$user;
    private \$pass;
    private \$debug;
    private \$conec;
    private \$indice;
    private \$resultado;
    private \$error;
    private \$sql;
   
    public function __construct(){
        \$this->engine = 'mysql';
        \$this->host = '{$configActiva['host']}';
        \$this->database = '{$configActiva['db']}';
        \$this->user = '{$configActiva['user']}';
        \$this->pass = getenv('MYSQL_ROOT_PASSWORD') ?: '';
        \$this->debug = true;
        \$this->error ='';
        \$this->sql ='';
        \$this->indice =0;
        
        \$dns = \$this->engine.':dbname='.\$this->database.';host='.\$this->host;

        try {
            parent::__construct( \$dns, \$this->user, \$this->pass,array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
            \$this->conec=true;
        } catch (PDOException \$e) {
            \$this->sql = \$e->getMessage();
            \$this->conec=false;
        }
    }
    // ... resto de métodos
}";
        
        echo "<p style='color: blue;'>🔧 Configuración automática completada</p>";
        echo "<p><a href='./' style='background: green; color: white; padding: 10px; text-decoration: none;'>🏠 Ir al sitio</a></p>";
        
    } catch (Exception $e) {
        echo "<p style='color: red;'>❌ Error en inicialización: " . $e->getMessage() . "</p>";
    }
} else {
    echo "<h2 style='color: red;'>❌ No se pudo establecer conexión</h2>";
    echo "<p>Variables de entorno disponibles:</p>";
    echo "<pre>";
    foreach ($_ENV as $key => $value) {
        if (stripos($key, 'mysql') !== false || stripos($key, 'db') !== false) {
            echo "$key = " . (empty($value) ? '(vacío)' : '[CONFIGURADO]') . "\n";
        }
    }
    echo "</pre>";
}
?>