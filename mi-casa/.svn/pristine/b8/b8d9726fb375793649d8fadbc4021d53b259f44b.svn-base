package org.habitatnicaragua.micasa.servicio;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.dao.PubPublicidadDao;
import org.habitatnicaragua.micasa.modelo.PubPublicidad;
import org.habitatnicaragua.micasa.modelo.PubPublicidad_;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.model.UploadedFile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServicioPublicidadImpl implements ServicioPublicidad {
	
	public static final int LONGITUD_MINIMA_CLAVE = 5;
	
	@Inject
	private PubPublicidadDao pubPublicidadDao;
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	@Inject
	private ServicioComun servicioComun;
	
	@Inject
	private ServicioContenido servicioContenido;
		
	/** Inicio: PubPublicidad **/
	
	@Override
	public PubPublicidad buscarPubPublicidadPorId(Long id) {
		PubPublicidad pubPublicidad = pubPublicidadDao.findOne(id);
		
		if(pubPublicidad==null) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		if(servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN)) {
			return pubPublicidad;
		}
				
		if(!Boolean.TRUE.equals(pubPublicidad.getActivo())) {
			return null;
		}
		
		return pubPublicidad;
	}
	
	@Override
	public Page<PubPublicidad> listarPubPublicidad(Pageable pagina, String filtro) {
		Page<PubPublicidad> resultado = null;
		
		// SOLO MOSTRAR LOS ACTIVOS
		Specification<PubPublicidad> filtroBase = new Specification<PubPublicidad>(){
			@Override
			public Predicate toPredicate(Root<PubPublicidad> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(PubPublicidad_.activo), true);
			}
		};
		
		Specification<PubPublicidad> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<PubPublicidad>() {
	
				@Override
				public Predicate toPredicate(Root<PubPublicidad> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(PubPublicidad_.idPublicidad.toString())), filtroSql));
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}	
			};
		}
		
		if(servicioPerfil.isUsuarioActualMiembroRol("ADMIN")) {
			resultado = pubPublicidadDao.findAll(Specifications.where(where), pagina);
		} else {
			resultado = pubPublicidadDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		}
		return resultado;
	}
	
	@Override
	public void eliminarPubPublicidad(Long idPublicidad) throws ExcepcionUno {
		if(idPublicidad==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		PubPublicidad pubPublicidad = pubPublicidadDao.findOne(idPublicidad);
		if (pubPublicidad == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		removerArchivosPubPublicidad(pubPublicidad, true, true, true);
		
		try {
			pubPublicidadDao.delete(idPublicidad);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
    }
	
	@Override
	public PubPublicidad guardarPubPublicidad(PubPublicidad pubPublicidad, UploadedFile archivo1, UploadedFile archivo2, UploadedFile archivo3) throws ExcepcionUno {
		if(pubPublicidad==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(pubPublicidad.getInicio()==null) {
			throw ExcepcionUno.campoRequerido("Fecha inicial");
		}
		
		if(pubPublicidad.getFin()==null) {
			throw ExcepcionUno.campoRequerido("Fecha final");
		}
		
		if(pubPublicidad.getFin().before(pubPublicidad.getInicio())) {
			Date tmp = pubPublicidad.getInicio();
			pubPublicidad.setInicio(pubPublicidad.getFin());
			pubPublicidad.setFin(tmp);
		}
		
		if(pubPublicidad.getIdPublicidad()==null && pubPublicidad.getFin().before(new Date())) {
			throw new ExcepcionUno("El rango de fechas está en el pasado.");
		}
		
		if(pubPublicidad.getMaxClicks()==null || pubPublicidad.getMaxClicks()<0) {
			pubPublicidad.setMaxClicks(0L);
		}
		
		if(pubPublicidad.getMaxImpresiones()==null || pubPublicidad.getMaxImpresiones()<0) {
			pubPublicidad.setMaxImpresiones(0L);
		}
		
		if(!StringUtils.isBlank(pubPublicidad.getEnlace())) {
			if(!servicioComun.isURLValida(pubPublicidad.getEnlace())) {
				throw ExcepcionUno.textoSucio("enlace");
			}
		}
		
		if(pubPublicidad.getIdPublicidad()==null) {
			try {
				pubPublicidad = pubPublicidadDao.save(pubPublicidad);
			} catch (Throwable t){
				throw new ExcepcionUno(t);
			}
		}
		
		subirArchivoAdjuntoPubPublicidad(pubPublicidad, archivo1, 1);
		subirArchivoAdjuntoPubPublicidad(pubPublicidad, archivo2, 2);
		subirArchivoAdjuntoPubPublicidad(pubPublicidad, archivo3, 3);

		
		try {
			pubPublicidad = pubPublicidadDao.save(pubPublicidad);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
		
		return pubPublicidad;
	}
	
	private void subirArchivoAdjuntoPubPublicidad(PubPublicidad pubPublicidad, UploadedFile archivo, int numero) {
		if(archivo==null || archivo.getSize()<=0 || !servicioContenido.isArchivoImagen(archivo)) {
			return;
		}
		
		servicioContenido.validarArchivoPeligroso(archivo.getFileName());
		
		try {
			/*
			BufferedImage bimg = ImageIO.read(archivo.getInputstream());
			final int ancho = bimg.getWidth();
			final int alto = bimg.getHeight();
			
			// 1200 / 150
			double proporcion = (double)ancho/(double)alto;
			if(proporcion>8.5 || proporcion<7.5) {
				throw new ExcepcionUno("Las proporciones de la gráfica no son correctas.");
			}
			*/
			
			String extension = FilenameUtils.getExtension(archivo.getFileName());
			
			String rutaArchivoExistente = null;
			switch(numero) {
				case 1: rutaArchivoExistente = pubPublicidad.getArchivo1(); break;
				case 2: rutaArchivoExistente = pubPublicidad.getArchivo2(); break;
				case 3: rutaArchivoExistente = pubPublicidad.getArchivo3(); break;
			}
			
			String directorio = servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + File.separator + "d4d1c1l8up" + File.separator;
			FileUtils.forceMkdir(new File(directorio));
			
			
			String nuevoNombre = null;
			
			if(StringUtils.isBlank(rutaArchivoExistente)) {
				nuevoNombre = UUID.randomUUID().toString() + "." + extension;
			} else {
				nuevoNombre = FilenameUtils.getBaseName(rutaArchivoExistente) + "." + extension;
			}
			
			String rutaLocalRelativaArchivo = pubPublicidad.getIdPublicidad() + File.separator + nuevoNombre;
			File archivoDisco = new File(directorio + rutaLocalRelativaArchivo);
			
			servicioContenido.validarRutaArchivoLocal(archivoDisco);
			
			FileUtils.copyInputStreamToFile(archivo.getInputstream(), archivoDisco);
			
			String ruta = File.separator + "d4d1c1l8up" + File.separator + rutaLocalRelativaArchivo;
			
			switch(numero) {
				case 1: pubPublicidad.setArchivo1(ruta); break;
				case 2: pubPublicidad.setArchivo2(ruta); break;
				case 3: pubPublicidad.setArchivo3(ruta); break;
			}
			
			
		} catch (Exception e) {
			throw new ExcepcionUno(e);
		}
	}

	@Override
	public InputStream obtenerInputStreamArchivoLocalPublicidad(PubPublicidad pubPublicidad, int numero) {
		if(pubPublicidad==null) return null;
		
		String rutaArchivo = "";
		switch(numero) {
		case 1:
			rutaArchivo = pubPublicidad.getArchivo1();
			break;
		case 2:
			rutaArchivo = pubPublicidad.getArchivo2();
			break;
		case 3:
			rutaArchivo = pubPublicidad.getArchivo3();
			break;
		default:
			return null;	
		}
		
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
	public PubPublicidad removerArchivosPubPublicidad(PubPublicidad pubPublicidad, boolean removerArchivo1, boolean removerArchivo2, boolean removerArchivo3) {
		if(pubPublicidad==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(removerArchivo1 && !StringUtils.isBlank(pubPublicidad.getArchivo1())) {
			removerArchivoPubPublicidad(pubPublicidad.getArchivo1());
			pubPublicidad.setArchivo1(null);
		}
		
		if(removerArchivo2 && !StringUtils.isBlank(pubPublicidad.getArchivo2())) {
			removerArchivoPubPublicidad(pubPublicidad.getArchivo2());
			pubPublicidad.setArchivo2(null);
		}
		
		if(removerArchivo3 && !StringUtils.isBlank(pubPublicidad.getArchivo3())) {
			removerArchivoPubPublicidad(pubPublicidad.getArchivo3());
			pubPublicidad.setArchivo3(null);
		}
		
		try {
			pubPublicidad = pubPublicidadDao.save(pubPublicidad);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
		
		return pubPublicidad;
	}
	
	private void removerArchivoPubPublicidad(String rutaArchivo) {
		
		String rutaLocalArchivo = servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + rutaArchivo;
		
		if(!rutaLocalArchivo.contains("d4d1c1l8up")) return;
		
		File archivo = new File(rutaLocalArchivo);
		
		servicioContenido.validarRutaArchivoLocal(archivo);
		
		if(archivo.exists() && archivo.isFile() && archivo.canWrite()) {
			archivo.delete();
		}
	}

	@Override
	public PubPublicidad buscarSiguientePublicidad(String ubicacion) {
		List<PubPublicidad> pubs = pubPublicidadDao.buscarSiguientePublicidad(ubicacion);
		
		if(pubs!=null && pubs.size()>0) {
			PubPublicidad pubPublicidad = pubs.get(0);
			
			if(pubPublicidad!=null) {
				pubPublicidadDao.contarImpresion(pubPublicidad);
			}
			
			return pubPublicidad;
		}
		
		return null;
	}
	
	@Override
	public void contarClick(PubPublicidad pubPublicidad) {
		if(pubPublicidad!=null) {
			pubPublicidadDao.contarClick(pubPublicidad);
		}
	}
	
	/** Fin: PubPublicidad **/	
}
