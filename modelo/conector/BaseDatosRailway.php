<?php

class BaseDatos extends PDO {

    //ATRIBUTOS
    private $engine;
    private $host;
    private $database;
    private $user;
    private $pass;
    private $debug;
    private $conec;
    private $indice;
    private $resultado;
    private $error;
    private $sql;
   
    public function __construct(){
        $this->engine = 'mysql';
        
        // Configuración para Railway (variables de entorno)
        $this->host = $_ENV['MYSQLHOST'] ?? $_ENV['DB_HOST'] ?? 'localhost';
        $this->database = $_ENV['MYSQLDATABASE'] ?? $_ENV['DB_NAME'] ?? 'bdcarritocompras';
        $this->user = $_ENV['MYSQLUSER'] ?? $_ENV['DB_USER'] ?? 'root';
        $this->pass = $_ENV['MYSQLPASSWORD'] ?? $_ENV['DB_PASS'] ?? '';
        
        $this->debug = true;
        $this->error ="";
        $this->sql ="";
        $this->indice =0;
        
        $dns = $this->engine.':dbname='.$this->database.";host=".$this->host;

        try {
            parent::__construct( $dns, $this->user, $this->pass,array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
            $this->conec=true;
        } catch (PDOException $e) {
            $this->sql = $e->getMessage();
            $this->conec=false;
        }
       
    }

    public function Iniciar(){
        return $this->getConec();
    }
    
    public function getConec(){
        return $this->conec;
    }
    
    public function setDebug($debug){
        $this->debug = $debug;
    }

    public function setError($e){
        $this->error = $e;
    }

    public function getError(){
        return "\n" .$this->error;
    }

    public function setSQL($e){
        $this->sql = $e;
    }

    public function getSQL(){
        return "\n" .$this->sql;
    }

    public function Ejecutar($sql){
        $this->setError("");
        $this->setSQL($sql);
        if (stripos($sql, "insert") === 0 || stripos($sql, "update") === 0 || stripos($sql, "delete") === 0) {
            $resp =  parent::exec($sql);
            if (!$resp) {
                $this->analizarDebug();
                $resp= false;
            }
        } else {
            $resp =  parent::query($sql);
            if (!$resp) {
                $this->analizarDebug();
                $resp= false;
            } else {
                $arregloResult = $resp->fetchAll();
                $resp= $arregloResult;
            }   
        }
        return $resp;
    }

    private function analizarDebug(){
        $e = $this->errorInfo();
        $this->setError($e);
    }

    public function buscarRegistros($tabla,$condicion){
        $sql="SELECT * FROM ".$tabla;
        if ($condicion!=""){
            $sql=$sql.' WHERE '.$condicion;
        }
        return $this->Ejecutar($sql);
    }

}

?>