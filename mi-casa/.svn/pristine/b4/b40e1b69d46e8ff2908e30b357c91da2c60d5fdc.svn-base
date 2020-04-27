package org.habitatnicaragua.micasa.controlador.usuario;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.dto.PerCalificacionDTO;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("perCalificacionListado")
@RequestMapping("/usuario")
public class PerCalificacionListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	@RequestMapping(value="/misCalificacion.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<PerCalificacionDTO>> listarCalificacion(HttpServletRequest request) throws ServletRequestBindingException {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		
		String idProveedor = ServletRequestUtils.getStringParameter(request, "u");
				
		Page<PerCalificacionDTO> calificaciones = servicioPerfil.listarPerCalificacion(solicitud.getSpringPageRequest(), idProveedor);
		
		RespuestaDataTable<PerCalificacionDTO> respuesta = new RespuestaDataTable<PerCalificacionDTO>(solicitud, calificaciones);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}	
	
}
