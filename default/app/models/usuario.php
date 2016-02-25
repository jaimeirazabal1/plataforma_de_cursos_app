<?php 
class Usuario extends ActiveRecord{
	public function validateEmail($email){
		$r = $this->find("conditions: email='$email'");
		if ($r) {
			return true;
		}else{
			return false;
		}
	}
	public function getByEmail($email){
		$u = $this->find_first("conditions: email = '$email'");
		return $u;
	}
	public function getPasswordByEmail($email){
		$user = $this->getByEmail($email);
		if ($user) {
			return Pass::generate($user->nombre.$user->email);
		}else{
			return false;
		}
	}
}

 ?>