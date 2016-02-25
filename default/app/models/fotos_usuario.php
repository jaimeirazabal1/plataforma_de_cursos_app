<?php 
class FotosUsuario extends ActiveRecord{
	public function getLast($id){
		$r = $this->find("conditions: usuario_id ='$id'",'limit: 1','order: creado desc');
		return isset($r[0]) ? $r[0] : null;
	}	
}


 ?>