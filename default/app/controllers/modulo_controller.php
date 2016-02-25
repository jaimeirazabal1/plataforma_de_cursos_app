<?php 
class ModuloController extends AppController{
	public function crear(){
		if (Input::hasPost('modulo')) {
			$modulo = Load::model("modulo",Input::post('modulo'));
			if ($modulo->save()) {
				Flash::valid("Modulo creado");
			}else{
				Flash::error('No se creo el modulo');
			}
			Router::redirect("modulo/lists");
		}
	}
	public function lists(){
		$this->modulos = Load::model('modulo')->find();
	}
	public function eliminar($modulo_id){
		$modulo = Load::model("modulo")->find($modulo_id);
		if ($modulo->delete()) {
			Flash::valid("Modulo eliminado");
			if (Load::model("recurso")->delete(" modulo_id = '$modulo_id'")) {
				Flash::error("Recursos de modulo eliminados");
			}else{
				Flash::error("No se eliminaron los recursos del modulo");
			}
		}else{
			Flash::error("No se elimino el modulo");
		}
		Router::redirect("modulo/lists");
	}
	public function editar_nombre($modulo_id,$nombre){
		$modulo = Load::model("modulo")->find($modulo_id);
		$modulo->nombre = $nombre;
		if ($modulo->update()) {
			View::select(null,'json');
			$this->data = true;
		}else{
			View::select(null,'json');
			$this->data = false;			
		}
	}
	public function editar_orden($modulo_id,$orden){
		$modulo = Load::model("modulo")->find($modulo_id);
		$modulo->orden = $orden;
		if ($modulo->update()) {
			View::select(null,'json');
			$this->data = true;
		}else{
			View::select(null,'json');
			$this->data = false;			
		}
	}
}


 ?>
