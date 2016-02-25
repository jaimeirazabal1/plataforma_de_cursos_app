<?php 

class UsuarioController extends AppController{
 
	public function ingreso(){

		if (Input::post("ingresar")) {

			if ($this->esAdmin(Input::post("email"),Input::post("password"))) {
				Router::redirect("usuario/admin");
			}
			$password = Load::model('usuario')->getPasswordByEmail(Input::post("email"));
			if (!$password) {
				Flash::error("No se encontro el usuario con el email: ".Input::post("email"));
				return;
			}
			if (Input::post("password") == $password) {

		        $email=Input::post("email");
		        $auth = new Auth("model", "class: usuario", "email: $email", "password: $password");
		        if ($auth->authenticate()) {
		            Router::redirect('usuario/dash');
		        } else {
		            Flash::error("Falló");
		        }
			}else{
				Flash::error("Datos de acceso invalidos");
			}
		}
	}
	public function pago_realizado(){
		
	}
	public function admin(){
		
	}
	public function dash(){
		$this->gratuitos = Load::model("curso")->getGratuitos();

		$this->foto_usuario = Load::model('fotos_usuario')->getLast(Auth::get("id"));
	
		$this->mensajes = Load::model("mensaje")->mensajesDeUsuario(Auth::get("id"));
        if (Input::hasPost('imagen_perfil')) {  //para saber si se envió el form
 			$url_upload = getcwd()."/files/upload/imagenes_perfil/";
 			$_FILES['archivo']['name']=date('Y_m_d_H_i_s_').$_FILES['archivo']['name'];
 			$url_to_save = '/files/upload/imagenes_perfil/'.$_FILES['archivo']['name'];
            $archivo = Upload::factory('archivo', 'image'); 
 			$archivo->setPath($url_upload);
            $archivo->setExtensions(array('jpg', 'png', 'gif'));//le asignamos las extensiones a permitir
            if ($archivo->isUploaded()) {
                if ($archivo->save()) {
                    Flash::valid('Imagen subida correctamente...!!!');
                }
                $fotos_usuario=Load::model("fotos_usuario",
                	array(
                		'usuario_id' => Auth::get("id"),
                		'url' => $url_to_save
                	)
                );
                if (!$fotos_usuario->save()) {
                	FLash::error("No se pudo guardar el registro de la foto");
                }
            }else{
                    Flash::warning('No se ha Podido Subir la imagen...!!!');
            }
            Router::redirect("usuario/dash/#perfil");
        }
        if (Input::hasPost('mensaje')) {
        	$mensaje = Load::model('mensaje',Input::post('mensaje'));
        	if ($mensaje->save()) {
        		Flash::valid("Mensaje enviado con exito!");
        	}else{
        		Flash::error("No se envio el mensaje");
        	}
        }
	}
	public function logout(){
		if (Auth::is_valid()) {
			Auth::destroy_identity();
		}
	
		Router::redirect('usuario/ingreso');
	}
	public function index(){
		$this->usuarios = Load::model('usuario')->find();
	}
}
 ?>
