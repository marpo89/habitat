package org.habitatnicaragua.micasa.servicio;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.model.UploadedFile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ServicioContenido {
	
	/** Inicio: CmsArchivo **/
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	CmsArchivo buscarCmsArchivoPorId(Long idArchivo);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	Page<CmsArchivo> listarCmsArchivos(CmsNodo nodo,Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	Page<CmsArchivo> listarCmsArchivosPorProyecto(Pageable pagina, Long idProyecto);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	Page<CmsArchivo> listarCmsArchivosBiblioteca(Long idNodo, Pageable pagina, String filtro);

	@PreAuthorize("hasAnyRole('ADMIN')")
	void eliminarCmsArchivo(Long idArchivo) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'ADMIN_TECNICO', 'TECNICO')")
	CmsArchivo guardarCmsArchivo(CmsArchivo cmsArchivo) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'ADMIN_TECNICO', 'TECNICO')")
	CmsArchivo subirCmsArchivo(CmsArchivo cmsArchivo, UploadedFile archivoSubido) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	List<CmsArchivo> listarArchivosPorNodo(CmsNodo cmsNodo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	CmsArchivo buscarArchivoNodo(long idNodo, long idArchivo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	InputStream obtenerInputStreamArchivoLocalNodo(CmsArchivo cmsArchivo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	File obtenerRutaArchivoLocalNodo(CmsArchivo cmsArchivo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	CmsArchivo buscarArchivosTipoEnlacePorRuta(String ruta);
	
	void validarArchivoPeligroso(String nombreArchivo) throws ExcepcionUno;
	
	boolean isArchivoVideo(UploadedFile archivo);
	
	boolean isArchivoImagen(UploadedFile archivo);
	
	void validarRutaArchivoLocal(File rutaArchivo) throws ExcepcionUno;
	/** Fin: CmsArchivo **/
		
	/** Inicio: CmsNodo **/	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	CmsNodo buscarCmsNodoPorId(Long idNodo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	CmsNodo buscarNodoDeSistema(String enlace);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	Page<CmsNodo> listarCmsNodos(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	Page<CmsNodo> listarCmsNodosBiblioteca(Pageable pagina, String filtro);
		
	@PreAuthorize("hasAnyRole('ADMIN')")
	void eliminarCmsNodo(Long idNodo) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	CmsNodo guardarCmsNodo(CmsNodo cmsNodo) throws ExcepcionUno;

	/** Fin: CmsNodo **/
	
	/** Inicio: avatar **/
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	String getRutaAvatar(PerUsuario perUsuario, HttpServletRequest request);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	String subirArchivoAvatar(PerUsuario perUsuario, String nombreArchivo, InputStream archivoAvatar);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	InputStream obtenerArchivoLocalAvatar(PerUsuario perUsuario);
	/** Fin: avatar **/
}
