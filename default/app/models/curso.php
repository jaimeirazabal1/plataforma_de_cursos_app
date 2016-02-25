<?php 
class Curso extends ActiveRecord{
	public function getCursos(){
		$r = $this->find_all_by_sql("SELECT 
									curso.id,
									curso.orden,
									curso.nombre,
									curso.creado,
									modulo.nombre as nombre_modulo
									FROM 
									curso inner join modulo on curso.modulo_id = modulo.id 
									");
		return $r;
	}
	public function getCursoById($id){
		$r = $this->find_all_by_sql("SELECT 
									curso.id,
									curso.orden,
									curso.nombre,
									curso.creado,
									modulo.nombre as nombre_modulo,
									modulo.publico,
									modulo.id as modulo_id
									FROM 
									curso inner join modulo on curso.modulo_id = modulo.id 
									where curso.id = $id
									");
		return $r;		
	}
	public function getGratuitos(){
		$q="SELECT 
			modulo.id as id_modulo,
			modulo.nombre as nombre_modulo,
			modulo.publico as publico_modulo,
			curso.orden,
			curso.nombre as nombre_curso,
			curso.id as curso_id
			from 
			modulo inner join curso on modulo.id = curso.modulo_id
			where modulo.publico = '1'
			order by nombre_curso";
		$r = $this->find_all_by_sql($q);
		$cursos=array();
		
		$c=0;
		foreach ($r as $key => $value) {
			$orden=unserialize($value->orden);
			$orden_mostrar = array();
			foreach ($orden as $key => $value2) {
				$recurso = Load::model("recurso")->find($key);
				$orden_mostrar[$value2]=$recurso;
			}
			$cursos[$c]['curso']=$value;
			$cursos[$c]['recursos']=$orden_mostrar;
			$c++;

		}
		return $cursos;
	}

	public function getCursosPagosPorOrden(){
		$q = "SELECT * FROM curso 
			inner join modulo on curso.modulo_id = modulo.id
			inner join boton_pago on boton_pago.modulo_id = curso.modulo_id
			where modulo.publico = 0";
		return $this->find_all_by_sql($q);
	}
	public function getCursosGratisPorOrden(){
		$q = "SELECT curso.* FROM curso 
			inner join modulo on curso.modulo_id = modulo.id
			where modulo.publico = 1";
		return $this->find_all_by_sql($q);
	}
}


 ?>