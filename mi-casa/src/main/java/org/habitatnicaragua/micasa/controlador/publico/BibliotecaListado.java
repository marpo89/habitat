package org.habitatnicaragua.micasa.controlador.publico;

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

@RestController("bibliotecaListado")
@RequestMapping("/biblioteca")
public class BibliotecaListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	@RequestMapping(value="/carpetas.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<CmsNodo>> listarCarpetasBiblioteca(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Page<CmsNodo> carpetas = servicioContenido.listarCmsNodosBiblioteca(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<CmsNodo> respuesta = new RespuestaDataTable<CmsNodo>(solicitud, carpetas);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}

	@RequestMapping(value="/archivos.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<CmsArchivo>> listarArchivosBiblioteca(HttpServletRequest request) throws ServletRequestBindingException {
		Page<CmsArchivo> archivos = null;
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		Long idNodo = ServletRequestUtils.getLongParameter(request, "bib");
		
		if (idNodo!=null) {	
			archivos = servicioContenido.listarCmsArchivosBiblioteca(idNodo, solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		} else {
			archivos = new PageImpl<CmsArchivo>(Collections.<CmsArchivo>emptyList());
		}
		
		RespuestaDataTable<CmsArchivo> respuesta = new RespuestaDataTable<CmsArchivo>(solicitud, archivos);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
}
