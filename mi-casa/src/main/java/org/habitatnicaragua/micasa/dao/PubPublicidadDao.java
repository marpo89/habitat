package org.habitatnicaragua.micasa.dao;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.PubPublicidad;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PubPublicidadDao extends JpaRepository<PubPublicidad, Long>, JpaSpecificationExecutor<PubPublicidad> {	
	
	@Query("SELECT this FROM PubPublicidad this " + 
			" WHERE this.activo=true AND CURRENT_DATE >= this.inicio AND CURRENT_DATE <= this.fin "
			+ " AND (this.impresiones < this.maxImpresiones OR this.maxImpresiones=0)"
			+ " AND (this.clicks < this.maxClicks OR this.maxClicks=0)"
			+ " AND (this.archivo1 IS NOT NULL OR this.archivo2 IS NOT NULL OR this.archivo3 IS NOT NULL)"
			+ " AND this.ubicacionAnuncio.nombre = :ubicacion"
			+ " ORDER BY RANDOM()")
	List<PubPublicidad> buscarSiguientePublicidad(@Param("ubicacion") String ubicacion);

	@Modifying
	@Query(value="UPDATE PubPublicidad this SET this.impresiones = COALESCE(this.impresiones,0) + 1 "
			+ " where this = :P_ID_PUBLICIDAD LIMIT 1")
	void contarImpresion(@Param("P_ID_PUBLICIDAD") PubPublicidad pubPublicidad);

	@Modifying
	@Query(value="UPDATE PubPublicidad this SET this.clicks = COALESCE(this.clicks,0) + 1 "
			+ " where this = :P_ID_PUBLICIDAD LIMIT 1")
	void contarClick(@Param("P_ID_PUBLICIDAD") PubPublicidad pubPublicidad);
	
}