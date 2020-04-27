package org.habitatnicaragua.micasa.controlador.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.SegLogin;
import org.habitatnicaragua.micasa.modelo.VwActividadUsuarioNivel2;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("loginListado")
@RequestMapping("/admin")
public class LoginListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@RequestMapping(value="/loginListado.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<SegLogin>> listarSegLogin(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<SegLogin> bitacoraLogin = servicioSeguridad.listarSegLogin(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<SegLogin> respuesta = new RespuestaDataTable<SegLogin>(solicitud, bitacoraLogin);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
	@RequestMapping(value="/actividadUsrN2Listado.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<VwActividadUsuarioNivel2>> listarActividadUsuarioNivel2(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<VwActividadUsuarioNivel2> actividades = servicioSeguridad.listarActividadUsuarioNivel2(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<VwActividadUsuarioNivel2> respuesta = new RespuestaDataTable<VwActividadUsuarioNivel2>(solicitud, actividades);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
}
