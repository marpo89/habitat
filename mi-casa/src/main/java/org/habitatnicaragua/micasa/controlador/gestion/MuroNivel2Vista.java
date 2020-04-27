package org.habitatnicaragua.micasa.controlador.gestion;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.servicio.ServicioContenidoNivel2;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("muroNivel2Vista")
@ViewScoped
@Getter
@Setter
public class MuroNivel2Vista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioSeguridad servicioSeguridad;

	@Inject
	private ServicioContenidoNivel2 servicioContenidoNivel2;
	
	private String uuIdUsuario = null;
	private PerUsuario usuario = null;
	
	@PostConstruct
	public void init() {
		uuIdUsuario = getStringRequestParameter("u");
		
		if(uuIdUsuario==null) {
			uuIdUsuario = getIdUsuarioActual();
		}
		
		usuario = servicioSeguridad.buscarPerUsuarioActivoPorUuid(uuIdUsuario);
	}
	
	public void eliminarContenido() {
		Long idContenido = this.getLongRequestParameter("idContenido");
		
		if (idContenido == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioContenidoNivel2.eliminarCmsContenidoNivel2(idContenido);
	}
}
