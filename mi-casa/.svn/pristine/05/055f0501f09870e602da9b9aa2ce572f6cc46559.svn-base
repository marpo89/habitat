package org.habitatnicaragua.micasa.dao;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.PerDireccion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PerDireccionDao extends JpaRepository<PerDireccion, Long>, JpaSpecificationExecutor<PerDireccion> {		

	@Query("SELECT this FROM PerDireccion this where this.usuario.idUsuario = :idUsuario")
	List<PerDireccion> listarTodasDireccionesUsuario(@Param("idUsuario") String idUsuario);
	
	
}