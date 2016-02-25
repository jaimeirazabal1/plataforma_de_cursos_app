<?php 
class PeticionVerRecurso extends ActiveRecord{
	public function generar_peticion($curso_id,$modulo_id,$orden,$recurso_id,$usuario_id){

		$r = new PeticionVerRecurso(array(
			'curso_id'=>$curso_id,
			'modulo_id'=>$modulo_id,
			'orden'=>$orden,
			'recurso_id'=>$recurso_id,
			'usuario_id'=>$usuario_id
		));

		$curso = Load::model("curso")->find($curso_id);
		$modulo = Load::model("modulo")->find($modulo_id);
		$recurso = Load::model("recurso")->find($recurso_id);
		$usuario = Load::model("usuario")->find($usuario_id);
		
		$link = "http://jaig.net.ve/aplicaciones/plataforma_cursos/peticion/dar_permiso_recurso/".$curso->id."/".$recurso->id."/".$usuario->id;

		$message="
El usuario: $usuario->nombre con el correo $usuario->email esta haciendo la peticion de ver el recurso numero $orden <br>
Recurso de nombre: $recurso->nombre <br>
Recurso descripcion: $recurso->descripcion <br>
Tipo de recurso: $recurso->tipo <br>
Perteneciente al modulo de nombre: $modulo->nombre <br>
En el Curso de nombre: $curso->nombre <br>
Has click <a href=".$link.">AQUI</a> para dar permiso a que el usuario vea el recurso automaticamente.
		";


		$to =array();
		$subject = "Peticion de usuario";

		$admins = Load::model("usuario_admin")->getAdmins();
		foreach ($admins as $key => $value) {
			$to[]=$value->email;
		}
		$to = implode(',',$to);
		// Always set content-type when sending HTML email
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

		// More headers
		$headers .= 'From: <webmaster@example.com>' . "\r\n";
		$headers .= 'Cc: myboss@example.com' . "\r\n";

		if(!mail($to,$subject,$message,$headers)){
			return "No se pudo enviar el correo a los administradores";
		}

		if(!$r->save()){
			return "No se pudo guardar el registro de peticion en la base de datos";
		}

		return true;
	}
}

 ?>