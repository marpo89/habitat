package org.habitatnicaragua.micasa.controlador.usuario;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("detalleUsuarioVista")
@ViewScoped
@Getter
@Setter
public class DetalleUsuarioVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	private String uuIdUsuario = null;
	private PerUsuario usuario = null;
	
	private Boolean opinionesVisibles = null;
	private Boolean opinionesLoginVisible = null;
	
	@PostConstruct
	public void init() {
		
		uuIdUsuario = getStringRequestParameter("u");
		
		if(uuIdUsuario==null) {
			throw ExcepcionUno.parametroInvalido();
		} else {
			usuario = servicioSeguridad.buscarPerUsuarioActivoPorUuid(uuIdUsuario);
		}
	}
	
	public String getRutaAvatar() {
		return servicioContenido.getRutaAvatar(usuario, getHttpServletRequest());
	}
	
	public boolean isOpinionesVisibles() {
		if(opinionesVisibles==null) {
			opinionesVisibles = usuario!=null && usuario.isNivel2() && this.getUsuarioActual()!=null;
		}
		
		return opinionesVisibles;
	}
	
	public boolean getOpinionesVisibles() {
		return isOpinionesVisibles();
	}
	
	public boolean isOpinionesLoginVisible() {
		if(opinionesLoginVisible==null) {
			opinionesLoginVisible = usuario!=null && usuario.isNivel2() && this.getUsuarioActual()==null;
		}
		
		return opinionesLoginVisible;
	}
	
	public boolean getOpinionesLoginVisible() {
		return isOpinionesVisibles();
	}
	
	public String getEnlaceProveedores() {
		if(servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN)) {
			return getHttpServletRequest().getContextPath() + "/admin/usuarios.xhtml";
		}
		
		if(servicioPerfil.isUsuarioMiembroRol(usuario, Rol.FINANCIAMIENTO)) {
			return getHttpServletRequest().getContextPath() + "/usuario/listaProveedores.xhtml?rol=financiamiento";
		}
		
		return getHttpServletRequest().getContextPath() + "/usuario/listaProveedores.xhtml?rol=material";
	}
	
	public String getLeyendaEnlaceProveedores() {
		if(servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN)) {
			return "Usuarios";
		}
		
		if(servicioPerfil.isUsuarioMiembroRol(usuario, Rol.FINANCIAMIENTO)) {
			return "Financieras";
		}
		
		if(servicioPerfil.isUsuarioMiembroRol(usuario, Rol.MATERIAL)) {
			return "Proveedores";
		}
		
		return "Usuarios";
	}
	
	
}
