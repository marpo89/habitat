package org.habitatnicaragua.micasa.controlador.publico;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("mapaVista")
@ViewScoped
@Getter
@Setter
public class MapaVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	private PerUsuario perProveedor;
	
	@PostConstruct
	public void init() {
		String idProveedor =  getStringRequestParameter("u");
		
		if(idProveedor==null) {
			throw ExcepcionUno.parametroInvalido();
		}
		perProveedor = servicioSeguridad.buscarPerUsuarioActivoPorUuid(idProveedor);
		
		if(perProveedor!=null && !perProveedor.isNivel2() && !perProveedor.isAdmin()) {
			perProveedor=null;
		}
	}
	
	public boolean isHabilitadoAgregar() {
		if(perProveedor==null) return false;
		
		if(perProveedor.getIdUsuario().equals(getUsuarioActual().getIdUsuario() )) {
			return true;
		}
		
		return false;
	}
		
	public String getTituloPagina() {
		if(perProveedor==null) return "";
		
		return perProveedor.getNombres();
	}
	
	public boolean isVisible() {
		return perProveedor!=null;
	}
	
}
