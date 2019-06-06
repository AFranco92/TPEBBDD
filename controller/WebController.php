<?php
	require_once 'view/WebView.php';
  require_once 'model/WebModel.php';

	class WebController extends Controller
	{

		function __construct()
		{
			$this->view = new WebView();
			$this->model = new WebModel();
		}

		public function index()
	  	{
	  		$titulo = 'Warehouse Manage';
	  		$this->view->showIndex($titulo);
	  	}

		public function posicionesLibres($params = '')
		{
			$fecha = date("Y-m-d", strtotime($params[0]));
			$posiciones = $this->model->getPosicionesLibres($fecha);
			$this->view->showPosiciones($posiciones);
		}

		public function posicionesCliente($params = '')
		{
			$cliente = $params[0];
			$posiciones = $this->model->getPosicionesCliente($cliente);
			$this->view->showPosicionesCliente($posiciones);
		}
	}
 ?>
