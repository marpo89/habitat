package org.habitatnicaragua.micasa.controlador.admin;

import java.util.Collections;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController("nodosListado")
@RequestMapping("/admin")
public class NodosListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	@RequestMapping(value="/contenidos.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<CmsNodo>> listarContenido(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<CmsNodo> nodos = servicioContenido.listarCmsNodos(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<CmsNodo> respuesta = new RespuestaDataTable<CmsNodo>(solicitud, nodos);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
	@RequestMapping(value="/archivos.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<CmsArchivo>> listarArchivos(HttpServletRequest request) throws ServletRequestBindingException {
		Page<CmsArchivo> nodos = null;
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Long idNodo = ServletRequestUtils.getLongParameter(request, "idNodo");
		
		CmsNodo nodo = servicioContenido.buscarCmsNodoPorId(idNodo);
				
		if (idNodo!=null) {	
			nodos = servicioContenido.listarCmsArchivos(nodo,solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		} else {
			nodos = new PageImpl<CmsArchivo>(Collections.<CmsArchivo>emptyList());
		}
		
		
		RespuestaDataTable<CmsArchivo> respuesta = new RespuestaDataTable<CmsArchivo>(solicitud, nodos);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
}
