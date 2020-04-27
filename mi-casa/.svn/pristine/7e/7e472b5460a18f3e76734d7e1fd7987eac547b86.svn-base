package org.habitatnicaragua.micasa.controlador.admin;

import java.util.Set;

import javax.faces.bean.ViewScoped;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.seguridad.UsuariosActivos;

import lombok.Getter;
import lombok.Setter;

@Named("usuariosEnLineaVista")
@ViewScoped
@Getter
@Setter
public class UsuariosEnLineaVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;
	
	private Set<String> usuariosEnLinea = null;

	public Set<String> getUsuariosEnLinea(){		
		if(usuariosEnLinea==null) {
			usuariosEnLinea = UsuariosActivos.get().getUsuariosEnLinea();
		}
		
		return usuariosEnLinea;
	}
}
