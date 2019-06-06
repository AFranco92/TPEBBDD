$('#form').on('submit', function (event) {
  event.preventDefault();
  fecha = $('#campo1').val();
  cuit = $('#campo2').val();
  if (fecha != '') {
    cargarFecha(fecha);
  } else  if (cuit != '') {
    cargarCuit(cuit);
  }
  function cargarFecha(fecha) {
    $.ajax({
      "url" : "posicionesLibres/"+fecha,
      "method" : "GET",
      "dataType" : "HTML",
      "success" : function(data) {
        $(".resultado").html(data);
        document.getElementById("form").reset();

      }
    });
  }
    function cargarCuit(cuit) {
      $.ajax({
        "url" : "posicionesCliente/"+cuit,
        "method" : "GET",
        "dataType" : "HTML",
        "success" : function(data) {
          $(".resultado").html(data);
          document.getElementById("form").reset();

        }
      });

    }
});
