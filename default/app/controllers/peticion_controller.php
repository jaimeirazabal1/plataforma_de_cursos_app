<?php 
class PeticionController extends AppController{

	public function peticion_siguiente_curso(){
		View::select(null,'json');
		$curso = Input::get('curso');
		$modulo = Input::get('modulo');
		$orden = Input::get('orden');
		$recurso = Input::get('recurso');
		$usuario = Input::get('usuario');
		$modulo_object=Load::model('modulo')->find($modulo);
		if ($modulo_object->publico) {
			$dar_permiso_recurso = Load::model('recurso_usuario_habilitado')->habilitarRecurso($curso,$recurso,$usuario);
			if ($dar_permiso_recurso) {
				/*TODO: mandar mensaje al usuario para avisarle que se le habilito el curso*/
				$recurso_object = Load::model('recurso')->find($recurso);
				$mensaje = "Has sido dado de alta para ver el recurso: ".$recurso_object->nombre." <br> Descripcion:".$recurso_object->descripcion.".<br>";
				$usuario_object = Load::model("usuario")->find($usuario);
				$subject = "Activacion de recurso";
				
				$headers = "MIME-Version: 1.0" . "\r\n";
				$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

				// More headers
				$headers .= 'From: <webmaster@example.com>' . "\r\n";
				$headers .= 'Cc: myboss@example.com' . "\r\n";

				mail($usuario_object->email,$subject,$mensaje,$headers);


				$this->data = array("response"=>true,"publico"=>$modulo_object->publico);
			}else{
				$this->data = "No se pudo dar de alta al recurso para el usuario";
			}			
		}else{
			$peticion_ver_recurso = Load::model('peticion_ver_recurso')->generar_peticion($curso,$modulo,$orden,$recurso,$usuario);
			$this->data = $peticion_ver_recurso;
		}
	}

	public function dar_permiso_recurso($curso_id,$recurso_id,$usuario_id){
		$dar_permiso_recurso = Load::model('recurso_usuario_habilitado')->habilitarRecurso($curso_id,$recurso_id,$usuario_id);
		if ($dar_permiso_recurso) {
			/*TODO: mandar mensaje al usuario para avisarle que se le habilito el curso*/
			Flash::valid("El recurso fue dado de alta para el usuario");
		}else{
			FLash::error("No se pudo dar de alta al recurso para el usuario");
		}
		
	}

}


 ?>