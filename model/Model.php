 <?php
 require_once 'database/config.php'; //ARCHIVO DE CONFIGURACION

 class Model
 {

   protected $db;

   function __construct()
   {
     try {

      $this->db = new PDO('pgsql:host='.HOST.';port='.PORT.';dbname='.DBNAME.'', USER, DBPASS);
     } catch (PDOException $e) {
       echo "No se pudo conectar a la Base de Datos";
     }

   }
 }
 ?>
