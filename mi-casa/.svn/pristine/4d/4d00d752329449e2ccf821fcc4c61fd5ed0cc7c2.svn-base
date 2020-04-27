package org.habitatnicaragua.micasa.seguridad;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.springframework.security.core.context.SecurityContext;

@WebListener
public class MiHttpSessionAttributeListener implements HttpSessionAttributeListener {
	
	// org.springframework.security.core.context.SecurityContextImpl@f1b1b601: Authentication: org.springframework.security.authentication.UsernamePasswordAuthenticationToken@f1b1b601: Principal: org.springframework.security.core.userdetails.User@6498cd1c: Username: denisjtorresg@gmail.com; Password: [PROTECTED]; Enabled: true; AccountNonExpired: true; credentialsNonExpired: true; AccountNonLocked: true; Granted Authorities: ROLE_USUARIO; Credentials: [PROTECTED]; Authenticated: true; Details: org.springframework.security.web.authentication.WebAuthenticationDetails@ffff4c9c: RemoteIpAddress: 0:0:0:0:0:0:0:1; SessionId: C13C9EA546FAFF69482E3BFD0AC62751; Granted Authorities: ROLE_USUARIO
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		if("SPRING_SECURITY_CONTEXT".equals(se.getName())) {
			if(se.getValue() instanceof SecurityContext) {
				SecurityContext sc = (SecurityContext)se.getValue();
				UsuariosActivos.get().getSesionesActivas().put(se.getSession().getId(), sc.getAuthentication().getName());
			}
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		if("SPRING_SECURITY_CONTEXT".equals(se.getName())) {
			UsuariosActivos.get().getSesionesActivas().remove(se.getSession().getId());
		}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		
	}

}
