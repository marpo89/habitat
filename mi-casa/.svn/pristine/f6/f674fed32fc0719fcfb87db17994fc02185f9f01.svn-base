package org.habitatnicaragua.micasa.dao;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.PryComentario;
import org.habitatnicaragua.micasa.modelo.dto.PryComentarioDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PryComentarioDao extends JpaRepository<PryComentario, Long>, JpaSpecificationExecutor<PryComentario> {		

	@Query(value="select new org.habitatnicaragua.micasa.modelo.dto.PryComentarioDTO(this) "
			+ " from PryComentario this "
			+ " where this.idProyecto.idProyecto = :P_idProyecto AND this.activo=true ")
	Page<PryComentarioDTO> listarComentariosPorProyecto(@Param("P_idProyecto") Long idProyecto, Pageable pagina);

	
	@Query(value="select new org.habitatnicaragua.micasa.modelo.dto.PryComentarioDTO(this) "
			+ " from PryComentario this "
			+ " where this.idProyecto.idProyecto = :P_idProyecto AND this.idProyecto.duenio = :P_duenio AND this.activo=true")
	Page<PryComentarioDTO> listarComentariosPorDuenioProyecto(@Param("P_idProyecto") Long idProyecto, @Param("P_duenio") PerUsuario duenio, Pageable pagina);

	@Query("SELECT this FROM PryComentario this "
			+ " WHERE this.idProyecto.duenio.idUsuario = :idUsuario AND this.idProyecto.estado.nombre IN :estados "
			+ " ORDER BY this.auditoria.fechaReg DESC")
	List<PryComentario> buscarComentarioRecientePorUsuario(@Param("idUsuario") String idUsuario, @Param("estados") List<String> estados, Pageable pageable);
}