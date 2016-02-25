<?php 
class CursoController extends AppController{

	public function index(){
		$this->cursos = Load::model("curso")->getCursos();
	}
	public function crear(){
		if (Input::post("curso")) {
			$curso = Load::model("curso");

			if (Input::post("recurso")) {
				$curso->orden = serialize(Input::post('recurso'));
			}else{
				Flash::error("No se recibio el orden de los cursos");
				return;
			}
			$curso->modulo_id = $_POST['curso']['modulo_id'];
			$curso->nombre = $_POST['curso']['nombre'];
			if ($curso->save()) {
				Flash::valid("Curso Agregado");
			}else{
				Flash::error("No se agrego el curso");
			}
			Router::redirect('curso/');
		}
		
	}
	public function ver($curso_id){
		$curso = Load::model("curso")->find($curso_id);
		$orden = unserialize($curso->orden);
		$this->curso = $curso;
		$orden_mostrar = array();
		foreach ($orden as $key => $value) {
			$recurso = Load::model("recurso")->find($key);
			$orden_mostrar[$value]=$recurso;
		}
		$this->orden = $orden_mostrar;
	}
	public function ver_curso($curso_id){
		$this->curso = Load::model("curso")->getCursoById($curso_id);
	}
	public function editar($curso_id){
		
		$this->curso= Load::model("curso")->find($curso_id);
	}
}

 ?>