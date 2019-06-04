<?php
  class WebModel extends Model{

    public function getPosicionesLibres($fecha)
    {
        // $sentencia = $this->db->prepare('SELECT *
        // FROM FN_GR10_PosicionesLibres(?)');
        $sentencia = $this->db->prepare('SELECT * FROM FN_GR10_posicionesLibres(?)');
        $sentencia->execute([$fecha]);
        return $sentencia->fetchAll(PDO::FETCH_ASSOC);
      }
  }
?>
