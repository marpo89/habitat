package org.habitatnicaragua.micasa.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import org.habitatnicaragua.micasa.modelo.PerCalificacion;
import org.habitatnicaragua.micasa.modelo.dto.CalificacionPromedioDTO;

@Repository
public interface PerCalificacionDao extends JpaRepository<PerCalificacion, Long>, JpaSpecificationExecutor<PerCalificacion> {
	
	@Query(value="SELECT this FROM PerCalificacion this "
			+ " WHERE this.proveedor.idUsuario = :P_usuario")
	Page<PerCalificacion> listarPerCalificacionPorUsuario(@Param("P_usuario") String idProveedor, Pageable pagina);
	
	@Query(value="select new org.habitatnicaragua.micasa.modelo.dto.CalificacionPromedioDTO(avg(puntaje), count(*)) from PerCalificacion this" + 
				" WHERE this.proveedor.idUsuario = :P_usuario and this.puntaje >= 0 " + 
				" AND this.proveedor.idUsuario <> this.autor.idUsuario ")
	CalificacionPromedioDTO getPromedioCalificacionPorProveedor(@Param("P_usuario") String idProveedor);
	
}