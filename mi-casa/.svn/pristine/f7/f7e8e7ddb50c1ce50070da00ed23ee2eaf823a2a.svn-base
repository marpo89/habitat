package org.habitatnicaragua.micasa.dao;

import org.habitatnicaragua.micasa.modelo.SegRol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SegRolDao extends JpaRepository<SegRol, String>, JpaSpecificationExecutor<SegRol> {		

	@Query(value="select this from SegRol this where this.rol = :rol")
	SegRol buscarSegRolPorNombre(@Param("rol") String rol);

}