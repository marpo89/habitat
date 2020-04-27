package org.habitatnicaragua.micasa.controlador.admin;

import java.util.Collections;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.PerDireccion;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.SegRol;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.common.collect.Lists;

@RestController("usuariosListado")
@RequestMapping("/admin")
public class UsuariosListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@RequestMapping(value="/usuarios.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<PerUsuario>> listarUsuarios(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<PerUsuario> usuarios = servicioSeguridad.listarUsuarios(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<PerUsuario> respuesta = new RespuestaDataTable<PerUsuario>(solicitud, usuarios);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
	@RequestMapping(value="/usuarioRoles.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<SegRol>> listarRolesUsuarios(HttpServletRequest request) {
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		Page<SegRol> rolesUsuario = null;
		
		String idPerUsuario = ServletRequestUtils.getStringParameter(request, "idPerUsuario", null);
		
		if(idPerUsuario!=null) {
			PerUsuario perUsuario = servicioSeguridad.buscarPerUsuarioPorId(idPerUsuario);
			rolesUsuario = new PageImpl<SegRol>(Lists.newArrayList(perUsuario.getRoles()));
		} else {
			rolesUsuario = new PageImpl<SegRol>(Collections.<SegRol>emptyList());
		}
		
		RespuestaDataTable<SegRol> respuesta = new RespuestaDataTable<SegRol>(solicitud, rolesUsuario);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
	@RequestMapping(value="/usuarioDireccion.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<PerDireccion>> listarUsuariosDireccion(HttpServletRequest request) {			
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		Page<PerDireccion> usuariosDireccion = null;
		
		String idPerUsuario = ServletRequestUtils.getStringParameter(request, "idPerUsuario", null);
		
		if(idPerUsuario!=null) {
			usuariosDireccion = servicioSeguridad.listarDireccionesPorUsuario(idPerUsuario,solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		} else {
			usuariosDireccion = new PageImpl<PerDireccion>(Collections.<PerDireccion>emptyList());
		}
		
		RespuestaDataTable<PerDireccion> respuesta = new RespuestaDataTable<PerDireccion>(solicitud, usuariosDireccion);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
}
