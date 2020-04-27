package org.habitatnicaragua.micasa.servicio;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.inject.Inject;

import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class ServicioNotificacion {

	private final static Logger LOGGER = LoggerFactory.getLogger(ServicioNotificacion.class);
	
	@Inject
	private ServicioCorreo servicioCorreo;
	
	@Inject
	private ServicioComun servicioComun;
	
	
	public void notificar(String asunto, String mensaje, PerUsuario... perUsuarios) {
		if (perUsuarios==null || perUsuarios.length<=0) {
			return;
		}
		Set<String> direcciones = new HashSet<String>();
		
		for (PerUsuario u:perUsuarios ) {
			if(servicioComun.isEmailValido(u.getCorreo())) {
				direcciones.add(u.getCorreo());
			}
		}
		
		SimpleMailMessage smm = servicioCorreo.prepararMensajeTexto(
				servicioComun.getValorParametro("CORREO_NOTIFICACION_FROM", "no.contestar@habitatnicaragua.org") , 
				null, direcciones.toArray(new String[0]), asunto, mensaje);
		
		if (smm!=null) {
			try {
				servicioCorreo.enviarEmail(smm);
			} catch(Exception e) {
				LOGGER.error("Correo no enviado.", e);
			}
		}
	}
	
	public void notificar(String asunto, String mensaje, Collection<PerUsuario> perUsuarios) {
		if(perUsuarios==null || perUsuarios.isEmpty()) return;
		
		notificar(asunto, mensaje, perUsuarios.toArray(new PerUsuario[0]));
	}
}
