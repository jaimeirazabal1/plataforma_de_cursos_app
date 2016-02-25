<?php 

class Mensaje extends ActiveRecord{

	public function mensajesDeUsuario($id){
		$r = $this->find_all_by_sql("SELECT 
						usuario.nombre,
						mensaje.*
						FROM `mensaje` 
						inner join usuario on usuario.id = mensaje.creado_por
						where (para='$id')
						order by mensaje.creado desc");
		
		$r2 = $this->find_all_by_sql("SELECT 
						usuario.nombre,
						mensaje.*
						FROM `mensaje` 
						inner join usuario on usuario.id = mensaje.creado_por
						where (creado_por='$id')
						order by mensaje.creado desc");

		return array_merge($r,$r2);
	}
}


 ?>