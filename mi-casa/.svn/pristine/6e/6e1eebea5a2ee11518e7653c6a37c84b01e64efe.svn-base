package org.habitatnicaragua.micasa.seguridad;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.habitatnicaragua.micasa.controlador.publico.LoginVista;
import org.habitatnicaragua.micasa.modelo.SegLogin;
import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

@Configuration
public class LoginErrorHandler extends SimpleUrlAuthenticationFailureHandler {

	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@Inject
	private ServicioComun servicioComun;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
				
		SegLogin segLogin = new SegLogin();
		segLogin.setExitoso(false);
		segLogin.setFecha(servicioComun.getFechaHoraSistema());
		segLogin.setCorreo(request.getParameter("username"));
		segLogin.setIp(request.getRemoteAddr());
		
		servicioSeguridad.guardarSegLogin(segLogin);
		
		request.getSession().setAttribute(LoginVista.LOGIN_ERROR, "1");
		
		super.onAuthenticationFailure(request, response, exception);
	}

}
