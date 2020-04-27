package org.habitatnicaragua.micasa.controlador.gestion;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.OftOferta;
import org.habitatnicaragua.micasa.modelo.VwOferta;
import org.habitatnicaragua.micasa.servicio.ServicioOferta;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("ofertasListado")
public class OfertasListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioOferta servicioOferta;
	
	@RequestMapping(value="/gestion/ofertas.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<OftOferta>> listarOftOferta(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<OftOferta> ofertas = servicioOferta.listarOftOferta(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<OftOferta> respuesta = new RespuestaDataTable<OftOferta>(solicitud, ofertas);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}	
	
	@RequestMapping(value="/ofertas/ofertasActivas.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<VwOferta>> listarOfertaActiva(HttpServletRequest request) {
		
		String idProveedor = ServletRequestUtils.getStringParameter(request, "p", null);

		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<VwOferta> ofertasActivas = servicioOferta.listarOfertaActiva(solicitud.getSpringPageRequest(), solicitud.getSearchValue(), idProveedor);
		
		RespuestaDataTable<VwOferta> respuesta = new RespuestaDataTable<VwOferta>(solicitud, ofertasActivas);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
}
