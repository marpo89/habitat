package org.habitatnicaragua.micasa.controlador.usuario;

import java.util.Collections;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.VwProveedor;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("proveedoresListado")
@RequestMapping("/usuario")
public class ProveedoresListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	@RequestMapping(value="/proveedores.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<VwProveedor>> listarProveedoresPorRol(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		Page<VwProveedor> proveedores = null;
		String rol = ServletRequestUtils.getStringParameter(request, "rol", null);
		
		if(rol!=null) {
			proveedores = servicioPerfil.listarProveedoresPorRol(rol,solicitud.getSpringPageRequest(), solicitud.getSearchValue()); 			
		} else {
			proveedores = new PageImpl<VwProveedor>(Collections.<VwProveedor>emptyList());
		}
		RespuestaDataTable<VwProveedor> respuesta = new RespuestaDataTable<VwProveedor>(solicitud, proveedores);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}		
	
}
