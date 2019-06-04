<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>{$titulo}</title>
	<link rel="icon" href="favicon.png">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Script para usar la api de Google Maps  -->
	<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAtg4aOaTtIbJ3bkYGoPENDgguwcGBbFNI&sensor=false">
</script>
</head>
<body>


	<div id="page-wrap">


		<!-- ==========================================================================================================
		HERO
		========================================================================================================== -->

		<div id="fh5co-hero-wrapper">
			<nav class="container navbar navbar-expand-lg main-navbar-nav navbar-light">
				<a class="navbar-brand" href=""><img src="img/logotandil.png" alt="" width="120" height="50"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<!--DIV DE NAVEGACION  -->
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav nav-items-center ml-auto mr-auto">
						<li class="nav-item">
							<a class="nav-link" href="#">Reportar Basura </a>
						</li>
						<li class="nav-item active">
							<a class="nav-link denuncia" href="#" data-toggle="modal" data-target="#modalDenunciaForm">Denunciar</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">Mis Reportes</a>
						</li>
						<li>
							<button class="btn"><a href="admin">Soy admin</a></button>
						</li>
					</ul>
				</div>
			</nav>

			<!-- ==========================================================================================================
			PUBLICIDAD
			========================================================================================================== -->
			<div class="bd-example">
				<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
						<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
						<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="img/contenedores-reciclaje.jpg" class="d-block w-100" alt="..."  >
							<div class="carousel-caption d-none d-md-block">
								<h1> CUIDEMOS EL MEDIO AMBIENTE</h1>
								<p>SI VOS HACÉS TU PARTE, ENTRE TODOS PODEMOS</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="img/arrojobasura.jpg" class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h1>DENUNCIA</h1>
								<p>AYUDANOS A UN TANDIL MAS LIMPIO</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="img/medioambiente.jpg" class="d-block w-100" alt="..." >
							<div class="carousel-caption d-none d-md-block">
								<h1>CONSTRUYENDO JUNTOS</h1>
								<p>UN TANDIL VERDE Y SALUDABLE</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>

			<!-- ==========================================================================================================
			FORM POP UP (GENERAR DENUNCIA)
			========================================================================================================== -->



			<div class="modal fade" id="modalDenunciaForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h4 class="modal-title w-100 font-weight-bold">Reporte</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body mx-3 ">
						<p class="lead">Datos del Denunciante</p>

					</div>
					<form id="formDenuncia" action="guardarDenuncia" method="post" class="form-signin" enctype="multipart/form-data">
						<div class="modal-body mx-3">
							<i class="fas fa-user prefix grey-text"></i>
							<label data-error="wrong" data-success="right" for="form34">Nombre</label>
							<input type="text" id="form34" class="form-control validate" name="nombre" value="" maxlength="30" required>


							<i class="fas fa-user prefix grey-text"></i>
							<label data-error="wrong" data-success="right" for="form34">Apellido</label>
							<input type="text" id="form34" class="form-control validate" name="apellido" value=""maxlength="30" required>

							<i class="fas fa-user prefix grey-text"></i>
							<label data-error="wrong" data-success="right" for="form29">DNI</label>
							<input type="text" id="form29" class="form-control validate" name="dni" value="" maxlength="8" required>


							<i class="fas fa-map-marker-alt prefix grey-text"></i>
							<label data-error="wrong" data-success="right" for="form29">Direccion</label>
							<input type="text" id="form29" class="form-control validate" name="direccion" value="" maxlength="50" required>
						</div>

						<hr align="center" size="100" width="87%" margin-left="80%" />
						<div class="modal-body mx-3">
							<p class="lead">Datos de la Denuncia</p>
						</div>
						<div class="modal-body mx-3">
							<i class="fas fa-car prefix grey-text"></i>
							<label data-error="wrong" data-success="right" for="form34"  required>Patente del Vehiculo</label>
							<input type="text" id="form34" class="form-control validate"  name="patente" value="" maxlength="7" required>

							<i class="fas fa-calendar-alt prefix grey-text"></i>
							<label data-error="wrong" data-success="right" for="form34">Fecha y Hora</label>
							<input type="datetime-local" id="form34" class="form-control fecha validate" name="fechahora" value="" required>


							<!-- DIV PARA EL IFRAME DE GEOLOCALIZACION  DE GOOGLE -->
							<div id="mapa"  style="width: 100%; height: 200px; margin-top: 10px"></div>
							<input type="hidden" class="inputLat" id="inputLat" name="latitud" value="" required>
							<input type="hidden" class="inputLng" id="inputLng" name="longitud" value="" required>
							<input type="hidden" class="direccionDenuncia" id="dirDenuncia" name="dirDenuncia" value="" required>
							<input type="hidden" class="dirVideo" id="dirVideo" name="dirVideo" value="" required>

							<div class="labelvideo">
								<i class="fas fa-arrow-circle-up prefix grey-text"></i>
								<label data-error="wrong" data-success="right" for="upvideo">Subir video</label>
							</div>
							<input type="file" accept="video/*" id="archivo" class="form-control upvideo" name="archivo" required>
							<div class="progress"  style="margin-top: 10px">
								<div class="progress-bar progress-bar-striped progress-bar-animated" id="barra_de_progreso" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style=""></div>
							</div>
							<div class="modal-footer d-flex justify-content-center">
								<input  class="btn btn-unique" id="cerrarForm" type="button" name="Cancelar" value="Cancelar">
								<input   class="btn btn-unique" id="formEnviar" type="submit"  name="Enviar" value="Enviar">
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		<!-- ==========================================================================================================
		POP UP (MENSAJE DENUNCIA GENERADA)
		========================================================================================================== -->

		<div class="modal fade modmsj" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">Denuncia enviada</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-3">
					<div class="md-form">
						<i class="fas fa-pencil prefix grey-text"></i>
						<label data-error="wrong" data-success="right" for="form8">Su denuncia ha sido enviada exitosamente. Gracias por colaborar!</label>
					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-unique2" data-dismiss="modal">Aceptar<i class="fas fa-paper-plane-o ml-1"></i></button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ==========================================================================================================
	POP UP (CONFIRMAR CANCELACIÓN)
	========================================================================================================== -->

	<div class="modal fade" id="modalCancelar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">¿Confirmar cancelación?</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body mx-3">
				<div class="md-form">
					<i class="fas fa-pencil prefix grey-text"></i>
					<label data-error="wrong" data-success="right" for="form8">Si confirma la cancelacion los datos ingresados en el formulario se perderan.</label>
				</div>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<button class="btn btn-unique" id="mostrarForm">Cancelar</button>
				<button class="btn btn-unique2" id="borrarForm" data-dismiss="modal">Confirmar<i class="fas fa-paper-plane-o ml-1"></i></button>
			</div>
		</div>
	</div>
</div>


</div> <!-- first section wrapper -->

<footer class="footer-outer">
	<div class="container footer-inner">

		<div class="footer-three-grid wow fadeIn animated" data-wow-delay="0.66s">
			<div class="column-1-3">
				<h1>Trash</h1>
			</div>
			<div class="column-2-3">
				<!-- NAVEGACION EN EL FOOTER  -->
				<nav class="footer-nav">
					<ul>
						<a href="#" ><li>Reportar Basura</li></a>
						<a href="#" data-toggle="modal" data-target="#modalDenunciaForm"><li>Denunciar</li></a>
						<a href="#" ><li>Mis Reportes</li></a>
					</ul>
				</nav>
			</div>
			<div class="column-3-3">
				<div class="social-icons-footer">
					<a href=""><i class="fab fa-facebook-f"></i></a>
					<a href=""><i class="fab fa-instagram"></i></a>
					<a href=""><i class="fab fa-twitter"></i></a>
				</div>
			</div>
		</div>

		<span class="border-bottom-footer"></span>

		<p class="copyright">&copy; 2019 App. All rights reserved. Design by Scrum Group</p>

	</div>
</footer>

</div> <!-- main page wrapper -->

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/main.js"></script>
<script src="js/geolocalizacion.js"></script>
<script src="js/upload.js"></script>
</body>
</html>
