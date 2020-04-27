package org.habitatnicaragua.micasa.controlador.usuario;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.PerDireccion;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.dto.MarcadorMapaDTO;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("direccionesListado")
@RequestMapping("/usuario")
public class DireccionesListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@RequestMapping(value="/misDirecciones.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<PerDireccion>> listarMisDirecciones(HttpServletRequest request) {			
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		Page<PerDireccion> usuariosDireccion = null;
		
		String idPerUsuario = this.getIdUsuarioActual();
		
		if(idPerUsuario!=null) {
			usuariosDireccion = servicioSeguridad.listarDireccionesPorUsuario(idPerUsuario, solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		} else {
			usuariosDireccion = new PageImpl<PerDireccion>(Collections.<PerDireccion>emptyList());
		}
		
		RespuestaDataTable<PerDireccion> respuesta = new RespuestaDataTable<PerDireccion>(solicitud, usuariosDireccion);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
	@RequestMapping(value="{uuidUsuario}/direccionesMapa.json", method=RequestMethod.POST)
	public ResponseEntity<List<MarcadorMapaDTO>> listarDireccionesMapa(@PathVariable("uuidUsuario") String uuidUsuario) {
		List<MarcadorMapaDTO> respuesta;
		PerUsuario perUsuario = servicioSeguridad.buscarPerUsuarioActivoPorUuid(uuidUsuario);

		if(perUsuario!=null) {
			respuesta = new ArrayList<>();
			List<PerDireccion> direcciones = servicioSeguridad.listarTodasDireccionesUsuario(perUsuario.getIdUsuario());
			for(PerDireccion perDireccion:direcciones) {
				if(perDireccion.getLatitud()!=null && perDireccion.getLongitud()!=null) {
					respuesta.add(new MarcadorMapaDTO(perDireccion));
				}
			}
		} else {
			respuesta = Collections.<MarcadorMapaDTO>emptyList();
		}
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}	
	
}
