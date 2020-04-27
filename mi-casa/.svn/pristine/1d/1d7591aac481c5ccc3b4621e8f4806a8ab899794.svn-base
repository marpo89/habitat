package org.habitatnicaragua.micasa.controlador.publico;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

@RestController("activarCuenta")
@RequestMapping("/publico")
public class ActivarCuenta {
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	@RequestMapping(value="/activarCuenta/{codigo}", method=RequestMethod.GET)
	public RedirectView activarCuenta(@PathVariable("codigo") String codigo, HttpSession httpSession) {
		
		if(!StringUtils.isBlank(codigo)) {
			if(servicioPerfil.activarCuenta(codigo)) {
				httpSession.setAttribute(LoginVista.LOGIN_CUENTA_ACTIVADA, "1");
			}
		}
		
		return new RedirectView("/login.xhtml");
	}
	
}
