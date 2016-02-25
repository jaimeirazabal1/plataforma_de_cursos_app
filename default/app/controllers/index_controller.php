<?php

/**
 * Controller por defecto si no se usa el routes
 * 
 */
class IndexController extends AppController
{

    public function index()
    {
        if (Input::hasPost("nombre","correo")) {
        	$usuario = Load::model("usuario");
        	if ($usuario->validateEmail(Input::post("correo"))) {
        		Flash::error("El correo electronico ya fue usado, por favor use otro!");
        	}else{
        		$this->link_ingreso = "http://jaig.net.ve/aplicaciones/plataforma_cursos/usuario/ingreso";
	        	$titulo = 'Bienvenido a tu curso gratis '.Input::post("nombre");
	        	$mensaje = 'Bienvenido '.Input::post("nombre").' has ingresado con el correo: '.Input::post("correo").' tu contraseña es: '.Pass::generate(Input::post('nombre').Input::post('correo'));

	        	$usuario->nombre = Input::post("nombre");
	        	$usuario->password = Pass::generate(Input::post('nombre').Input::post('correo'));
	        	$usuario->email = Input::post("correo");
	        	if ($usuario->save()) {
	        		if(Mail::sendMail(Input::post("correo"),$titulo,$mensaje)){
	        			Flash::valid('mamese un webo bien pelado '.$mensaje);
	        			$this->success = true;
	        		}
	        	}else{
	        		Flash::error("No se pudo crear el nuevo usuario");
	        			$this->success = false;

	        	}

        	}
        }
    }

}
