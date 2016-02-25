<?php 
class RecursoUsuarioHabilitado extends ActiveRecord{
	/*devuelve true si el recurso esta en le base de datos o false si no esta*/
	public function recursoHabilitado($curso_id,$recurso_id,$usuario_id){
		$result = $this->find("conditions: curso_id = '$curso_id' and recurso_id='$recurso_id' and usuario_id ='$usuario_id'");
		if ($result) {
			return true;
		}else{
			return false;
		}
	}
	public function habilitarRecurso($curso_id,$recurso_id,$usuario_id){
		if ($this->recursoHabilitado($curso_id,$recurso_id,$usuario_id)) {
			$result = $this->find("conditions: curso_id = '$curso_id' and recurso_id='$recurso_id' and usuario_id ='$usuario_id'");
			$result[0]->habilitado = 1;
			return $result[0]->update();
		}else{
			$recurso_habilitado = Load::model('recurso_usuario_habilitado',array(
				'curso_id'=>$curso_id,
				'recurso_id'=>$recurso_id,
				'usuario_id'=>$usuario_id,
				'habilitado'=>1
			));
			return $recurso_habilitado->save();
		}
	}
	public function getHabilitados($group=true,$usuario_id=''){
		$q="SELECT 
			usuario.*,
			recurso.nombre as nombre_recurso,
			recurso.id as id_recurdo,
			recurso.descripcion as descripcion_recurso,
			recurso.tipo as tipo_recurso,
			recurso.url,
			curso.nombre as nombre_curso,
			recurso_usuario_habilitado.id as id_activacion
			FROM `recurso_usuario_habilitado`
			inner join usuario on usuario.id = recurso_usuario_habilitado.usuario_id
			inner join recurso on recurso.id = recurso_usuario_habilitado.recurso_id
			inner join curso on recurso_usuario_habilitado.curso_id = curso.id
			
			where recurso_usuario_habilitado.habilitado = 1
			";
			if ($usuario_id) {
				$q.=" and recurso_usuario_habilitado.usuario_id='$usuario_id' ";
			}
			if ($group) {
				$group= " group by usuario.nombre";
				$q = $q.$group;
			}else{
				$q=$q." order by usuario.nombre asc ";
			}
		return $this->find_all_by_sql($q);
	}

}


 ?>