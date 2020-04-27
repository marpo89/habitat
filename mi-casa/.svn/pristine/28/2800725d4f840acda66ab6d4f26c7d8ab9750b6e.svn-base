package org.habitatnicaragua.micasa.controlador.usuario;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsContenidoNivel2;
import org.habitatnicaragua.micasa.modelo.OftOferta;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.PubPublicidad;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.servicio.ServicioContenidoNivel2;
import org.habitatnicaragua.micasa.servicio.ServicioOferta;
import org.habitatnicaragua.micasa.servicio.ServicioProyecto;
import org.habitatnicaragua.micasa.servicio.ServicioPublicidad;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.MimeTypes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("archivoControlador")
@RequestMapping("/archivos")
public class ArchivoControlador extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@Inject
	private ServicioProyecto servicioProyecto;
	
	@Inject
	private ServicioOferta servicioOferta;
	
	@Inject
	private ServicioPublicidad servicioPublicidad;
	
	@Inject
	private ServicioContenidoNivel2 servicioContenidoNivel2;
	
	// @PathVariable with RegEx
	// sin la expresion regular la extension no es capturada
	@RequestMapping(value="/avatar/{avatar:.+}", method=RequestMethod.GET)
	public void getAvatar(HttpServletResponse response, @PathVariable("avatar") String avatar) throws IOException {
		
		String uuidUsuario = FilenameUtils.getBaseName(avatar);
		PerUsuario perUsuario = servicioSeguridad.buscarPerUsuarioActivoPorUuid(uuidUsuario);
		
		InputStream flujoIs = servicioContenido.obtenerArchivoLocalAvatar(perUsuario);
		
		if(flujoIs!=null) {
			String extension = FilenameUtils.getExtension(avatar);
			
			response.setContentType(MimeTypes.getMimeType(extension));
			
			IOUtils.copy(flujoIs, response.getOutputStream());
		}
	}

	@RequestMapping(value="/proyecto/{idProyecto}/{idArchivo}/{titulo}", method=RequestMethod.GET)
	public void getArchivoProyecto(HttpServletResponse response, @PathVariable("idProyecto") Long idProyecto, 
			@PathVariable("idArchivo") Long idArchivo, @PathVariable("titulo") String titulo) throws IOException {
		
		CmsArchivo archivo = servicioProyecto.buscarArchivoProyecto(idProyecto, idArchivo);
		
		if(archivo!=null) {
			InputStream flujoIs = servicioProyecto.obtenerInputStreamArchivoLocalProyecto(archivo);
			
			if(flujoIs!=null) {
				String extension = FilenameUtils.getExtension(archivo.getRuta());
				
				response.setContentType(MimeTypes.getMimeType(extension));
				
				response.addHeader("Content-Disposition", "inline; filename=\"" + archivo.getTitulo()  + "\"");
				
				IOUtils.copy(flujoIs, response.getOutputStream());
			}
		}
		
	}
	
	@RequestMapping(value="/nodo/{idNodo}/{idArchivo}/{titulo}", method=RequestMethod.GET)
	public void getArchivoNodo(HttpServletResponse response, @PathVariable("idNodo") Long idNodo, 
			@PathVariable("idArchivo") Long idArchivo, @PathVariable("titulo") String titulo) throws IOException {
		
		CmsArchivo archivo = servicioContenido.buscarArchivoNodo(idNodo, idArchivo);
		
		if(archivo!=null) {
			InputStream flujoIs = servicioContenido.obtenerInputStreamArchivoLocalNodo(archivo);
			
			if(flujoIs!=null) {
				String extension = FilenameUtils.getExtension(archivo.getRuta());
				
				response.setContentType(MimeTypes.getMimeType(extension));
				
				response.addHeader("Content-Disposition", "inline; filename=\"" + archivo.getTitulo() + "." + extension + "\"");

				IOUtils.copy(flujoIs, response.getOutputStream());
			}
		}
	}
	
	@RequestMapping(value="/ofertas/{idOferta}/{nombreArchivo:.+}", method=RequestMethod.GET)
	public void getArchivoOferta(HttpServletResponse response, @PathVariable("idOferta") Long idOferta, 
			@PathVariable("nombreArchivo") String nombreArchivo) throws IOException {
		
		OftOferta oftOferta = servicioOferta.buscarOftOfertaPorId(idOferta);
		
		if(oftOferta!=null) {
			String archivoOferta = "";
			int numero = 0;
			
			if(!StringUtils.isBlank(oftOferta.getArchivo1()) && oftOferta.getArchivo1().endsWith(nombreArchivo)) {
				archivoOferta = oftOferta.getArchivo1();
				numero = 1;
			} else if(!StringUtils.isBlank(oftOferta.getArchivo2()) && oftOferta.getArchivo2().endsWith(nombreArchivo)) {
				archivoOferta = oftOferta.getArchivo2();
				numero = 2;
			} else if(!StringUtils.isBlank(oftOferta.getArchivo3()) && oftOferta.getArchivo3().endsWith(nombreArchivo)) {
				archivoOferta = oftOferta.getArchivo3();
				numero = 3;
			}
			
			if(!StringUtils.isBlank(archivoOferta)) {
				
				InputStream flujoIs = servicioOferta.obtenerInputStreamArchivoLocalOferta(oftOferta, numero);
				
				if(flujoIs!=null) {
					String extension = FilenameUtils.getExtension(archivoOferta);
					
					response.setContentType(MimeTypes.getMimeType(extension));
					
					response.addHeader("Content-Disposition", "inline; filename=\"" + nombreArchivo + "\"");
							
					long cacheAge = 2 * 24 * 60 * 60; // 2 dias
					long expiry = new Date().getTime() + cacheAge*1000;
					response.setDateHeader("Expires", expiry);
				    response.setHeader("Cache-Control", "max-age="+ cacheAge);

				    IOUtils.copy(flujoIs, response.getOutputStream());
				}
			}
		}
	}
	
	@RequestMapping(value="/d4d1c1l8up/{idPublicidad}/{nombreArchivo:.+}", method=RequestMethod.GET)
	public void getArchivoPublicidad(HttpServletResponse response, @PathVariable("idPublicidad") Long idPublicidad, 
			@PathVariable("nombreArchivo") String nombreArchivo) throws IOException {
		
		PubPublicidad pubPublicidad = servicioPublicidad.buscarPubPublicidadPorId(idPublicidad);
		
		if(pubPublicidad!=null) {
			String archivoPublicidad = "";
			int numero = 0;
			
			if(!StringUtils.isBlank(pubPublicidad.getArchivo1()) && pubPublicidad.getArchivo1().endsWith(nombreArchivo)) {
				archivoPublicidad = pubPublicidad.getArchivo1();
				numero = 1;
			} else if(!StringUtils.isBlank(pubPublicidad.getArchivo2()) && pubPublicidad.getArchivo2().endsWith(nombreArchivo)) {
				archivoPublicidad = pubPublicidad.getArchivo2();
				numero = 2;
			} else if(!StringUtils.isBlank(pubPublicidad.getArchivo3()) && pubPublicidad.getArchivo3().endsWith(nombreArchivo)) {
				archivoPublicidad = pubPublicidad.getArchivo3();
				numero = 3;
			}
			
			if(!StringUtils.isBlank(archivoPublicidad)) {
				
				InputStream flujoIs = servicioPublicidad.obtenerInputStreamArchivoLocalPublicidad(pubPublicidad, numero);
				
				if(flujoIs!=null) {
					String extension = FilenameUtils.getExtension(archivoPublicidad);
					
					response.setContentType(MimeTypes.getMimeType(extension));
					
					response.addHeader("Content-Disposition", "inline; filename=\"" + nombreArchivo + "\"");
							
					long cacheAge = 60 * 60; // 1 hora
					long expiry = new Date().getTime() + cacheAge*1000;
					response.setDateHeader("Expires", expiry);
				    response.setHeader("Cache-Control", "max-age="+ cacheAge);

				    IOUtils.copy(flujoIs, response.getOutputStream());
				}
			}
		}
	}
	
	
	@RequestMapping(value="/contenido2/{idContenido}/{nombreArchivo:.+}", method=RequestMethod.GET)
	public void getArchivoContenidoNivel2(HttpServletResponse response, @PathVariable("idContenido") Long idContenido, 
			@PathVariable("nombreArchivo") String nombreArchivo) throws IOException {
		
		CmsContenidoNivel2 cmsContenidoNivel2 = servicioContenidoNivel2.buscarCmsContenidoNivel2PorId(idContenido);
				
		if(cmsContenidoNivel2!=null) {
			String archivoContenido = "";
			
			if(!StringUtils.isBlank(cmsContenidoNivel2.getArchivo()) && cmsContenidoNivel2.getArchivo().endsWith(nombreArchivo)) {
				archivoContenido = cmsContenidoNivel2.getArchivo();
			}
			
			if(!StringUtils.isBlank(archivoContenido)) {
				InputStream flujoIs = servicioContenidoNivel2.obtenerInputStreamArchivoLocalContenidoNiel2(cmsContenidoNivel2);
				
				if(flujoIs!=null) {
					String extension = FilenameUtils.getExtension(archivoContenido);
					
					response.setContentType(MimeTypes.getMimeType(extension));
					
					response.addHeader("Content-Disposition", "inline; filename=\"" + nombreArchivo + "\"");
							
					long cacheAge = 3 * 60 * 60; // 3 horas
					long expiry = new Date().getTime() + cacheAge*1000;
					response.setDateHeader("Expires", expiry);
				    response.setHeader("Cache-Control", "max-age="+ cacheAge);

				    IOUtils.copy(flujoIs, response.getOutputStream());
				}
			}
		}
	}
}
