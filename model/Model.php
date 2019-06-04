 <?php
 require_once 'database/config.php'; //ARCHIVO DE CONFIGURACION

 class Model
 {

   protected $db;

   function __construct()
   {
     try {

       $this->db = new PDO('mysql:host='.HOST.';'.'dbname='.DBNAME.';charset=utf8', USUARIO, DBPASS);
     } catch (PDOException $e) {
       //buildDDBBfromFile(DBNAME, 'model/database/apptrash.sql'); //ARCHIVO EXPORTADO DE LA BASE
     }

   }
 }

  function buildDDBBfromFile($dbname, $dbfile) {
   try {
     $connection = new PDO('mysql:host='.HOST, USUARIO, DBPASS);
     $connection->exec('CREATE DATABASE IF NOT EXISTS '.$dbname);
     $connection->exec('USE '. $dbname);
     $queries = loadSQLSchema($dbfile);
     $connection->exec($queries);


   } catch (PDOException $e) {
     echo $e;
   }

 }

   function loadSQLSchema($dbfile) {
     $file = fopen($dbfile, "r");
     $getTablas = "";
     while(! feof($file))
     {
       $getTablas .= fgets($file);
     }

     fclose($file);
     return $getTablas;
   }
 ?>
