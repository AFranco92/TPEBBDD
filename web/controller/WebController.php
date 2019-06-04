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

		public function detalleReporte($params)
		{
			$id_reporte = $params[0];
			$reporte = $this->model->getReporte($id_reporte);
			$this->view->showReporte($reporte);
		}
	}
 ?>
