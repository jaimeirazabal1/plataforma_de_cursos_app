<?php 
class MensajeController extends AppController{

	public function index(){
        if (Input::hasPost('mensaje')) {
        	$mensaje = Load::model('mensaje',Input::post('mensaje'));
        	if ($mensaje->save()) {
        		Flash::valid("Mensaje enviado con exito!");
        	}else{
        		Flash::error("No se envio el mensaje");
        	}
        }
		$this->mensajes = Load::model("mensaje")->mensajesDeUsuario(Auth::get("id"));

	}

}



 ?>