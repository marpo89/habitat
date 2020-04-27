package org.habitatnicaragua.micasa.controlador.publico;

import javax.faces.bean.ViewScoped;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;

import lombok.Getter;
import lombok.Setter;

@Named("loginVista")
@ViewScoped
@Getter
@Setter
public class LoginVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;
	
	public static final String LOGIN_REVISE_SU_CORREO = "LOGIN_REVISE_SU_CORREO";
	public static final String LOGIN_CUENTA_ACTIVADA = "LOGIN_CUENTA_ACTIVADA";
	public static final String LOGIN_ERROR = "LOGIN_ERROR";
	
	private boolean mostrarMensajeRevisarCorreo = false;
	private boolean mostrarMensajeCuentaActivada = false;
	private boolean mostrarMensajeError = false;
	
	public boolean isMostrarMensajeRevisarCorreo() {
		if("1".equals(this.getHttpSession().getAttribute(LOGIN_REVISE_SU_CORREO))) {
			this.getHttpSession().removeAttribute(LOGIN_REVISE_SU_CORREO);
			mostrarMensajeRevisarCorreo = true;
		}
		
		return mostrarMensajeRevisarCorreo;
	}
	
	public boolean isMostrarMensajeCuentaActivada() {
		if("1".equals(this.getHttpSession().getAttribute(LOGIN_CUENTA_ACTIVADA))) {
			this.getHttpSession().removeAttribute(LOGIN_CUENTA_ACTIVADA);
			mostrarMensajeCuentaActivada = true;
		}
		
		return mostrarMensajeCuentaActivada;
	}
	
	public boolean isMostrarMensajeError() {
		if("1".equals(this.getHttpSession().getAttribute(LOGIN_ERROR))) {
			this.getHttpSession().removeAttribute(LOGIN_ERROR);
			mostrarMensajeError = true;
		}
		
		return mostrarMensajeError;
	}
}
