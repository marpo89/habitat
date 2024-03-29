package org.habitatnicaragua.micasa.servicio;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.habitatnicaragua.micasa.dao.CmsArchivoDao;
import org.habitatnicaragua.micasa.dao.PryComentarioDao;
import org.habitatnicaragua.micasa.dao.PryProyectoDao;
import org.habitatnicaragua.micasa.dao.PryProyectoTmpDao;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.modelo.CatMaestro_;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.PerUsuario_;
import org.habitatnicaragua.micasa.modelo.PryComentario;
import org.habitatnicaragua.micasa.modelo.PryProyecto;
import org.habitatnicaragua.micasa.modelo.PryProyectoEstado;
import org.habitatnicaragua.micasa.modelo.PryProyectoTmp;
import org.habitatnicaragua.micasa.modelo.PryProyecto_;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.modelo.dto.ActividadRecienteProyectoDTO;
import org.habitatnicaragua.micasa.modelo.dto.PryComentarioDTO;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.jsoup.Jsoup;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServicioProyectoImpl implements ServicioProyecto {
	
	public static final int LONGITUD_MINIMA_CLAVE = 5;
			
	@Inject
	private ServicioPerfil servicioPerfil;
	
	@Inject
	private ServicioComun servicioComun;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	@Inject
	private ServicioNotificacion servicioNotificacion;
	
	@Inject
	private PryProyectoDao pryProyectoDao;
	
	@Inject
	private PryComentarioDao pryComentarioDao;
	
	@Inject
	private CmsArchivoDao cmsArchivoDao;
	
	@Inject
	private PryProyectoTmpDao pryProyectoTmpDao;	
	

	/** Inicio: PryProyecto **/
	@Override
	public PryProyecto buscarPryProyectoPorId(Long id) {
		PryProyecto resultado = null;
		
		if(servicioPerfil.isUsuarioActualMiembroRol("ADMIN") || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO.name())) {
			return pryProyectoDao.findOne(id);
		}
		
		if(servicioPerfil.isUsuarioActualMiembroRol(Rol.TECNICO.name())) {
			resultado = pryProyectoDao.buscarProyectoPorTecnico(id, servicioPerfil.getIdUsuarioActual());
		}
		
		if(resultado==null && servicioPerfil.isUsuarioActualMiembroRol(Rol.USUARIO.name())) {
			resultado = pryProyectoDao.buscarProyectoPorDuenio(id, servicioPerfil.getIdUsuarioActual());
		}
		
		return resultado;
	}

	@Override
	public Page<PryProyecto> listarMisPryProyectosUsuario(Pageable pagina, String filtro) {
		Page<PryProyecto> resultado = null;

		// Solo mostrar los proyectos creados por el ususario actual
		Specification<PryProyecto> filtroBase = new Specification<PryProyecto>(){
			@Override
			public Predicate toPredicate(Root<PryProyecto> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(PryProyecto_.duenio).get(PerUsuario_.idUsuario) , servicioPerfil.getIdUsuarioActual());
			}
		};
		
		Specification<PryProyecto> where = null;
		if (!StringUtils.isBlank(filtro)) {
			final Long filtroLong = NumberUtils.toLong(filtro, -1L);
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			
			where = new Specification<PryProyecto>() {

				@Override
				public Predicate toPredicate(Root<PryProyecto> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					
					if(filtroLong>0) {
						predicates.add(cb.equal(root.get(PryProyecto_.idProyecto), filtroLong));
					}
					predicates.add(cb.like(cb.upper(root.get(PryProyecto_.descripcion)), "%" + filtroSql));
					predicates.add(cb.like(cb.upper(root.get(PryProyecto_.estado).get(CatMaestro_.nombre)), filtroSql));
					return cb.or(predicates.toArray(new Predicate[0]));
				}
			};
		}

		resultado = pryProyectoDao.findAll(Specifications.where(filtroBase).and(where), pagina);

		return resultado;
	}

	public Page<PryProyecto> listarPryProyectos(Pageable pagina, String filtro) {
		Page<PryProyecto> resultado = null;

		Specification<PryProyecto> where = null;
		if (!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			final Long filtroLong = NumberUtils.toLong(filtro, -1L);
			
			where = new Specification<PryProyecto>() {

				@Override
				public Predicate toPredicate(Root<PryProyecto> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					
					if(filtroLong>0) {
						predicates.add(cb.equal(root.get(PryProyecto_.idProyecto), filtroLong));
					}
					predicates.add(cb.like(cb.upper(root.get(PryProyecto_.duenio).get(PerUsuario_.idUsuario)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(PryProyecto_.duenio).get(PerUsuario_.nombres)), filtroSql));
					
					predicates.add(cb.like(cb.upper(root.get(PryProyecto_.estado).get(CatMaestro_.nombre)), filtroSql));
					
					predicates.add(cb.like(cb.upper(root.join(PryProyecto_.tecnico, JoinType.LEFT).get(PerUsuario_.idUsuario)), filtroSql));
					predicates.add(cb.like(cb.upper(root.join(PryProyecto_.tecnico, JoinType.LEFT).get(PerUsuario_.nombres)), filtroSql));
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}
			};
		}

		resultado = pryProyectoDao.findAll(Specifications.where(where), pagina);

		return resultado;
	}
	
	@Override
	public Page<PryProyecto> listarMisPryProyectosAsignados(Pageable pagina, String filtro) {
		Page<PryProyecto> resultado = null;

		// Solo mostrar los proyectos asigandos al tecnico actual
		Specification<PryProyecto> filtroBase = new Specification<PryProyecto>(){
			@Override
			public Predicate toPredicate(Root<PryProyecto> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(PryProyecto_.tecnico).get(PerUsuario_.idUsuario) , servicioPerfil.getIdUsuarioActual());
			}
		};
				
		Specification<PryProyecto> where = null;
		if (!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			final Long filtroLong = NumberUtils.toLong(filtro, -1L);
			
			where = new Specification<PryProyecto>() {

				@Override
				public Predicate toPredicate(Root<PryProyecto> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					
					if(filtroLong>0) {
						predicates.add(cb.equal(root.get(PryProyecto_.idProyecto), filtroLong));
					}
					
					predicates.add(cb.like(cb.upper(root.get(PryProyecto_.duenio).get(PerUsuario_.idUsuario)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(PryProyecto_.duenio).get(PerUsuario_.nombres)), filtroSql));
					
					predicates.add(cb.like(cb.upper(root.get(PryProyecto_.estado).get(CatMaestro_.nombre)), filtroSql));
					return cb.or(predicates.toArray(new Predicate[0]));
				}
			};
		}

		resultado = pryProyectoDao.findAll(Specifications.where(filtroBase).and(where), pagina);

		return resultado;
	}

	@Override
	public void eliminarPryProyecto(Long idProyecto) throws ExcepcionUno {
		if (idProyecto == null) {
			throw ExcepcionUno.objetoNull();
		}

		try {
			pryProyectoDao.delete(idProyecto);
		} catch (Throwable t) {
			throw new ExcepcionUno(t);
		}
	}

	@Override
	public PryProyecto guardarPryProyectoUsuario(PryProyecto pryProyecto) throws ExcepcionUno {
		boolean notificarNuevoProyecto = false;
		
		if (pryProyecto == null) {
			throw ExcepcionUno.objetoNull();
		}

		if(pryProyecto.getIdProyecto()==null) {
			notificarNuevoProyecto = true;
		}
		
		if(pryProyecto.getEstado()==null) {
			pryProyecto.setEstado(getEstadoProyecto(PryProyectoEstado.COTIZANDO.getNombre()));
		}

		if(pryProyecto.getDuenio()==null) {
			pryProyecto.setDuenio(servicioPerfil.getUsuarioActual());
		}

		try {
			PryProyectoTmp pryProyectoOriginal = null;
			if(pryProyecto!=null && pryProyecto.getIdProyecto()!=null) {
				pryProyectoOriginal = pryProyectoTmpDao.findOne(pryProyecto.getIdProyecto());
			}
			
			pryProyecto = pryProyectoDao.save(pryProyecto);
			
			if(notificarNuevoProyecto) {
				notificarNuevoProyecto(pryProyecto);
			}
			
			notificarActualizacionRealizadaPorDuenio(pryProyecto, pryProyectoOriginal);
			
			notificarTecnicoProyectoSiAplica(pryProyecto, pryProyectoOriginal);
			
			return pryProyecto;
			
		} catch (Throwable t) {
			throw new ExcepcionUno(t);
		}
	}

	@Override
	public CatMaestro getEstadoProyecto(String nombre) {
		if(StringUtils.isBlank(nombre)) {
			return null;
		}
		
		List<CatMaestro> estados = servicioComun.listarCatalogosPorTipo("PROYECTO_ESTADO");
		for(CatMaestro estado:estados) {
			if(nombre.equalsIgnoreCase(estado.getNombre())) {
				return estado;
			}
		}
		
		return null;
	}
	
	@Override
	public ActividadRecienteProyectoDTO buscarActividadRecienteProyectoPorUsuarioActual() {
		PerUsuario usuarioActual = servicioPerfil.getUsuarioActual();
		
		if(usuarioActual==null) return null;
		
		
		List<CmsArchivo> archivoReciente = cmsArchivoDao.buscarArchivoRecientePorUsuario(
				usuarioActual.getIdUsuario(), 
				Arrays.asList(new String[]{PryProyectoEstado.COTIZANDO.getNombre(), 
						PryProyectoEstado.PENDIENTE_PAGO.getNombre(),
						PryProyectoEstado.EN_DESARROLLO.getNombre(),
						PryProyectoEstado.VISITADO.getNombre()}),
				new PageRequest(0, 1));
		
		List<PryComentario> comentarioReciente = pryComentarioDao.buscarComentarioRecientePorUsuario(
				usuarioActual.getIdUsuario(),
				Arrays.asList(new String[]{PryProyectoEstado.COTIZANDO.getNombre(), 
						PryProyectoEstado.PENDIENTE_PAGO.getNombre(),
						PryProyectoEstado.EN_DESARROLLO.getNombre(),
						PryProyectoEstado.VISITADO.getNombre()}),
				new PageRequest(0, 1));
		
		ActividadRecienteProyectoDTO arp = new ActividadRecienteProyectoDTO();
		if(archivoReciente!=null && archivoReciente.size()>=1) {
			arp.setCmsArchivo(archivoReciente.get(0));
		}
		if(comentarioReciente!=null && comentarioReciente.size()>=1) {
			arp.setPryComentario(comentarioReciente.get(0));
		}
		
		return arp;
	}
	
	@Override
	public PryProyecto cancelarProyectoPorCliente(Long idProyecto) throws ExcepcionUno {
		if (idProyecto == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		String idUsuarioActual = servicioPerfil.getIdUsuarioActual();
				
		if(StringUtils.isBlank(idUsuarioActual)) return null;
		
		PryProyecto proyecto = pryProyectoDao.findOne(idProyecto);
		
		if (proyecto == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(proyecto.getDuenio()==null || !idUsuarioActual.equals(proyecto.getDuenio().getIdUsuario())){
			throw ExcepcionUno.permisoDenegado();
		}
		
		if(!PryProyectoEstado.COTIZANDO.getNombre().equals(proyecto.getEstado().getNombre())) {
			throw new ExcepcionUno("Sólo proyectos en estado COTIZANDO pueden ser removidos.");
		}
		
		proyecto.setEstado(getEstadoProyecto(PryProyectoEstado.CANCELADO_CLIENTE.getNombre()));
		
		proyecto = pryProyectoDao.save(proyecto);
		
		return proyecto;
	}
	/** Fin: PryProyecto **/
	
	
	/** Inicio: PryComentario **/	
	@Override
	public PryComentario buscarPryComentarioPorId(Long idComentario) {
		PryComentario resultado = pryComentarioDao.findOne(idComentario);
		
		if(resultado!=null && resultado.getActivo()==Boolean.TRUE && servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN) || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO) || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.TECNICO)) {
			return resultado;
		}
		
		if(resultado!=null && resultado.getActivo()==Boolean.TRUE && servicioPerfil.isUsuarioActualMiembroRol(Rol.USUARIO) && 
				servicioPerfil.getIdUsuarioActual().equals(resultado.getIdProyecto().getDuenio().getIdUsuario())) {
			return resultado;
		}
		
		return null;
	}
	
	@Override
	public Page<PryComentarioDTO> listarPryComentariosPorProyecto(Pageable pagina, Long idProyecto) {
		Page<PryComentarioDTO> resutlado = null;
		
		if(servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN) || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO) || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.TECNICO)) {
			resutlado = pryComentarioDao.listarComentariosPorProyecto(idProyecto, pagina);
		}
		
		if(resutlado==null && servicioPerfil.isUsuarioActualMiembroRol(Rol.USUARIO)) {
			resutlado = pryComentarioDao.listarComentariosPorDuenioProyecto(idProyecto, servicioPerfil.getUsuarioActual(), pagina);
		}
		
		if(resutlado!=null && resutlado.getContent()!=null) {
			for(PryComentarioDTO c:resutlado.getContent()) {
				if(c!=null) {
					c.evalPropiedad(servicioPerfil.getUsuarioActual());
					
					if(!Boolean.TRUE.equals(c.getVisto()) && 
							servicioPerfil.getIdUsuarioActual().equals(c.getIdProyecto().getDuenio().getIdUsuario())) {
						c.getComentario().setVisto(true);
						pryComentarioDao.save(c.getComentario());
					}
				}
			}
		}
		
		return resutlado;
	}
	
	@Override
	public void eliminarPryComentario(Long idComentario) throws ExcepcionUno {
		if (idComentario == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		PryComentario com = pryComentarioDao.findOne(idComentario);
		if (com == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		PryComentarioDTO comentario = new PryComentarioDTO(com);
		comentario.evalPropiedad(servicioPerfil.getUsuarioActual());
		
		if(!comentario.isPropio()) {
			throw ExcepcionUno.permisoDenegado();
		}
		
		try {
			com.setActivo(false);
			pryComentarioDao.save(com);
		} catch (Throwable t) {
			throw new ExcepcionUno(t);
		}
	}
	
	@Override
	public PryComentario guardarPryComentario(String comentario, PryProyecto proyecto) throws ExcepcionUno {
		
		if (proyecto == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		comentario = StringUtils.trimToEmpty(comentario);
		comentario = Jsoup.parse(comentario).text();
		
		if (StringUtils.isBlank(comentario)) {
			throw ExcepcionUno.campoRequerido("comentario");
		}
		
		PryComentario pryComentario = new PryComentario();
		pryComentario.setActivo(true);
		pryComentario.setContenido(comentario);
		pryComentario.setIdProyecto(proyecto);
		pryComentario.setComentarista(servicioPerfil.getUsuarioActual());
		if(proyecto.getDuenio().getIdUsuario().equals(servicioPerfil.getIdUsuarioActual())) {
			pryComentario.setVisto(true);
		} else {
			pryComentario.setVisto(false);
		}
				
		try {
			pryComentario = pryComentarioDao.save(pryComentario);
			
			notificarComentarioProyecto(pryComentario);
			
			return pryComentario;
			
		} catch (Throwable t) {
			throw new ExcepcionUno(t);
		}
	}
	/** Fin: PryComentario **/
	
	/** Inicio: Archivo Proyecto **/
		
	@Override
	public CmsArchivo subirArchivoProyecto(PryProyecto proyecto, String nombreArchivo, InputStream archivo) {
		if(proyecto==null || archivo==null) return null;
		
		try {
			servicioContenido.validarArchivoPeligroso(nombreArchivo);
			
			String extension = FilenameUtils.getExtension(nombreArchivo);
			
			String directorio = 
					servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + File.separator + "proyectos" + File.separator;
			
			FileUtils.forceMkdir(new File(directorio));
			
			String nuevoNombre = UUID.randomUUID().toString() + "." + extension;
			String rutaLocalRelativaArchivo = proyecto.getIdProyecto() + File.separator + nuevoNombre;
			
			File archivoDisco = new File(directorio + rutaLocalRelativaArchivo);
			servicioContenido.validarRutaArchivoLocal(archivoDisco);
			FileUtils.copyInputStreamToFile(archivo, archivoDisco);
			
			CatMaestro catMaestroTipoArchivo = servicioComun.buscarCatMaestroPorTipoNombre("ID_CMS_TIPO_ARCHIVO", "ARCHIVO");
			
			CmsArchivo cmsArchivo = new CmsArchivo();
			cmsArchivo.setActivo(true);
			cmsArchivo.setProyecto(proyecto);
			cmsArchivo.setRuta(File.separator + "proyectos" + File.separator + rutaLocalRelativaArchivo);
			cmsArchivo.setTitulo(servicioComun.limpiarNombreArchivo(nombreArchivo));
			cmsArchivo.setTipoArchivo(catMaestroTipoArchivo);
			cmsArchivo.setOrden(0);
			
			servicioContenido.guardarCmsArchivo(cmsArchivo);
			
			return cmsArchivo;
			
		} catch (Exception e) {
			throw new ExcepcionUno(e);
		}
	}
	
	@Override
	public CmsArchivo buscarArchivoProyecto(long idProyecto, long idArchivo) {
		CmsArchivo archivo = servicioContenido.buscarCmsArchivoPorId(idArchivo);
		
		if(archivo==null) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		if(archivo.getProyecto()==null || idProyecto!=archivo.getProyecto().getIdProyecto()) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		if(servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN) || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO) || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.TECNICO)) {
			return archivo;
		}
		
		PerUsuario usuarioActual = servicioPerfil.getUsuarioActual();
		
		if(!usuarioActual.equals(archivo.getProyecto().getDuenio())){
			throw ExcepcionUno.permisoDenegado();
		}
		
		if(!Boolean.TRUE.equals(archivo.getActivo())) {
			throw ExcepcionUno.permisoDenegado();
		}
		
		return archivo;
	}
	
	@Override
	public InputStream obtenerInputStreamArchivoLocalProyecto(CmsArchivo cmsArchivo) {
		if(cmsArchivo==null || StringUtils.isBlank(cmsArchivo.getRuta())) return null;
		
		String rutaLocalArchivo = 
				servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + File.separator + cmsArchivo.getRuta();
		
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
	public void eliminarCmsArchivo(long idProyecto, long idArchivo) throws ExcepcionUno {
		CmsArchivo cmsArchivo = servicioContenido.buscarCmsArchivoPorId(idArchivo);
		
		if(cmsArchivo==null) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		if(cmsArchivo.getProyecto()==null || idProyecto!=cmsArchivo.getProyecto().getIdProyecto()) {
			throw ExcepcionUno.parametroInvalido();
		}
				
		cmsArchivo.setActivo(false);

		servicioContenido.guardarCmsArchivo(cmsArchivo);
		
		String rutaLocalArchivo = 
				servicioComun.getValorParametro("RUTA_LOCAL_ARCHIVOS") + File.separator + cmsArchivo.getRuta();
		
		File archivo = new File(rutaLocalArchivo);
		servicioContenido.validarRutaArchivoLocal(archivo);
		
		if(archivo.exists() && archivo.isFile() && archivo.canWrite()) {
			archivo.delete();
		}
	}
	
	/** Fin: Archivo Proyecto **/
	
	private void notificarNuevoProyecto(PryProyecto pryProyecto) {
		String plantillaCorreo = servicioComun.getValorParametro("CORREO_NOTIFICAR_NUEVO_PROYECTO");
		
		if(!StringUtils.isBlank(plantillaCorreo)) {
			List<PerUsuario> administradoresTecnicos = servicioPerfil.listarAdministradoresTecnicos();
			
			plantillaCorreo = plantillaCorreo.replace("{{CODIGO}}", "" + pryProyecto.getIdProyecto());
			
			String asunto = servicioComun.getValorParametro("CORREO_NOTIFICAR_NUEVO_PROYECTO_ASUNTO");
			if(StringUtils.isBlank(asunto)) {
				asunto = "Nueva Cita de Proyecto";
			}
			asunto = asunto.replace("{{CODIGO}}", "" + pryProyecto.getIdProyecto());
			
			servicioNotificacion.notificar(asunto, plantillaCorreo, administradoresTecnicos);
		}
	}
	
	private void notificarActualizacionRealizadaPorDuenio(PryProyecto pryProyecto, PryProyectoTmp pryProyectoOriginal) {
		if(pryProyecto==null || pryProyecto.getDuenio()==null) return;
		
		if(pryProyecto.getIdProyecto()==null) return;
		
		if(servicioPerfil.getIdUsuarioActual().equals(pryProyecto.getDuenio().getIdentificador())) {
			String plantillaCorreo = servicioComun.getValorParametro("CORREO_NOTIFICAR_ACTUALIZACION_PROYECTO");
			
			if(!StringUtils.isBlank(plantillaCorreo)) {
				List<PerUsuario> administradoresTecnicos = servicioPerfil.listarAdministradoresTecnicos();
				
				plantillaCorreo = plantillaCorreo.replace("{{CODIGO}}", "" + pryProyecto.getIdProyecto());
				
				String asunto = servicioComun.getValorParametro("CORREO_NOTIFICAR_ACTUALIZACION_PROYECTO_ASUNTO");
				if(StringUtils.isBlank(asunto)) {
					asunto = "Proyecto Actualizado";
				}
				asunto = asunto.replace("{{CODIGO}}", "" + pryProyecto.getIdProyecto());
				
				servicioNotificacion.notificar(asunto, plantillaCorreo, administradoresTecnicos);
			}
		}
		
	}
	
	private void notificarTecnicoProyectoSiAplica(PryProyecto pryProyecto, PryProyectoTmp pryProyectoOriginal) {
		if(pryProyecto==null || pryProyecto.getTecnico()==null) return;
		
		if(pryProyectoOriginal==null || !pryProyecto.getTecnico().getIdUsuario().equals(pryProyectoOriginal.getTecnico())) {
			String plantillaCorreo = servicioComun.getValorParametro("CORREO_NOTIFICAR_NUEVA_ASIGNACION");
			
			if(!StringUtils.isBlank(plantillaCorreo)) {
				
				plantillaCorreo = plantillaCorreo.replace("{{CODIGO}}", "" + pryProyecto.getIdProyecto());
				
				String asunto = servicioComun.getValorParametro("CORREO_NOTIFICAR_NUEVA_ASIGNACION_ASUNTO");
				if(StringUtils.isBlank(asunto)) {
					asunto = "Proyecto Asignado";
				}
				asunto = asunto.replace("{{CODIGO}}", "" + pryProyecto.getIdProyecto());
				
				servicioNotificacion.notificar(asunto, plantillaCorreo, pryProyecto.getTecnico());
			}
		}
		
	}
	
	private void notificarComentarioProyecto(PryComentario comentario) {
		if(comentario==null || comentario.getIdProyecto()==null) return;
		
		String plantillaCorreo = servicioComun.getValorParametro("CORREO_NOTIFICAR_NUEVO_COMENTARIO");
		
		if(!StringUtils.isBlank(plantillaCorreo)) {
			
			List<PerUsuario> interesadosGestion = servicioPerfil.listarAdministradoresTecnicos();
			if(interesadosGestion==null) interesadosGestion = new ArrayList<PerUsuario>();
			
			if(comentario.getIdProyecto().getTecnico()!=null) {
				interesadosGestion.add(comentario.getIdProyecto().getTecnico());
			}
			
			
			interesadosGestion.remove(servicioPerfil.getUsuarioActual());
			
			plantillaCorreo = plantillaCorreo.replace("{{CODIGO}}", "" + comentario.getIdProyecto().getIdProyecto());
			
			plantillaCorreo = plantillaCorreo.replace("{{AUTOR}}", servicioPerfil.getUsuarioActual().getNombres());
			
			plantillaCorreo = plantillaCorreo.replace("{{COMENTARIO}}", StringUtils.abbreviate(Jsoup.parse(comentario.getContenido()).text(),300) );
			
			String plantillaCorreoUsuario = new String(plantillaCorreo);
			
			String rutaEnlaceGestion = "/gestion/proyectoForm.xhtml?idProyecto=" + comentario.getIdProyecto().getIdProyecto() + "#comentarios";
			plantillaCorreo = plantillaCorreo.replace("{{RUTA_ENLACE}}", rutaEnlaceGestion);
			
			String asunto = servicioComun.getValorParametro("CORREO_NOTIFICAR_NUEVO_COMENTARIO_ASUNTO");
			if(StringUtils.isBlank(asunto)) {
				asunto = "Nuevo Comentario";
			}
			asunto = asunto.replace("{{CODIGO}}", "" + comentario.getIdProyecto().getIdProyecto());
			
			// usuarios de gestion
			servicioNotificacion.notificar(asunto, plantillaCorreo, interesadosGestion);
			
			// duenio del proyecto
			if(!servicioPerfil.getUsuarioActual().getIdUsuario().equals(comentario.getIdProyecto().getDuenio().getIdUsuario())) {
				rutaEnlaceGestion = "/proyecto/miProyectoForm.xhtml?idProyecto=" + comentario.getIdProyecto().getIdProyecto() + "#comentarios";
				plantillaCorreoUsuario = plantillaCorreoUsuario.replace("{{RUTA_ENLACE}}", rutaEnlaceGestion);
				
				servicioNotificacion.notificar(asunto, plantillaCorreoUsuario, comentario.getIdProyecto().getDuenio());
			}
		}
		
	}
	
}
