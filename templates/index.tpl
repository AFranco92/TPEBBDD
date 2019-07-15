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
				<form  id="form" class="main" action="posicionesLibres" method="post">
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
				</table>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/ajax.js"></script>
</body>
</html>
