package org.habitatnicaragua.micasa.controlador.publico;

import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.captcha.CaptchaService;
import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("registroVista")
@ViewScoped
@Getter
@Setter
public class RegistroVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioPerfil servicioPerfil;
	
	private String nombresApellidos;
	private String correo;
	private String clave;
	private String clave2;
	private String captcha;
	private boolean aceptaTerminos;
	
	public void crearNuevaCuenta() {
		
		if(StringUtils.isBlank(clave) || StringUtils.isBlank(clave2)) {
			throw ExcepcionUno.campoRequerido("Contraseña");
		}
		
		if(!StringUtils.equals(clave, clave2)) {
			throw new ExcepcionUno("Las contraseñas no coinciden.");
		}
		
		if(StringUtils.isBlank(captcha)) {
			throw ExcepcionUno.campoRequerido("Código");
		}
		
		if(!aceptaTerminos) {
			throw new ExcepcionUno("Debe aceptar los términos de uso.");
		}
		
		if(true!=CaptchaService.getInstance().validateResponseForID( this.getHttpSession().getId(), captcha)) {
			throw new ExcepcionUno("El código ingresado no coincide, favor repita.");
		}

		servicioPerfil.crearNuevaCuentaAutoRegistro(correo, clave, nombresApellidos);
		
		this.getHttpSession().setAttribute(LoginVista.LOGIN_REVISE_SU_CORREO, "1");
	}
}
