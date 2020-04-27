package org.habitatnicaragua.micasa.controlador.comun;

import java.io.Serializable;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;

public abstract class ContextoUno implements Serializable {
	private static final long serialVersionUID = 1L;	
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	public PerUsuario getUsuarioActual() {
		return servicioPerfil.getUsuarioActual();
	}
	
	public String getIdUsuarioActual(){
		String idUsuario = servicioPerfil.getIdUsuarioActual();
		
		return idUsuario==null?"":idUsuario;
	}

	public String getUsuarioActualUI(){
		PerUsuario usuario = servicioPerfil.getUsuarioActual();
		
		return usuario==null?"":usuario.getCorreo();
	}
	
	public void irA(HttpServletResponse httpServletResponse, String lugar) {
		httpServletResponse.setHeader("Location", lugar);
	    httpServletResponse.setStatus(302);
	}
}
