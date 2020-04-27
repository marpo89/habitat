package org.habitatnicaragua.micasa.servicio;

import java.io.File;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 * http://www.baeldung.com/spring-email
 * https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/htmlsingle/#mail
 * @author Denis
 *
 */
@Service
public class ServicioCorreo  {
	private final static Logger LOGGER = LoggerFactory.getLogger(ServicioCorreo.class);
	
    @Inject
    private JavaMailSender emailSender;
 
    public void enviarEmail(SimpleMailMessage mensaje) {
    	emailSender.send(mensaje);
    }
    
    public void enviarEmail(MimeMessageHelper mensaje) {
    	emailSender.send(mensaje.getMimeMessage());
    }
    
    public SimpleMailMessage prepararMensajeTexto(String from, String replyTo, String to, String subject, String text) {
        SimpleMailMessage mensaje = new SimpleMailMessage(); 
        mensaje.setReplyTo(replyTo);
        mensaje.setFrom(from);
        mensaje.setTo(to);
        mensaje.setSubject(subject); 
        mensaje.setText(text);
   
        return mensaje;
    }
    
    public SimpleMailMessage prepararMensajeTexto(String from, String replyTo, String[] to, String subject, String text) {
        SimpleMailMessage mensaje = new SimpleMailMessage(); 
        mensaje.setReplyTo(replyTo);
        mensaje.setFrom(from);    		
        mensaje.setSubject(subject); 
        mensaje.setText(text);
        
        try {
			mensaje.setTo(to);
		} catch(Exception e) {
			LOGGER.info("Direccion invalida: " + to, e);
			return null;
		}
   
        return mensaje;
    }
    
    public MimeMessageHelper prepararMensajeHtml(String from, String replyTo, String to, String subject, String text) throws MessagingException {
        MimeMessage mail = emailSender.createMimeMessage();
        
        MimeMessageHelper mensaje = new MimeMessageHelper(mail, true);
        mensaje.setTo(to);
        mensaje.setReplyTo(replyTo);
        mensaje.setFrom(from);
        mensaje.setSubject(subject);

        mensaje.setText(text, true);
        
        return mensaje;
    }
    
    public void agregarRecursoInline(MimeMessageHelper mensaje, String nombre, File archivo) throws MessagingException {
        mensaje.addInline(nombre, archivo);
    }
    
    public MimeMessageHelper prepararMensajeHtml(String from, String replyTo, String to, String[] bcc, String asunto, String text) throws MessagingException {
        MimeMessage mail = emailSender.createMimeMessage();
        
        MimeMessageHelper mensaje = new MimeMessageHelper(mail, true);
        
        if(to!=null) mensaje.setTo(to);
        if(bcc!=null && bcc.length>0) {
        	for(String dir:bcc) {
        		try {
        			mensaje.addBcc(dir);
        		} catch(Exception e) {
        			LOGGER.info("Direccion invalida: " + dir, e);
        		}
        	}
        	
        }
        mensaje.setReplyTo(replyTo);
        mensaje.setFrom(from);
        mensaje.setSubject(asunto);

        mensaje.setText(text, true);

        return mensaje;
    }
}