package org.habitatnicaragua.micasa.controlador.gestion;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.PryProyecto;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.modelo.dto.PryComentarioDTO;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.servicio.ServicioProyecto;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController("proyectosListado")
@RequestMapping("/gestion")
public class ProyectosListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioProyecto servicioProyecto;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	@RequestMapping(value="/proyectos.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<PryProyecto>> listarTodosLosProyectos(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<PryProyecto> proyectos = null;
		if(servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO) || servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN)) {
			proyectos = servicioProyecto.listarPryProyectos(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		} else if(servicioPerfil.isUsuarioActualMiembroRol(Rol.TECNICO)) {
			proyectos = servicioProyecto.listarMisPryProyectosAsignados(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		}
		
		RespuestaDataTable<PryProyecto> respuesta = new RespuestaDataTable<PryProyecto>(solicitud, proyectos);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
	@RequestMapping(value="/proyectos/comentarios.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<PryComentarioDTO>> listarComentariosPorProyectos(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Long idProyecto = ServletRequestUtils.getLongParameter(request, "idProyecto", 0L);

		Page<PryComentarioDTO> comentarios = servicioProyecto.listarPryComentariosPorProyecto(solicitud.getSpringPageRequest(), idProyecto);
		
		RespuestaDataTable<PryComentarioDTO> respuesta = new RespuestaDataTable<PryComentarioDTO>(solicitud, comentarios);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
	@RequestMapping(value="/proyectos/archivos.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<CmsArchivo>> listarArchivosPorProyectos(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Long idProyecto = ServletRequestUtils.getLongParameter(request, "idProyecto", 0L);

		Page<CmsArchivo> comentarios = servicioContenido.listarCmsArchivosPorProyecto(solicitud.getSpringPageRequest(), idProyecto);
		
		RespuestaDataTable<CmsArchivo> respuesta = new RespuestaDataTable<CmsArchivo>(solicitud, comentarios);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
}
