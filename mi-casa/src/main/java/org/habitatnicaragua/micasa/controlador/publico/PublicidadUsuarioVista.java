package org.habitatnicaragua.micasa.controlador.publico;

import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.PubPublicidad;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.servicio.ServicioPublicidad;

import lombok.Getter;
import lombok.Setter;

@Named("publicidadUsuarioVista")
@ViewScoped
@Getter
@Setter
public class PublicidadUsuarioVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	private Boolean visiblePublicidad = null;
	private boolean primerActivoEncontrado = false;
	private PubPublicidad publicidadPortada = null;
	private PubPublicidad publicidadInterna = null;
	
	@Inject
	private ServicioPublicidad servicioPublicidad;

	@Inject
	private ServicioPerfil servicioPerfil;

	public boolean isVisiblePublicidad() {
		if(visiblePublicidad==null) {
			visiblePublicidad = !servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN, Rol.ADMIN_TECNICO, Rol.TECNICO);
		}
		
		return visiblePublicidad;
	}
	
	public Boolean getVisiblePublicidad() {
		return isVisiblePublicidad();
	}
	
	public boolean isVisiblePublicidadPortada() {
		return getPublicidadPortada()!=null;
	}
	
	public PubPublicidad getPublicidadPortada() {
		if(!isVisiblePublicidad()) return null;
		
		if(publicidadPortada==null) {
			publicidadPortada = servicioPublicidad.buscarSiguientePublicidad("PORTADA");
		}
		
		return publicidadPortada;
	}
	
	public boolean isVisiblePublicidadInterna() {
		return getPublicidadInterna()!=null;
	}
	
	public PubPublicidad getPublicidadInterna() {
		if(!isVisiblePublicidad()) return null;
		
		if(publicidadInterna==null) {
			publicidadInterna = servicioPublicidad.buscarSiguientePublicidad("INTERNA");
		}
		
		return publicidadInterna;
	}
	
	public String getActivoCarrusel() {
		if(primerActivoEncontrado==false) {
			primerActivoEncontrado=true;
			return "active";
		}
		
		return "";
	}
}
