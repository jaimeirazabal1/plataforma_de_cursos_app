<?php
/**
 * @see Controller nuevo controller
 */
require_once CORE_PATH . 'kumbia/controller.php';

/**
 * Controlador principal que heredan los controladores
 *
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 */
class AppController extends Controller
{
	

    final protected function initialize()
    {
    	$this->admin = array(
    		'1'=> array('email'=>'admin@admin.com','nombre'=>'admin','password'=>'admin')
    	);
    	if (Auth::is_valid() and Auth::get('nombre') == 'admin') {
    		View::template('admin');
    	}
        $paginas_comunes = array('usuario/ingreso','usuario/logout','index/index');
        $ruta_actual = Router::get("controller")."/".Router::get("action");
        if (!Auth::is_valid() and !in_array($ruta_actual, $paginas_comunes)) {
            Flash::error("Es necesario ser un usuario autenticado");
            Router::redirect("usuario/ingreso");
        }
    }

    final protected function finalize()
    {
        
    }

    protected function esAdmin($email,$password){
    	foreach (Load::model('usuario')->find() as $key => $value) {
    		$admin = $value;
    		if ($email == $admin->email && $password == $admin->password) {
		        $auth = new Auth("model", "class: usuario", "email: $email", "password: $password");
		        if ($auth->authenticate()) {  
					return true;
	    			break;
		        }
    		}
    	}
    	return false;
    }

}
