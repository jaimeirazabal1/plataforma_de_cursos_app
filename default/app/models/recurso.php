<?php 
class Recurso extends ActiveRecord{
	public function getByModuloId($modulo_id){
		return $this->find("conditions: modulo_id = '$modulo_id'");
	}
}



 ?>