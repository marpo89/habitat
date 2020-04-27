package org.habitatnicaragua.micasa.servicio;

import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.dao.PerDireccionDao;
import org.habitatnicaragua.micasa.dao.PerUsuarioDao;
import org.habitatnicaragua.micasa.dao.SegLoginDao;
import org.habitatnicaragua.micasa.dao.SegRolDao;
import org.habitatnicaragua.micasa.dao.VwActividadUsuarioNivel2Dao;
import org.habitatnicaragua.micasa.modelo.CatMaestro_;
import org.habitatnicaragua.micasa.modelo.PerDireccion;
import org.habitatnicaragua.micasa.modelo.PerDireccion_;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.PerUsuario_;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.modelo.SegLogin;
import org.habitatnicaragua.micasa.modelo.SegLogin_;
import org.habitatnicaragua.micasa.modelo.SegRol;
import org.habitatnicaragua.micasa.modelo.VwActividadUsuarioNivel2;
import org.habitatnicaragua.micasa.modelo.VwActividadUsuarioNivel2_;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServicioSeguridadImpl implements ServicioSeguridad {
	
	private final static Logger LOGGER = LoggerFactory.getLogger(ServicioSeguridadImpl.class);
	
	@Inject
	private ServicioComun servicioComun;
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	@Inject
	private PerUsuarioDao perUsuarioDao;
	
	@Inject
	private SegRolDao segRolDao;
	
	@Inject
	private PerDireccionDao perDireccionDao;
	
	@Inject
	private SegLoginDao segLoginDao;
	
	@Inject
	private VwActividadUsuarioNivel2Dao vwActividadUsuarioNivel2Dao;
	
	
	/** Inicio: PerUsuario **/
	// Maestro
	@Override
	public PerUsuario buscarPerUsuarioPorId(String id) {
		PerUsuario perUsuario = perUsuarioDao.findOne(id);
		
		if(servicioPerfil.isUsuarioActualMiembroRol("ADMIN")) {
			return perUsuario;
		}
		
		// SOLO MOSTRAR LOS ACTIVOS
		if(perUsuario.getActivo()) {
			return perUsuario;
		}
		
		return null;
	}
	
	@Override
	public SegLogin buscarSegLoginPorCorreo(PerUsuario perUsuario) {
		
		SegLogin segLogin = segLoginDao.buscarUsuarioLogin(perUsuario.getCorreo());

		return segLogin;
		
	}
	
	@Override
	public PerUsuario buscarPerUsuarioActivoPorUuid(String uuidUsuario) {
		PerUsuario perUsuario = perUsuarioDao.findOne(uuidUsuario);
		
		if(perUsuario!=null && Boolean.TRUE.equals(perUsuario.getActivo())) {
			return perUsuario;
		}
		
		return null;
	}
	
	@Override
	public Page<PerUsuario> listarUsuarios(Pageable pagina, String filtro) {
		Page<PerUsuario> resultado = null;
		
		// SOLO MOSTRAR LOS ACTIVOS
		Specification<PerUsuario> filtroBase = new Specification<PerUsuario>(){
			@Override
			public Predicate toPredicate(Root<PerUsuario> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(PerUsuario_.activo), true);
			}
		};
		
		Specification<PerUsuario> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<PerUsuario>() {
	
				@Override
				public Predicate toPredicate(Root<PerUsuario> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(PerUsuario_.idUsuario)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(PerUsuario_.correo)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(PerUsuario_.nombres)), "%" + filtroSql));
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}	
			};
		}
		
		if(servicioPerfil.isUsuarioActualMiembroRol("ADMIN")) {
			resultado = perUsuarioDao.findAll(Specifications.where(where), pagina);
		} else {
			resultado = perUsuarioDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		}
		return resultado;
	}
	
	
	@Override
	public void eliminarUsuario(String idUsuario) throws ExcepcionUno {
		if(idUsuario==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		PerUsuario perUsuario = buscarPerUsuarioPorId(idUsuario);
				
		if(perUsuario==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		SegLogin segLogin = buscarSegLoginPorCorreo(perUsuario);		
		
		if(segLogin==null) {
			perUsuarioDao.delete(perUsuario);
		}else{
			perUsuario.setActivo(false);
			try {
				perUsuarioDao.save(perUsuario);
			} catch (Throwable t){
				throw new ExcepcionUno(t);
			}
		}
		
		
    }
	
	@Override
	public PerUsuario guardarPerUsuario(PerUsuario perUsuario) throws ExcepcionUno {
		if(perUsuario==null) {
			throw ExcepcionUno.objetoNull();
		} 
		
		if(StringUtils.isBlank(perUsuario.getCorreo())) {
			throw ExcepcionUno.campoRequerido("Correo");
		}
		
		if(!servicioPerfil.isUsuarioActualMiembroRol("ADMIN")) {
			if(!StringUtils.equalsIgnoreCase(servicioPerfil.getIdUsuarioActual(), perUsuario.getIdUsuario())){
				throw ExcepcionUno.permisoDenegado();
			}
		}
		
		if(!servicioComun.isEmailValido(perUsuario.getCorreo())){
			throw new ExcepcionUno("El correo no es válido, favor corregir.");
		}
		
		if(StringUtils.isBlank(perUsuario.getNombres())) {
			throw ExcepcionUno.campoRequerido("Nombre");
		}
		
		if(!servicioComun.isTextoLimpio(perUsuario.getNombres())){
			throw ExcepcionUno.textoSucio("Nombre");
		}
		
		if(StringUtils.isBlank(perUsuario.getIdUsuario())) {
			perUsuario.setIdUsuario(UUID.randomUUID().toString());
		}
				
		try {
			return perUsuarioDao.save(perUsuario);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
	}
	
	
	/** Fin: PerUsuario **/
	
	
	/** Inicio: SegRol **/
	
	@Override
	public List<SegRol> listarRoles() {
		return segRolDao.findAll(new Sort(Sort.Direction.ASC, "rol"));
	}
	
	@Override
	public SegRol buscarRolePorNombre(Rol rol) {
		return segRolDao.buscarSegRolPorNombre(rol.name());
	}
	
	/** Fin: SegRol **/
	
	/** Inicio: PerDireccion **/
	
	@Override
	public List<PerDireccion> listarTodasDireccionesUsuario(String idPerUsuario) {
		return perDireccionDao.listarTodasDireccionesUsuario(idPerUsuario);
	}
	
	@Override
	public Page<PerDireccion> listarDireccionesPorUsuario(String idPerUsuario, Pageable pagina, String filtro) {
		Page<PerDireccion> resultado = null;
		
        // filtrar por idPerUsuario
		Specification<PerDireccion> filtroBase = new Specification<PerDireccion>(){
			@Override
			public Predicate toPredicate(Root<PerDireccion> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(PerDireccion_.usuario).get(PerUsuario_.idUsuario), idPerUsuario);
			}
		};
		
		Specification<PerDireccion> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<PerDireccion>() {
	
				@Override
				public Predicate toPredicate(Root<PerDireccion> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(PerDireccion_.nombre)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(PerDireccion_.direccion)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(PerDireccion_.idLocalidad).get(CatMaestro_.nombre)), filtroSql));
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}	
			};
		}
		
		resultado = perDireccionDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		
		return resultado;
	}
	
	@Override
	public PerDireccion buscarPerDireccionPorId(Long id) {
		PerDireccion perDireccion = perDireccionDao.findOne(id);
		
		if(!servicioPerfil.isUsuarioActualMiembroRol("ADMIN")) {
			if(!StringUtils.equalsIgnoreCase(servicioPerfil.getIdUsuarioActual(), perDireccion.getUsuario().getIdUsuario())){
				throw ExcepcionUno.permisoDenegado();
			}
		}
		
		return perDireccion;
	}
	
	@Override
	public void eliminarPerDireccion(Long idPerDireccion) throws ExcepcionUno {
		if(idPerDireccion==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		PerDireccion perDireccion = buscarPerDireccionPorId(idPerDireccion);
		if(perDireccion==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(!servicioPerfil.isUsuarioActualMiembroRol("ADMIN")) {
			if(!StringUtils.equalsIgnoreCase(servicioPerfil.getIdUsuarioActual(), perDireccion.getUsuario().getIdUsuario())){
				throw ExcepcionUno.permisoDenegado();
			}
		}
		
		try {
			perDireccionDao.delete(perDireccion);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
    }
	
	@Override
	public PerDireccion guardarPerDireccion(PerDireccion perDireccion) throws ExcepcionUno {
		if(perDireccion==null) {
			throw ExcepcionUno.objetoNull();
		}	
	
		if(!servicioPerfil.isUsuarioActualMiembroRol("ADMIN")) {
			if(!StringUtils.equalsIgnoreCase(servicioPerfil.getIdUsuarioActual(), perDireccion.getUsuario().getIdUsuario())){
				throw ExcepcionUno.permisoDenegado();
			}
		}
		
		try {
			return perDireccionDao.save(perDireccion);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
	}
	
	/** Fin: PerDireccion **/
	
	/** Inicio: SegLogin **/
	
	@Override
	public Page<SegLogin> listarSegLogin(Pageable pagina, String filtro) {
		Page<SegLogin> resultado = null;
		
		Specification<SegLogin> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<SegLogin>() {
	
				@Override
				public Predicate toPredicate(Root<SegLogin> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(SegLogin_.correo)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(SegLogin_.ip)), filtroSql));
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}
			};
		}
		
		resultado = segLoginDao.findAll(where, pagina);
		
		return resultado;
	}
	
	
	@Override
	public Page<VwActividadUsuarioNivel2> listarActividadUsuarioNivel2(Pageable pagina, String filtro){
		Page<VwActividadUsuarioNivel2> resultado = null;
		
		Specification<VwActividadUsuarioNivel2> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<VwActividadUsuarioNivel2>() {
	
				@Override
				public Predicate toPredicate(Root<VwActividadUsuarioNivel2> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(VwActividadUsuarioNivel2_.correo)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(VwActividadUsuarioNivel2_.nombres)), filtroSql));
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}
			};
		}
		
		resultado = vwActividadUsuarioNivel2Dao.findAll(where, pagina);
		
		return resultado;
	}
	
	@Override
	public SegLogin guardarSegLogin(SegLogin segLogin) throws ExcepcionUno {
		if(segLogin==null) {
			return null;
		}	
		
		try {
			return segLoginDao.save(segLogin);
		} catch (Throwable t){
			LOGGER.error("", t);
		}
		
		return null;
	}
	
	/** Fin: SegLogin **/
	
}
