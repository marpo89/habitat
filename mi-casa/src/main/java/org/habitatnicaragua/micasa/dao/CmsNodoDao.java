package org.habitatnicaragua.micasa.dao;

import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CmsNodoDao extends JpaRepository<CmsNodo, Long>, JpaSpecificationExecutor<CmsNodo> {		
	
	@Query("SELECT this FROM CmsNodo this where this.enlace = :enlace AND this.sistema = true")
	CmsNodo buscarNodoDeSistema(@Param("enlace") String enlace);
	
}