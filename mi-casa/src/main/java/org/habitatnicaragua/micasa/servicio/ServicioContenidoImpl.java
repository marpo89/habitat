package org.habitatnicaragua.micasa.servicio;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.dao.CmsArchivoDao;
import org.habitatnicaragua.micasa.dao.CmsNodoDao;
import org.habitatnicaragua.micasa.modelo.CatMaestro_;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsArchivo_;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.modelo.CmsNodo_;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.modelo.TipoNodo;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.jsoup.Jsoup;
import org.primefaces.model.UploadedFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServicioContenidoImpl implements ServicioContenido {
	
	private final static Logger LOGGER = LoggerFactory.getLogger(ServicioContenidoImpl.class);
	
	@Inject
	private ServicioComun servicioComun;

	@Inject
	private ServicioPerfil servicioPerfil;

	@Inject
	private CmsArchivoDao cmsArchivoDao;
	
	@Inject
	private CmsNodoDao cmsNodoDao;
	
	/** Inicio: CmsArchivo **/
	
	@Override
	public CmsArchivo buscarCmsArchivoPorId(Long id) {
		return cmsArchivoDao.findOne(id);
	}
	
	@Override
	public Page<CmsArchivo> listarCmsArchivos(CmsNodo nodo,Pageable pagina, String filtro) {
		
		Page<CmsArchivo> resultado = null;
		
		resultado = cmsArchivoDao.listadoTodosLosArchivosPorNodo(nodo, pagina);
		
		return resultado;		
	}

	@Override
	public Page<CmsArchivo> listarCmsArchivosPorProyecto(Pageable pagina, Long idProyecto) {
		Page<CmsArchivo> resutlado = null;
		
		if(servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN) || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO) || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.TECNICO)) {
			resutlado = cmsArchivoDao.listarArchivosPorProyecto(idProyecto, pagina);
		}
		
		if(resutlado==null && servicioPerfil.isUsuarioActualMiembroRol(Rol.USUARIO)) {
			resutlado = cmsArchivoDao.listarArchivosPorDuenioProyecto(idProyecto, servicioPerfil.getUsuarioActual(), pagina);
		}
		
		return resutlado;
	}
	
	@Override
	public Page<CmsArchivo> listarCmsArchivosBiblioteca(Long idNodo, Pageable pagina, String filtro) {
		Page<CmsArchivo> resultado = null;
		
		Specification<CmsArchivo> filtroBase = new Specification<CmsArchivo>(){
			@Override
			public Predicate toPredicate(Root<CmsArchivo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new LinkedList<>();
				
				predicates.add(cb.equal(root.get(CmsArchivo_.activo), true));
				predicates.add(cb.equal(root.get(CmsArchivo_.nodo).get(CmsNodo_.idNodo), idNodo));
				
				return cb.and(predicates.toArray(new Predicate[0]));
			}
		};
		
		Specification<CmsArchivo> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = "%" + StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<CmsArchivo>() {
	
				@Override
				public Predicate toPredicate(Root<CmsArchivo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(CmsArchivo_.titulo)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(CmsArchivo_.comentario)), filtroSql));
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}
				
			};
		}
		
		resultado = cmsArchivoDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		
		return resultado;
	}
	
	@Override
	public void eliminarCmsArchivo(Long idArchivo) throws ExcepcionUno {
		if(idArchivo==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		CmsArchivo cmsArchivo  = buscarCmsArchivoPorId(idArchivo);
		
		if(cmsArchivo!=null && (cmsArchivo.isArchivoTipoArchivo() || cmsArchivo.isArchivoTipoVideo())) {
			String rutaLocalArchivo = 
					servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + cmsArchivo.getRuta();
			
			File archivo = new File(rutaLocalArchivo);
			validarRutaArchivoLocal(archivo);
			
			if(archivo.exists() && archivo.isFile() && archivo.canWrite()) {
				archivo.delete();
			}
		}
		
		try {
			cmsArchivoDao.delete(idArchivo);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
    }
	
	@Override
	public CmsArchivo guardarCmsArchivo(CmsArchivo cmsArchivo) throws ExcepcionUno {
		if(cmsArchivo==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(StringUtils.isBlank(cmsArchivo.getTitulo())) {
			throw ExcepcionUno.campoRequerido("título");
		}
		
		cmsArchivo.setTitulo(Jsoup.parse(cmsArchivo.getTitulo()).text());
		
		if(!StringUtils.isBlank(cmsArchivo.getComentario())) {
			cmsArchivo.setComentario(Jsoup.parse(cmsArchivo.getComentario()).text());
		}
		
		if(cmsArchivo.getTipoArchivo()==null) {
			throw ExcepcionUno.campoRequerido("tipo archivo");
		}
		
		if(cmsArchivo.isArchivoTipoYoutube() && StringUtils.isBlank(cmsArchivo.getYoutube())){
			throw ExcepcionUno.campoRequerido("youtube");
		}
		
		if(cmsArchivo.isArchivoTipoEnlace() && StringUtils.isBlank(cmsArchivo.getRuta())){
			throw ExcepcionUno.campoRequerido("ruta");
		}
		
		if(cmsArchivo.getOrden()==null) {
			cmsArchivo.setOrden(0);
		}
		
		try {
			return cmsArchivoDao.save(cmsArchivo);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
	}
	
	@Override
	public CmsArchivo subirCmsArchivo(CmsArchivo cmsArchivo, UploadedFile archivo) throws ExcepcionUno {
		
		if(cmsArchivo.isArchivoTipoYoutube()) {
			cmsArchivo.setRuta("");
		}
		
		if(cmsArchivo.isArchivoTipoArchivo() || cmsArchivo.isArchivoTipoVideo()) {
			
			if(archivo!=null && archivo.getSize()>0) {
				
				validarArchivoPeligroso(archivo.getFileName());
				
				if(cmsArchivo.isArchivoTipoVideo() && !isArchivoVideo(archivo)) {
					throw new ExcepcionUno("El archivo no es válido.");
				}
				
				try {
					String extension = FilenameUtils.getExtension(archivo.getFileName());
					
					String directorio = 
							servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + File.separator + "nodos" + File.separator;
					
					FileUtils.forceMkdir(new File(directorio));
					
					String nuevoNombre = UUID.randomUUID().toString() + "." + extension;
					String rutaLocalRelativaArchivo = cmsArchivo.getNodo().getIdNodo() + File.separator + nuevoNombre;
					
					File archivoDisco = new File(directorio + rutaLocalRelativaArchivo);
					validarRutaArchivoLocal(archivoDisco);
					FileUtils.copyInputStreamToFile(archivo.getInputstream(), archivoDisco);
					
					cmsArchivo.setRuta(File.separator + "nodos" + File.separator + rutaLocalRelativaArchivo);
					
				} catch (Exception e) {
					throw new ExcepcionUno(e);
				}
			} else if(cmsArchivo.getIdArchivo()==null) {
				throw ExcepcionUno.campoRequerido("archivo");
			}

		}
		
		cmsArchivo = guardarCmsArchivo(cmsArchivo);
		
		if(!StringUtils.isBlank(cmsArchivo.getRutaOriginal()) && 
				!StringUtils.trimToEmpty(cmsArchivo.getRutaOriginal()).equals(cmsArchivo.getRuta())) {
			
			String rutaLocalArchivoAnterior = 
					servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + cmsArchivo.getRutaOriginal();
			File archivoAnterior = new File(rutaLocalArchivoAnterior);
			try {
				validarRutaArchivoLocal(archivoAnterior);
				
				if(archivoAnterior.exists() && archivoAnterior.isFile() && archivoAnterior.canWrite()) {
					archivoAnterior.delete();
				}
			} catch(Exception e) {
				LOGGER.error("", e);
			}
		}
		
		return cmsArchivo;
	}
	
	@Override
	public List<CmsArchivo> listarArchivosPorNodo(CmsNodo cmsNodo) {
		return cmsArchivoDao.listarArchivosPorNodo(cmsNodo);
	}
	
	@Override
	public CmsArchivo buscarArchivoNodo(long idNodo, long idArchivo) {
		CmsArchivo archivo = buscarCmsArchivoPorId(idArchivo);
		
		if(archivo==null) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		if(archivo.getNodo()==null || idNodo!=archivo.getNodo().getIdNodo()) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		if(!servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN)) {
			
			if(!Boolean.TRUE.equals(archivo.getActivo()) || !Boolean.TRUE.equals(archivo.getNodo().getActivo())) {
				throw ExcepcionUno.permisoDenegado();
			}			
		}
		
		return archivo;
	}
	
	@Override
	public InputStream obtenerInputStreamArchivoLocalNodo(CmsArchivo cmsArchivo) {
		try {
			File archivoLocalValidado = obtenerRutaArchivoLocalNodo(cmsArchivo);
			if(archivoLocalValidado==null) {
				return null;
			}
			
			return FileUtils.openInputStream(archivoLocalValidado);
		} catch (IOException e) {
			throw new ExcepcionUno(e);
		}
	}
	
	@Override
	public File obtenerRutaArchivoLocalNodo(CmsArchivo cmsArchivo) {
		if(cmsArchivo==null || StringUtils.isBlank(cmsArchivo.getRuta())) return null;
		
		String rutaLocalArchivo = 
				servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + cmsArchivo.getRuta();
		
		File archivo = new File(rutaLocalArchivo);
		
		validarRutaArchivoLocal(archivo);
		
		if(!archivo.exists()) return null;
		
		if(archivo.isDirectory()) return null;
		
		return archivo;
	}
	
	@Override
	public CmsArchivo buscarArchivosTipoEnlacePorRuta(String ruta) {
		List<CmsArchivo> archivos = cmsArchivoDao.buscarArchivosTipoEnlacePorRuta(ruta);
		
		if(archivos!=null && archivos.size()>0) return archivos.get(0);
		
		return null;
	}
	
	@Override
	public void validarArchivoPeligroso(String nombreArchivo) throws ExcepcionUno {
		String extension = FilenameUtils.getExtension(nombreArchivo);
		
		extension = StringUtils.trimToEmpty(extension);
		
		if(StringUtils.isBlank(extension) || extension.length()>=5 || 
				"com".equalsIgnoreCase(extension) || "exe".equalsIgnoreCase(extension) || 
				"src".equalsIgnoreCase(extension) || "class".equalsIgnoreCase(extension) ||
				"bin".equalsIgnoreCase(extension) || "dem".equalsIgnoreCase(extension)) {
			throw ExcepcionUno.contenidoInseguro();
		}
	}
	
	@Override
	public boolean isArchivoVideo(UploadedFile archivo) {

		String nombreArchivo = archivo.getFileName();
		
		String extension = FilenameUtils.getExtension(nombreArchivo);
		
		extension = StringUtils.trimToEmpty(extension);
		
		if(StringUtils.isBlank(extension)) return false;
		
		if(!"mpeg4".equalsIgnoreCase(extension) && !"mp4".equalsIgnoreCase(extension) 
				&& !"avi".equalsIgnoreCase(extension) && !"mov".equalsIgnoreCase(extension) 
				&& !"ogg".equalsIgnoreCase(extension)) {
			return false;
		}
		
		String contentType = archivo.getContentType();
		
		if(!"video/mp4".equalsIgnoreCase(contentType) && !"video/x-msvideo".equalsIgnoreCase(contentType) 
				&& !"video/ogg".equalsIgnoreCase(contentType) && !"video/quicktime".equalsIgnoreCase(contentType)) {
			return false;
		}
		
		return true;
	}

	@Override
	public boolean isArchivoImagen(UploadedFile archivo) {

		String nombreArchivo = archivo.getFileName();
		
		String extension = FilenameUtils.getExtension(nombreArchivo);
		
		extension = StringUtils.trimToEmpty(extension);
		
		if(StringUtils.isBlank(extension)) return false;
		
		if(!"jpg".equalsIgnoreCase(extension) && !"gif".equalsIgnoreCase(extension) 
				&& !"png".equalsIgnoreCase(extension) && !"jpeg".equalsIgnoreCase(extension)) {
			return false;
		}
		
		String contentType = archivo.getContentType();
		
		if(!"image/png".equalsIgnoreCase(contentType) && !"image/gif".equalsIgnoreCase(contentType) 
				&& !"image/jpeg".equalsIgnoreCase(contentType)) {
			return false;
		}
		
		return true;
	}
	
	@Override
	public void validarRutaArchivoLocal(File rutaArchivo) throws ExcepcionUno {
		
	    if (!rutaArchivo.isAbsolute()) {
	        throw new ExcepcionUno("La ruta del archivo debe ser absoluta.");
	    }

	    String pathUsingCanonical;
	    String pathUsingAbsolute;
	    try {
	        pathUsingCanonical = rutaArchivo.getCanonicalPath();
	        pathUsingAbsolute = rutaArchivo.getAbsolutePath();
	    } catch (IOException e) {
	        throw new ExcepcionUno("Error de validación de seguridad de archivos.", e);
	    }

	    // Require the absolute path and canonicalized path match.
	    // This is done to avoid directory traversal 
	    // attacks, e.g. "1/../2/" 
	    if (! pathUsingCanonical.equals(pathUsingAbsolute)) {
	        throw new ExcepcionUno("No pasa validación de seguridad de archivos.");
	    }
	    
	    String rutaLocalArchivos = servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS");
	    if(!pathUsingCanonical.startsWith(rutaLocalArchivos)) {
	    	throw new ExcepcionUno("Ruta de archivo no válida.");
	    }
	}
	
	/** Fin: CmsArchivo **/	
	
	/** Inicio: CmsNodo **/
		
	@Override
	public CmsNodo buscarCmsNodoPorId(Long id) {
		CmsNodo cmsNodo = cmsNodoDao.findOne(id);
		
		if(cmsNodo!=null && cmsNodo.getActivo()==Boolean.TRUE) {
			return cmsNodo;
		}
		
		return null;
	}
	
	@Override
	public CmsNodo buscarNodoDeSistema(String enlace) {
		return cmsNodoDao.buscarNodoDeSistema(enlace);
	}
	
	@Override
	public Page<CmsNodo> listarCmsNodos(Pageable pagina, String filtro) {
		Page<CmsNodo> resultado = null;
		
		Specification<CmsNodo> filtroBase = new Specification<CmsNodo>(){
			@Override
			public Predicate toPredicate(Root<CmsNodo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(CmsNodo_.activo), true);
			}
		};
		
		Specification<CmsNodo> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<CmsNodo>() {
	
				@Override
				public Predicate toPredicate(Root<CmsNodo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(CmsNodo_.titulo)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(CmsNodo_.tipoNodo).get(CatMaestro_.nombre)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(CmsNodo_.tipoNodo).get(CatMaestro_.tipoCatalogo)), filtroSql));

					return cb.or(predicates.toArray(new Predicate[0]));
				}
				
			};
		}
		
		resultado = cmsNodoDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		
		return resultado;
	}
	
	@Override
	public Page<CmsNodo> listarCmsNodosBiblioteca(Pageable pagina, String filtro) {
		Page<CmsNodo> resultado = null;
		
		Specification<CmsNodo> filtroBase = new Specification<CmsNodo>(){
			@Override
			public Predicate toPredicate(Root<CmsNodo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new LinkedList<>();
				
				predicates.add(cb.equal(root.get(CmsNodo_.activo), true));
				predicates.add(cb.equal(root.get(CmsNodo_.tipoNodo).get(CatMaestro_.nombre), TipoNodo.FOLDER_BIBLIOTECA.name()));
				
				return cb.and(predicates.toArray(new Predicate[0]));
			}
		};
		
		Specification<CmsNodo> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = "%" + StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<CmsNodo>() {
	
				@Override
				public Predicate toPredicate(Root<CmsNodo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(CmsNodo_.titulo)), filtroSql));

					return cb.or(predicates.toArray(new Predicate[0]));
				}
				
			};
		}
		
		resultado = cmsNodoDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		
		return resultado;
	}	
	
	@Override
	public void eliminarCmsNodo(Long idNodo) throws ExcepcionUno {
		if(idNodo==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		CmsNodo cmsNodo = buscarCmsNodoPorId(idNodo);
		if(cmsNodo==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		cmsNodo.setActivo(false);
		
		try {
			cmsNodoDao.save(cmsNodo);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
    }
		
	@Override
	public CmsNodo guardarCmsNodo(CmsNodo cmsNodo) throws ExcepcionUno {
		if(cmsNodo==null) {
			throw ExcepcionUno.objetoNull();
		}

		if(cmsNodo.getTitulo()!=null) {
			cmsNodo.setTitulo( Jsoup.parse(cmsNodo.getTitulo()).text());
		}
		
		try {
			return cmsNodoDao.save(cmsNodo);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
	}
	
	/** Fin: CmsNodo **/	

	/** Inicio: avatar **/
	
	public String getRutaAvatar(PerUsuario perUsuario, HttpServletRequest request) {
		if(perUsuario==null || StringUtils.isBlank(perUsuario.getAvatar())) {
			return request.getContextPath() + "/img/no-profile-pic.png";
		}
		
		return request.getContextPath() + perUsuario.getRutaAvatar();
	}
	
	@Override
	public String subirArchivoAvatar(PerUsuario perUsuario, String nombreArchivo, InputStream archivoAvatar) {
		if(perUsuario==null || archivoAvatar==null) return null;
		
		try {
			String extension = FilenameUtils.getExtension(nombreArchivo);
			
			String rutaLocalArchivo = 
					servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + File.separator + "avatares" + File.separator;
			
			File directorio = new File(rutaLocalArchivo);
			
			FileUtils.forceMkdir(directorio);
			
			
			if(!StringUtils.isBlank(perUsuario.getAvatar())) {
				File archivoAnterior = new File(rutaLocalArchivo + perUsuario.getAvatar());
				if(archivoAnterior.exists() && archivoAnterior.isFile()) {
					archivoAnterior.delete();
				}
			}
			
			rutaLocalArchivo = rutaLocalArchivo + perUsuario.getIdUsuario() + "." + extension;
			validarRutaArchivoLocal(new File(rutaLocalArchivo));
			
			BufferedImage bimg = ImageIO.read(archivoAvatar);
			final int ancho = bimg.getWidth();
			final int alto = bimg.getHeight();
			
			int nuevoAncho = ancho;
			int nuevoAlto = alto;
			if(nuevoAncho>800) {
				nuevoAncho = 800;
				nuevoAlto = (int)((double)alto * 800.0/(double)ancho);
			}
			
			if(nuevoAlto>800) {
				nuevoAlto = 800;
				nuevoAncho = (int)((double)ancho * 800.0/(double)alto);
			}
			
			Thumbnails.of(bimg)
				.size(nuevoAncho, nuevoAlto)
				//.keepAspectRatio(true)
				.crop(Positions.CENTER)
				.toFile(rutaLocalArchivo);
			
			return FilenameUtils.getName(rutaLocalArchivo);
			
		} catch (Exception e) {
			throw new ExcepcionUno(e);
		}
	}
	
	@Override
	public InputStream obtenerArchivoLocalAvatar(PerUsuario perUsuario) {
		if(perUsuario==null || StringUtils.isBlank(perUsuario.getAvatar())) return null;
		
		String rutaLocalArchivo = 
				servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + File.separator + "avatares" + File.separator + perUsuario.getAvatar();
		
		File archivo = new File(rutaLocalArchivo);
		
		validarRutaArchivoLocal(archivo);
		
		if(!archivo.exists()) return null;
		
		if(archivo.isDirectory()) return null;
		
		try {
			return FileUtils.openInputStream(archivo);
		} catch (IOException e) {
			throw new ExcepcionUno(e);
		}
	}
	
	/** Fin: avatar **/
}
