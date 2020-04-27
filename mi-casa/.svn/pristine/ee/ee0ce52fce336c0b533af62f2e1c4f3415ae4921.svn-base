package org.habitatnicaragua.micasa.controlador.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;

import org.habitatnicaragua.micasa.modelo.PubPublicidad;
import org.habitatnicaragua.micasa.servicio.ServicioPublicidad;
import org.springframework.data.domain.Page;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("publicidadListado")
@RequestMapping("/admin")
public class PublicidadListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioPublicidad servicioPublicidad;
	
	@RequestMapping(value="/publicidad.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<PubPublicidad>> listarPublicidad(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<PubPublicidad> carpetas = servicioPublicidad.listarPubPublicidad(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<PubPublicidad> respuesta = new RespuestaDataTable<PubPublicidad>(solicitud, carpetas);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}

}
