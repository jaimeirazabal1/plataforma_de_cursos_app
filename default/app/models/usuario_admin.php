<?php 
class UsuarioAdmin extends ActiveRecord{
	public function getAdmins(){
		return $this->find('join: inner join usuario on usuario_admin.usuario_id=usuario.id','columns: usuario.*');
	}
	public function esAdmin($id){
		$r= $this->find("conditions: usuario_id='$id'");
		if (isset($r[0])) {
			return true;
		}else{
			return false;
		}
	}
}


 ?>