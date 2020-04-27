package org.habitatnicaragua.micasa.dao;

import org.habitatnicaragua.micasa.modelo.PryProyecto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PryProyectoDao extends JpaRepository<PryProyecto, Long>, JpaSpecificationExecutor<PryProyecto> {

	@Query("SELECT this FROM PryProyecto this where this.idProyecto = :idProyecto AND this.auditoria.usuarioReg = :idUsuario")
	PryProyecto buscarProyectoPorDuenio(@Param("idProyecto") Long idProyecto, @Param("idUsuario") String idUsuario);
	
	@Query("SELECT this FROM PryProyecto this where this.idProyecto = :idProyecto AND this.tecnico.idUsuario = :idTecnico")
	PryProyecto buscarProyectoPorTecnico(@Param("idProyecto") Long idProyecto, @Param("idTecnico") String idTecnico);
}