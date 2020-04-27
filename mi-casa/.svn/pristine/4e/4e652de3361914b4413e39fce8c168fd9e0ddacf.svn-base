package org.habitatnicaragua.micasa.servicio;

import java.io.InputStream;

import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.PryComentario;
import org.habitatnicaragua.micasa.modelo.PryProyecto;
import org.habitatnicaragua.micasa.modelo.dto.ActividadRecienteProyectoDTO;
import org.habitatnicaragua.micasa.modelo.dto.PryComentarioDTO;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ServicioProyecto {	
	
	/** Inicio: PryProyecto **/	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	PryProyecto buscarPryProyectoPorId(Long idProyecto);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	Page<PryProyecto> listarMisPryProyectosUsuario(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'ADMIN_TECNICO')")
	Page<PryProyecto> listarPryProyectos(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'TECNICO')")
	Page<PryProyecto> listarMisPryProyectosAsignados(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	void eliminarPryProyecto(Long idProyecto) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	PryProyecto guardarPryProyectoUsuario(PryProyecto proyecto) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	CatMaestro getEstadoProyecto(String nombre);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	ActividadRecienteProyectoDTO buscarActividadRecienteProyectoPorUsuarioActual();
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	PryProyecto cancelarProyectoPorCliente(Long idProyecto) throws ExcepcionUno;

	/** Fin: PryProyecto **/
	
	/** Inicio: PryComentario **/	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	PryComentario buscarPryComentarioPorId(Long idComentario);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	Page<PryComentarioDTO> listarPryComentariosPorProyecto(Pageable pagina, Long idProyecto);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	void eliminarPryComentario(Long idComentario) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	PryComentario guardarPryComentario(String comentario, PryProyecto proyecto) throws ExcepcionUno;

	/** Fin: PryComentario **/
	
	/** Inicio: Archivo Proyecto **/
	@PreAuthorize("hasAnyRole('ADMIN', 'ADMIN_TECNICO', 'TECNICO')")
	CmsArchivo subirArchivoProyecto(PryProyecto proyecto, String nombreArchivo, InputStream archivo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	CmsArchivo buscarArchivoProyecto(long idProyecto, long idArchivo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	InputStream obtenerInputStreamArchivoLocalProyecto(CmsArchivo cmsArchivo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'ADMIN_TECNICO', 'TECNICO')")
	void eliminarCmsArchivo(long idProyecto, long idArchivo) throws ExcepcionUno;
			
	/** Fin: Archivo Proyecto **/
}
