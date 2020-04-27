package org.habitatnicaragua.micasa.dao;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CmsArchivoDao extends JpaRepository<CmsArchivo, Long>, JpaSpecificationExecutor<CmsArchivo> {		

	@Query("SELECT this FROM CmsArchivo this WHERE this.nodo = :nodo AND this.activo = true ORDER BY this.orden, this.idArchivo")
	List<CmsArchivo> listarArchivosPorNodo(@Param("nodo") CmsNodo nodo);
	
	@Query("SELECT this FROM CmsArchivo this WHERE this.nodo = :nodo ORDER BY this.orden")
	Page<CmsArchivo> listadoTodosLosArchivosPorNodo(@Param("nodo") CmsNodo nodo, Pageable paginacion);
	
	@Query(value="select this from CmsArchivo this "
			+ " where this.proyecto.idProyecto = :P_idProyecto AND this.activo=true "
			+ " order by this.orden DESC, this.auditoria.fechaReg DESC")
	Page<CmsArchivo> listarArchivosPorProyecto(@Param("P_idProyecto") Long idProyecto, Pageable pagina);

	@Query(value="select this from CmsArchivo this "
			+ " where this.proyecto.idProyecto = :P_idProyecto AND this.proyecto.duenio = :P_duenio AND this.activo=true "
			+ " order by this.orden DESC, this.auditoria.fechaReg DESC")
	Page<CmsArchivo> listarArchivosPorDuenioProyecto(@Param("P_idProyecto") Long idProyecto, @Param("P_duenio") PerUsuario duenio, Pageable pagina);

	@Query("SELECT this FROM CmsArchivo this WHERE this.ruta = :ruta AND this.activo = true")
	List<CmsArchivo> buscarArchivosTipoEnlacePorRuta(@Param("ruta") String ruta);
	
	@Query("SELECT this FROM CmsArchivo this "
			+ " WHERE this.proyecto.duenio.idUsuario = :idUsuario AND this.proyecto.estado.nombre IN :estados "
			+ " ORDER BY this.auditoria.fechaReg DESC")
	List<CmsArchivo> buscarArchivoRecientePorUsuario(@Param("idUsuario") String idUsuario, @Param("estados") List<String> estados, Pageable pageable);
}