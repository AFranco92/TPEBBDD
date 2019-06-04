<?php
	class WebView extends View
	{

		function showIndex($titulo)
		{
			$this->smarty->assign('titulo', $titulo);
			$this->smarty->display('templates/index.tpl');
		}

		function showAdminIndex() {
			$this->smarty->display('templates/admin.tpl');
		}

		function showPosiciones($posiciones)
		{
			$this->smarty->assign('posiciones',$posiciones);
			$this->smarty->display('templates/posiciones.tpl');
		}

	}
 ?>
