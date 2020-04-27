package org.habitatnicaragua.micasa.controlador.usuario;

import java.util.Collections;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.dto.CmsContenidoNivel2DTO;
import org.habitatnicaragua.micasa.servicio.ServicioContenidoNivel2;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("muroListado")
@RequestMapping("/muro")
public class MuroListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioContenidoNivel2 servicioContenidoNivel2;

	@RequestMapping(value="/contenido.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<CmsContenidoNivel2DTO>> listarContenidoMuroPorUsuario(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		Page<CmsContenidoNivel2DTO> contenidoMuro = null;
		
		String idUsuario = ServletRequestUtils.getStringParameter(request, "u", null);
		
		if(StringUtils.isBlank(idUsuario)) {
			idUsuario = getIdUsuarioActual();
		}
		
		if(!StringUtils.isBlank(idUsuario)) {
			contenidoMuro = servicioContenidoNivel2.listarContenidoMuroPorUsuario(idUsuario, solicitud.getSpringPageRequest(new Sort(Sort.Direction.DESC, "idContenido")));
		} else {
			contenidoMuro = new PageImpl<CmsContenidoNivel2DTO>(Collections.<CmsContenidoNivel2DTO>emptyList());
		}
		
		RespuestaDataTable<CmsContenidoNivel2DTO> respuesta = new RespuestaDataTable<CmsContenidoNivel2DTO>(solicitud, contenidoMuro);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
}
