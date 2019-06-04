<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<title>Warehouse Management System</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="container">
				<h1>Warehouse Management System</h1>
				<h2>Buscar posiciones</h2>
				<form class="main" action="posicionesLibres" method="post">
				  <fieldset>
				    <div class="form-group">
				      <label for="campo1">Buscar por fecha</label>
				      <input type="date" id="campo1" name="fecha" class="form-control">
				    </div>
				   	<div class="form-group">
				      <label for="campo2">Buscar por código de cliente (posiciones ocupadas)</label>
				      <input type="text" id="campo2" name"cuit" class="form-control">
				    </div>
				    <button type="submit" class="btn btn-primary">Buscar</button>
				  </fieldset>
				</form>
				<table class="resultado">
					<thead>
						<tr>
							<td>
								Nro Estanteria
							</td>
							<td>
								Nro Fila
							</td>
              <td>
								Nro Posicion
							</td>
						</tr>
					</thead>
					<tbody>
            {foreach from=$posiciones item=posicion}
            <tr>
              <td>{$posicion['nro_estanteria']}</td>
              <td>{$posicion['nro_fila']}</td>
              <td>{$posicion['nro_posicion']}</td>
            </tr>
            {/foreach}
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
