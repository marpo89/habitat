package org.habitatnicaragua.micasa.controlador.admin;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.modelo.PerDireccion;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.modelo.SegRol;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.Getter;
import lombok.Setter;

@Named("usuariosVista")
@ViewScoped
@Getter
@Setter
public class UsuariosVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	private boolean modoEditarMaestro = true;
	
	private String idPerUsuario = null;
	private Long idPerDireccion = null;
	private PerUsuario segUsuario = null;
	private PerDireccion perDireccion = null;
	
	private String idRolUsuario = null;
	private SegRol rol = null;
	private List<SegRol> roles = null;
	
	private List<CatMaestro> listaLocalidades = null;
	
	private String clave = "";
	private String clave2 = "";
			
	@PostConstruct
	public void init() {
		clave = clave2 = "";
		
		idPerUsuario = getStringRequestParameter("idPerUsuario");
		if(idPerUsuario==null) {
			segUsuario = new PerUsuario();
			modoEditarMaestro = false;
		} else {
			segUsuario = servicioSeguridad.buscarPerUsuarioPorId(idPerUsuario);
			modoEditarMaestro = true;
		}
				
		idPerDireccion = getLongRequestParameter("idPerDireccion");
		if(idPerDireccion==null) {
			perDireccion = new PerDireccion();
		} else {
			perDireccion = servicioSeguridad.buscarPerDireccionPorId(idPerDireccion);
		}
		
		idRolUsuario = getStringRequestParameter("idRolUsuario");
		
	}
	
	public void eliminarRegistro() {
		if (idPerUsuario == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioSeguridad.eliminarUsuario(idPerUsuario);
	}
	
	public void eliminarRegistroSegRolUsuario() {
		if (idRolUsuario == null) {
			throw ExcepcionUno.objetoNull();
		}
		SegRol seleccionado = null;
		
		for(SegRol segRol:segUsuario.getRoles()) {
			if(idRolUsuario.equals(segRol.getRol())){
				seleccionado = segRol;
				break;
			}
		}
		if (seleccionado != null) {
				segUsuario.getRoles().remove(seleccionado);
		}
		 guardarRegistro();
	}
	
	public void eliminarRegistroPerDireccion() {
		if (idPerDireccion == null) {
			throw ExcepcionUno.objetoNull();
		}
		servicioSeguridad.eliminarPerDireccion(idPerDireccion);
	}
	
	public void guardarRegistro() {
		if (segUsuario == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(!StringUtils.isEmpty(clave) || !StringUtils.isEmpty(clave2)) {
			if(!StringUtils.equals(clave, clave2)) {
				throw new ExcepcionUno("Las claves no coinciden.");
			}
			
			BCryptPasswordEncoder crypt = new BCryptPasswordEncoder();
			segUsuario.setClave(crypt.encode(clave));
		}
		
		if(StringUtils.isEmpty(segUsuario.getIdUsuario()) && segUsuario.getRoles().isEmpty()) {
			segUsuario.getRoles().add(servicioSeguridad.buscarRolePorNombre(Rol.USUARIO));
			if(rol!=null) {
				segUsuario.getRoles().add(rol);
			}
		}
		
		segUsuario = servicioSeguridad.guardarPerUsuario(segUsuario);
	}
	
	public void guardarRegistroRolUsuario() {
		if (rol == null) {
			throw ExcepcionUno.objetoNull();
		}

		segUsuario.getRoles().add(rol);
		guardarRegistro();
	}
	
	public void guardarRegistroPerDireccion() {
		if (perDireccion == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		perDireccion.setUsuario(segUsuario);		

		perDireccion = servicioSeguridad.guardarPerDireccion(perDireccion);
	}
	
	public String getTituloPagina() {
		if(!modoEditarMaestro) return "Usuarios";
		
		if(idPerUsuario==null) return "Nuevo Usuario";
		
		return "Editar Usuario";
	}
	
	public String getTituloPaginaPerDireccion() {
		if(!modoEditarMaestro) return "Dirección";
		
		if(idPerUsuario==null) return "Nueva Dirección";
		
		return "Editar Dirección";
	}
	
	public String getEnlaceListado() {
		return getHttpServletRequest().getContextPath() + "/admin/usuarios.xhtml";
	}
	
	public String getEnlaceUsuario() {
		return getHttpServletRequest().getContextPath() + "/admin/usuarioForm.xhtml?idPerUsuario=" + idPerUsuario;
	}	
	
	public String getInfoRegistroActual() {
		if(idPerUsuario!=null) {
			return segUsuario.getCorreo();
		}
		
		return "Nuevo";
	}
	
	public String getInfoDireccionActual() {
		if(idPerDireccion!=null) {
			return perDireccion.getIdentificador().toString();
		}
		
		return "Nueva Dirección";
	}

	public List<SegRol> getRoles(){
		if(roles==null) {
			roles = servicioSeguridad.listarRoles();					
		}		
		return roles;
	}
	
	public List<CatMaestro> getListaLocalidades(){
		if(listaLocalidades==null) {
			listaLocalidades = servicioComun.listarCatalogosPorTipo("ID_LOCALIDAD");
		}
		
		return listaLocalidades;
	}
	
	public String getRutaAvatar() {
		return servicioContenido.getRutaAvatar(segUsuario, getHttpServletRequest());
	}
	
	public void subirArchivoAvatar(FileUploadEvent event) {
		UploadedFile archivoAvatar = event.getFile();
		
		if(archivoAvatar==null) return;
		
		try {
			String nombreArchivoLocal = servicioContenido.subirArchivoAvatar(segUsuario, archivoAvatar.getFileName(), archivoAvatar.getInputstream());
			
			segUsuario.setAvatar(nombreArchivoLocal);
			
			segUsuario = servicioSeguridad.guardarPerUsuario(segUsuario);
			
			mostrarAdvertencia("Perfil actualizado con éxito.");
			
		} catch (IOException e) {
			throw new ExcepcionUno(e);
		}
	}
	
}
