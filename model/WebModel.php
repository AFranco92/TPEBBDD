<?php
  class WebModel extends Model{

    public function getPosicionesLibres($fecha)
    {
        $sentencia = $this->db->prepare('SELECT * FROM FN_GR10_posLibres(?)');
        $sentencia->execute([$fecha]);
        return $sentencia->fetchAll(PDO::FETCH_ASSOC);
      }

      public function getPosicionesCliente($cliente)
      {
          $sentencia = $this->db->prepare('SELECT * FROM FN_GR10_LISTAR_POS_OCUP_CLIENTE(?)');
          $sentencia->execute([$cliente]);
          return $sentencia->fetchAll(PDO::FETCH_ASSOC);
        }
  }
?>
