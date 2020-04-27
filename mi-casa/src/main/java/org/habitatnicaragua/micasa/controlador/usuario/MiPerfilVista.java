package org.habitatnicaragua.micasa.controlador.usuario;

import java.io.IOException;
import java.sql.Date;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.Getter;
import lombok.Setter;

@Named("miPerfilVista")
@ViewScoped
@Getter
@Setter
public class MiPerfilVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioComun servicioComun;
	
	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	private PerUsuario perUsuario = null;
	private String clave = "";
	private String clave2 = "";
	
	
	@PostConstruct
	public void init() {
		clave = clave2 = "";
		perUsuario = getUsuarioActual();
	}
	
	public void subirArchivoAvatar(FileUploadEvent event) {
		UploadedFile archivoAvatar = event.getFile();
		
		if(archivoAvatar==null) return;
		
		try {
			String nombreArchivoLocal = servicioContenido.subirArchivoAvatar(perUsuario, archivoAvatar.getFileName(), archivoAvatar.getInputstream());
			
			perUsuario.setAvatar(nombreArchivoLocal);
			
			perUsuario = servicioSeguridad.guardarPerUsuario(perUsuario);
			
			mostrarAdvertencia("Perfil actualizado con éxitossss.");
			
		} catch (IOException e) {
			throw new ExcepcionUno(e);
		}
	}
	
	public void actualizarRegistro() {
		
		java.util.Date fechaActual = new java.util.Date();
		
		System.out.println("Este es el user "+ perUsuario);
		
		/*if (perUsuario == null) {
			System.out.println("Este es el user "+ perUsuario);
			//throw ExcepcionUno.objetoNull();
		}*/
		
		if(!StringUtils.isBlank(clave) || !StringUtils.isBlank(clave2)) {
			if(!StringUtils.equals(clave, clave2)) {
				throw new ExcepcionUno("Las contraseñas no coinciden.");
			}
			
			BCryptPasswordEncoder crypt = new BCryptPasswordEncoder();
			perUsuario.setClave(crypt.encode(clave));
		}
		
		if (perUsuario.getFechaNac()!=null)
		{
			if((fechaActual.getYear()-perUsuario.getFechaNac().getYear())<18)
			{
				throw new ExcepcionUno("Estimado usuario, para actualizar sus datos debe de ser mayor de 18 años");
			}
		}
		
		perUsuario = servicioSeguridad.guardarPerUsuario(perUsuario);
		
		mostrarAdvertencia("Perfil actualizado con éxito.");
	}

	public String getRutaAvatar() {
		return servicioContenido.getRutaAvatar(perUsuario, getHttpServletRequest());
	}
	
	public String getLabelNombreUsuario() {
		if (perUsuario == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(perUsuario.isNivel2()) {
			return "Razón social";
		}
		
		return "Nombre completo";
	}
	
}
