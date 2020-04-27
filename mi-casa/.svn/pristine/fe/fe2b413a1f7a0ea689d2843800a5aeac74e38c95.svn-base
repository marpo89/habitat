package org.habitatnicaragua.micasa.servicio;

import java.io.InputStream;

import org.habitatnicaragua.micasa.modelo.CmsContenidoNivel2;
import org.habitatnicaragua.micasa.modelo.dto.CmsContenidoNivel2DTO;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.model.UploadedFile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ServicioContenidoNivel2 {

	/** Inicio: CmsContenidoNivel2 **/
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	CmsContenidoNivel2 buscarCmsContenidoNivel2PorId(Long idContenido);

	@PreAuthorize("hasAnyRole('ADMIN', 'FINANCIAMIENTO', 'MATERIAL')")
	void eliminarCmsContenidoNivel2(Long idContenido) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'FINANCIAMIENTO', 'MATERIAL')")
	CmsContenidoNivel2 guardarCmsContenidoNivel2(CmsContenidoNivel2 cmsContenidoNivel2, UploadedFile archivo) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	InputStream obtenerInputStreamArchivoLocalContenidoNiel2(CmsContenidoNivel2 cmsContenidoNivel2);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'FINANCIAMIENTO', 'MATERIAL')")
	CmsContenidoNivel2 removerArchivoCmsContenidoNivel2(CmsContenidoNivel2 cmsContenidoNivel2, boolean removerArchivo);	
	
	boolean isContenidoNivel2Editable(CmsContenidoNivel2 cmsContenidoNivel2);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	Page<CmsContenidoNivel2DTO> listarContenidoMuroPorUsuario(String idUsuario, Pageable pagina);

	/** Fin: CmsContenidoNivel2 **/
}
