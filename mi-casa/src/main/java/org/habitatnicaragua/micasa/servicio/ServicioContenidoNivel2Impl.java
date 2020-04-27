package org.habitatnicaragua.micasa.servicio;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.inject.Inject;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.dao.CmsContenidoNivel2Dao;
import org.habitatnicaragua.micasa.modelo.CmsContenidoNivel2;
import org.habitatnicaragua.micasa.modelo.CmsContenidoNivel2_;
import org.habitatnicaragua.micasa.modelo.PerUsuario_;
import org.habitatnicaragua.micasa.modelo.dto.CmsContenidoNivel2DTO;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.primefaces.model.UploadedFile;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServicioContenidoNivel2Impl implements ServicioContenidoNivel2 {
	
	@Inject
	private ServicioPerfil servicioPerfil;

	@Inject
	private ServicioContenido servicioContenido;
	
	@Inject
	private ServicioComun servicioComun;
	
	@Inject
	private CmsContenidoNivel2Dao cmsContenidoNivel2Dao;
	
	/** Inicio: CmsContenidoNivel2 **/	
	
	@Override
	public CmsContenidoNivel2 buscarCmsContenidoNivel2PorId(Long idContenido) {
		CmsContenidoNivel2 cmsContenidoNivel2 = cmsContenidoNivel2Dao.findOne(idContenido);
		
		if(cmsContenidoNivel2==null) {
			throw ExcepcionUno.parametroInvalido();
		}
				
		return cmsContenidoNivel2;
	}
	
	@Override
	public void eliminarCmsContenidoNivel2(Long idContenido) throws ExcepcionUno {
		if(idContenido==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		CmsContenidoNivel2 cmsContenidoNivel2 = cmsContenidoNivel2Dao.findOne(idContenido);
		if(cmsContenidoNivel2==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(!isContenidoNivel2Editable(cmsContenidoNivel2)) {
			throw ExcepcionUno.permisoDenegado();
		}
		
		removerArchivoCmsContenidoNivel2(cmsContenidoNivel2, true);
		
		try {
			cmsContenidoNivel2Dao.delete(cmsContenidoNivel2);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
	}
	
	@Override
	public CmsContenidoNivel2 guardarCmsContenidoNivel2(CmsContenidoNivel2 cmsContenidoNivel2, UploadedFile archivo) throws ExcepcionUno {
		if(cmsContenidoNivel2==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(!isContenidoNivel2Editable(cmsContenidoNivel2)) {
			throw ExcepcionUno.permisoDenegado();
		}
		
		if(StringUtils.isBlank(cmsContenidoNivel2.getTitulo())) {
			throw ExcepcionUno.campoRequerido("Título");
		}
		
		/*
		if(StringUtils.isBlank(cmsContenidoNivel2.getContenido())) {
			throw ExcepcionUno.campoRequerido("Contenido");
		}
		*/
		
		if(!StringUtils.isBlank(cmsContenidoNivel2.getContenido())) {
			cmsContenidoNivel2.setContenido(Jsoup.clean(cmsContenidoNivel2.getContenido(), Whitelist.relaxed()));
		}
		
		
		if(cmsContenidoNivel2.getDuenio()==null) {
			cmsContenidoNivel2.setDuenio(servicioPerfil.getUsuarioActual());
		}
				
		if(cmsContenidoNivel2.getIdContenido()==null) {
			try {
				cmsContenidoNivel2 = cmsContenidoNivel2Dao.save(cmsContenidoNivel2);
			} catch (Throwable t){
				throw new ExcepcionUno(t);
			}
		}
		
		subirArchivoAdjuntoCmsContenidoNivel2(cmsContenidoNivel2, archivo);
		
		try {
			cmsContenidoNivel2 = cmsContenidoNivel2Dao.save(cmsContenidoNivel2);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
		
		return cmsContenidoNivel2;
	}
	
	@Override
	public InputStream obtenerInputStreamArchivoLocalContenidoNiel2(CmsContenidoNivel2 cmsContenidoNivel2) {
		if(cmsContenidoNivel2==null) return null;
		
		String rutaArchivo = cmsContenidoNivel2.getArchivo();
		
		if(StringUtils.isBlank(rutaArchivo)) {
			return null;
		}
		
		String rutaLocalArchivo = servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + rutaArchivo;
		
		File archivo = new File(rutaLocalArchivo);
		
		servicioContenido.validarRutaArchivoLocal(archivo);
		
		if(!archivo.exists()) return null;
		
		if(archivo.isDirectory()) return null;
		
		try {
			return FileUtils.openInputStream(archivo);
		} catch (IOException e) {
			throw new ExcepcionUno(e);
		}
	}
	
	@Override
	public CmsContenidoNivel2 removerArchivoCmsContenidoNivel2(CmsContenidoNivel2 cmsContenidoNivel2, boolean removerArchivo) {
		if(cmsContenidoNivel2==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(!isContenidoNivel2Editable(cmsContenidoNivel2)) {
			throw ExcepcionUno.permisoDenegado();
		}
		
		if(removerArchivo && !StringUtils.isBlank(cmsContenidoNivel2.getArchivo())) {
			removerArchivoCmsContenidoNivel2(cmsContenidoNivel2.getArchivo());
			cmsContenidoNivel2.setArchivo(null);
		}
				
		try {
			cmsContenidoNivel2 = cmsContenidoNivel2Dao.save(cmsContenidoNivel2);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
		
		return cmsContenidoNivel2;
	}
	
	private void removerArchivoCmsContenidoNivel2(String rutaArchivo) {
		
		String rutaLocalArchivo = servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + rutaArchivo;
		
		File archivo = new File(rutaLocalArchivo);
		
		servicioContenido.validarRutaArchivoLocal(archivo);
		
		if(archivo.exists() && archivo.isFile() && archivo.canWrite()) {
			archivo.delete();
		}
	}

	@Override
	public boolean isContenidoNivel2Editable(CmsContenidoNivel2 cmsContenidoNivel2) {
		if(cmsContenidoNivel2==null) return false;
		
		if(cmsContenidoNivel2.getIdContenido()==null) return true;
		
		if(servicioPerfil.getUsuarioActual()==null) return false;
		
		if(servicioPerfil.getUsuarioActual().isAdmin()) return true;
		
		if(cmsContenidoNivel2.getDuenio()!=null && cmsContenidoNivel2.getDuenio().getIdUsuario().equals(servicioPerfil.getUsuarioActual().getIdUsuario())) {
			return true;
		}
		
		return false;	
	}
	
	private void subirArchivoAdjuntoCmsContenidoNivel2(CmsContenidoNivel2 cmsContenidoNivel2, UploadedFile archivo) throws ExcepcionUno {
		if(archivo==null || archivo.getSize()<=0) {
			return;
		}
		
		servicioContenido.validarArchivoPeligroso(archivo.getFileName());
		
		try {
			String extension = FilenameUtils.getExtension(archivo.getFileName());
			
			String rutaArchivoExistente = cmsContenidoNivel2.getArchivo();
			
			String directorio = servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + File.separator + "contenido2" + File.separator;
			FileUtils.forceMkdir(new File(directorio));
			
			String nuevoNombre = null;
			
			if(StringUtils.isBlank(rutaArchivoExistente)) {
				nuevoNombre = UUID.randomUUID().toString() + "." + extension;
			} else {
				nuevoNombre = FilenameUtils.getBaseName(rutaArchivoExistente) + "." + extension;
			}
			
			String rutaLocalRelativaArchivo = cmsContenidoNivel2.getIdContenido() + File.separator + nuevoNombre;
			File archivoDisco = new File(directorio + rutaLocalRelativaArchivo);
			
			servicioContenido.validarRutaArchivoLocal(archivoDisco);
			FileUtils.copyInputStreamToFile(archivo.getInputstream(), archivoDisco);
			
			String ruta = File.separator + "contenido2" + File.separator + rutaLocalRelativaArchivo;
			
			cmsContenidoNivel2.setArchivo(ruta);
		} catch (Exception e) {
			throw new ExcepcionUno(e);
		}
	}
	
	@Override
	public Page<CmsContenidoNivel2DTO> listarContenidoMuroPorUsuario(String idUsuario, Pageable pagina) {
		Page<CmsContenidoNivel2> resultado = null;
		
		if(StringUtils.isBlank(idUsuario)) return null;
		
		Specification<CmsContenidoNivel2> filtroBase = new Specification<CmsContenidoNivel2>(){
			@Override
			public Predicate toPredicate(Root<CmsContenidoNivel2> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(CmsContenidoNivel2_.duenio).get(PerUsuario_.idUsuario) , idUsuario);
			}
		};

		resultado = cmsContenidoNivel2Dao.findAll(Specifications.where(filtroBase), pagina);
		
		return resultado.map(new Converter<CmsContenidoNivel2, CmsContenidoNivel2DTO>() {

			@Override
			public CmsContenidoNivel2DTO convert(CmsContenidoNivel2 source) {
				CmsContenidoNivel2DTO dto = new CmsContenidoNivel2DTO(source);
				
				dto.setPropio(isContenidoNivel2Editable(source));
				
				return dto;
			}
			
		});
	}
	/** Fin: CmsContenidoNivel2 **/
}
