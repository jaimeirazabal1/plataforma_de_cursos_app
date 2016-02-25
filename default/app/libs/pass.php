<?php 
class Pass{
	public static function generate($pass){
		return md5($pass);
	}
}

 ?>