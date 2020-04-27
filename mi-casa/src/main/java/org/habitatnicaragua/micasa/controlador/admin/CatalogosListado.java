package org.habitatnicaragua.micasa.controlador.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("catalogoListado")
@RequestMapping("/admin")
public class CatalogosListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioComun servicioComun;
	
	@RequestMapping(value="/catalogos.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<CatMaestro>> listarCatMaestro(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<CatMaestro> catalogos = servicioComun.listarCatMaestro(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<CatMaestro> respuesta = new RespuestaDataTable<CatMaestro>(solicitud, catalogos);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
}
