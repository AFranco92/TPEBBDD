CREATE FUNCTION FN_GR10_posicionesLibres(fecha DATE)
   RETURNS TABLE (
      nro_estanteria int,
      nro_fila int,
      nro_posicion int
)
AS $$
BEGIN
   RETURN QUERY
   SELECT p.nro_estanteria, p.nro_fila, p.nro_posicion
   FROM GR10_ESTANTERIA e
      INNER JOIN GR10_FILA f ON e.nro_estanteria = f.nro_estanteria
      INNER JOIN GR10_POSICION p ON p.nro_estanteria = f.nro_estanteria and p.nro_fila = f.nro_fila
   WHERE NOT EXISTS (SELECT 1
                    FROM GR10_ALQUILER_POSICIONES ap
                    INNER JOIN GR10_ALQUILER a ON ap.id_alquiler = a.id_alquiler
                    WHERE ap.nro_posicion = p.nro_posicion
                      and ap.nro_estanteria = p.nro_estanteria
                      and ap.nro_fila = p.nro_fila
                      and fecha NOT BETWEEN a.fecha_desde and a.fecha_hasta);
END; $$ LANGUAGE plpgsql;
