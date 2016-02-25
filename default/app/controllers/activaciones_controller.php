<?php 
class ActivacionesController extends AppController{

	public function index(){
		$this->activaciones = Load::model('recurso_usuario_habilitado')->getHabilitados();
	}
	public function ver($usuario_id){
		$this->usuario = Load::model('usuario')->find($usuario_id);
		$this->activaciones = Load::model('recurso_usuario_habilitado')->getHabilitados(false,$usuario_id);
	}
	public function eliminar($id_activacion){
		$activacion = Load::model('recurso_usuario_habilitado')->find($id_activacion);
		$usuario_id = $activacion->usuario_id;
		if ($activacion->delete()) {
			Flash::valid("Se ha deshabilitado el recurso del usuario");
		}else{
			Flash::error("No se deshabilito el recurso");
		}
		Router::redirect('activaciones/ver/'.$usuario_id);
	}
	public function habilitar($usuario_id){
		
	}

}



 ?>