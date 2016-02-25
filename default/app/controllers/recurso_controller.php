<?php 
class RecursoController extends AppController{
	public function lists(){
		$this->recursos = Load::model("recurso")->find();
	}
	public function de_modulo($modulo_id){
		$this->modulo = Load::model("modulo")->find($modulo_id);
		$recursos = Load::model("recurso")->getByModuloId($modulo_id);
		if ($recursos) {
			$this->recursos = $recursos;
		}else{
			Flash::error("El modulo con id:".$modulo_id." no posee recursos asignados");
			Router::redirect('modulo/lists');
		}
	}
	public function de_modulo_ajax($modulo_id){
		View::template(null);
		$this->modulo = Load::model("modulo")->find($modulo_id);
		$recursos = Load::model("recurso")->getByModuloId($modulo_id);
		if ($recursos) {
			$this->recursos = $recursos;
		}else{
			Flash::error("El modulo con id:".$modulo_id." no posee recursos asignados");
			Router::redirect('modulo/lists');
		}
	}
	public function crear($modulo_id){

		if (Input::hasPost("recurso")) {
			$post = Input::post("recurso");
			$recurso = Load::model("recurso",Input::post('recurso'));
			if ($recurso->tipo == 'VIDEO') {
	
				//die("Todavia la aplicacion no sorpota estos archivos!");
				$_FILES['archivo']['name'] = date('Y_m_d_H_i_s_').$_FILES['archivo']['name'];
				$ruta_subir=getcwd()."/files/upload/videos/";
				$ruta_guardar="/files/upload/videos/".$_FILES['archivo']['name'];
				$archivo = Upload::factory('archivo'); 
				$archivo->setPath($ruta_subir);
	            $archivo->setExtensions(array('mp4'));//le asignamos las extensiones a permitir
	            $recurso->url=$ruta_guardar;
	            if ($archivo->isUploaded()) {
	                if (!$archivo->save()) {
	                    Flash::error('No se pudo guradar el video');
	                }
	            }else{
	                Flash::warning('No se ha Podido Subir el video...!!!');
	            }
			}

			if ($recurso->save()) {
				Flash::valid("Recurso Creado");
				Router::redirect("recurso/de_modulo/{$modulo_id}");
			}else{
				Flash::error("No se Creo el recurso");
			}
		}
		$this->modulo=Load::model("modulo")->find($modulo_id);
	}
	public function editar($recurso_id,$modulo_id){
		View::select('crear');
		if (Input::hasPost("recurso")) {
			$post = Input::post("recurso");
			$recurso = Load::model("recurso",Input::post('recurso'));
			if ($recurso->tipo == 'VIDEO') {
	
				//die("Todavia la aplicacion no sorpota estos archivos!");
				$_FILES['archivo']['name'] = date('Y_m_d_H_i_s_').$_FILES['archivo']['name'];
				$ruta_subir=getcwd()."/files/upload/videos/";
				$ruta_guardar="/files/upload/videos/".$_FILES['archivo']['name'];
				$archivo = Upload::factory('archivo'); 
				$archivo->setPath($ruta_subir);
	            $archivo->setExtensions(array('mp4'));//le asignamos las extensiones a permitir
	            $recurso->url=$ruta_guardar;
	            if ($archivo->isUploaded()) {
	                if (!$archivo->save()) {
	                    Flash::error('No se pudo guradar el video');
	                }
	            }else{
	                Flash::warning('No se ha Podido Subir el video...!!!');
	            }
			}

			if ($recurso->save()) {
				Flash::valid("Recurso Creado");
				Router::redirect("recurso/de_modulo/{$modulo_id}");
			}else{
				Flash::error("No se Creo el recurso");
			}
		}

		$this->recurso = Load::model("recurso")->find($recurso_id);
		$this->modulo=Load::model("modulo")->find($modulo_id);
	}

}

 ?>