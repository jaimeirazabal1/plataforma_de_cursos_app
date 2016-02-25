<?php 
class BotonController extends AppController{

	public function crear($id_modulo){
		if (Input::hasPost("boton_pago")) {
			$boton = Load::model("boton_pago",Input::post("boton_pago"));
			if ($boton->save()) {
				Flash::valid("El boton fue creado");
			}else{
				Flash::error("No se pudo crear el boton");
			}
			Router::redirect("modulo/lists");
		}
		$this->modulo = Load::model("modulo")->find($id_modulo);
		$this->boton_pago = Load::model("boton_pago")->find_first("conditions: modulo_id='$id_modulo'");
	}
}

 ?>