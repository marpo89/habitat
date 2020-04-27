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

@Named("recuperarClaveVista")
@ViewScoped
@Getter
@Setter
public class RecuperarClaveVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioPerfil servicioPerfil;

	private String correo;
	private String captcha;

	public void recuperarClaveUsuario() {
		
		if(StringUtils.isBlank(captcha)) {
			throw ExcepcionUno.campoRequerido("Código");
		}
				
		if(true!=CaptchaService.getInstance().validateResponseForID( this.getHttpSession().getId(), captcha)) {
			throw new ExcepcionUno("El código ingresado no coincide, favor repita.");
		}

		servicioPerfil.recuperarClaveUsuario(correo);
		
		this.getHttpSession().setAttribute(LoginVista.LOGIN_REVISE_SU_CORREO, "1");
	}
}
