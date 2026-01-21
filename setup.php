<?php
include_once 'configuracion.php';
include_once $ROOT.'modelo/conector/BaseDatos.php';

$db = new BaseDatos();

echo "<h2>🎯 Inicializar Base de Datos</h2>";

if ($db->Iniciar()) {
    echo "<p style='color: green;'>✅ Conexión exitosa a MySQL</p>";
    
    // Crear tabla usuarios con contraseñas reset
    $db->Ejecutar("CREATE TABLE IF NOT EXISTS usuario (
        idusuario bigint(20) NOT NULL AUTO_INCREMENT,
        usnombre varchar(50) NOT NULL,
        uspass varchar(50) NOT NULL,
        usmail varchar(50) NOT NULL,
        usdeshabilitado timestamp NULL DEFAULT NULL,
        PRIMARY KEY (idusuario)
    )");
    
    $db->Ejecutar("INSERT IGNORE INTO usuario (idusuario, usnombre, uspass, usmail) VALUES
    (5, 'Admin', '81dc9bdb52d04dc20036dbd8313ed055', 'admin@mail.com'),
    (6, 'Deposito', '81dc9bdb52d04dc20036dbd8313ed055', 'deposito@mail.com'),
    (7, 'Cliente', '81dc9bdb52d04dc20036dbd8313ed055', 'cliente@mail.com')");
    
    // Crear tabla productos
    $db->Ejecutar("CREATE TABLE IF NOT EXISTS producto (
        idproducto bigint(20) NOT NULL AUTO_INCREMENT,
        pronombre varchar(250) NOT NULL,
        prodetalle varchar(512) NOT NULL,
        procantstock int(11) NOT NULL,
        imagenproducto varchar(512) NOT NULL,
        PRIMARY KEY (idproducto)
    )");
    
    $db->Ejecutar("INSERT IGNORE INTO producto VALUES
    (1,'Calvin Klein Euphoria Men','129.999', 20,'../assets/img/productos/img1.jpeg'),
    (2,'Prada L Homme','319.999', 20,'../assets/img/productos/img2.jpeg'),
    (3,'Jean Paul Gaultier Le Male','199.999', 50,'../assets/img/productos/img3.jpeg')");
    
    echo "<h3>🎉 ¡Base de datos inicializada!</h3>";
    echo "<p><strong>Credenciales:</strong></p>";
    echo "<ul><li>admin@mail.com / 123456</li><li>deposito@mail.com / 123456</li><li>cliente@mail.com / 123456</li></ul>";
    echo "<p><a href='vista/inicio/home.php'>🏠 Ver sitio</a></p>";
    
} else {
    echo "<p style='color: red;'>❌ Error de conexión</p>";
}
?>