<?php 
class Mail{

	public static function sendMail($to,$title,$message){
		return mail($to, $title, $message);
	}
}

 ?>