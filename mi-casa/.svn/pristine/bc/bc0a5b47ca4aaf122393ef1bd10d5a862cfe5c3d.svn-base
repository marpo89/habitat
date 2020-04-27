package org.habitatnicaragua.micasa.servicio;

import java.io.InputStream;

import org.habitatnicaragua.micasa.modelo.PubPublicidad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.model.UploadedFile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ServicioPublicidad {
	
	/** Inicio: PubPublicidad **/	
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	PubPublicidad buscarPubPublicidadPorId(Long idPublicidad);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	Page<PubPublicidad> listarPubPublicidad(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	void eliminarPubPublicidad(Long idPublicidad) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	PubPublicidad guardarPubPublicidad(PubPublicidad pubPublicidad, UploadedFile archivo1, UploadedFile archivo2, UploadedFile archivo3) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	public InputStream obtenerInputStreamArchivoLocalPublicidad(PubPublicidad pubPublicidad, int numero);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	PubPublicidad removerArchivosPubPublicidad(PubPublicidad pubPublicidad, boolean removerArchivo1, boolean removerArchivo2, boolean removerArchivo3);

	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	PubPublicidad buscarSiguientePublicidad(String ubicacion);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	void contarClick(PubPublicidad pubPublicidad);
	
	/** Fin: PubPublicidad **/
}
