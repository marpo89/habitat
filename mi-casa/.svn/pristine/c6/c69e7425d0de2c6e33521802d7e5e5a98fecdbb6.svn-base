package org.habitatnicaragua.micasa.servicio;

import java.security.SecureRandom;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.dao.PerCalificacionDao;
import org.habitatnicaragua.micasa.dao.PerUsuarioDao;
import org.habitatnicaragua.micasa.dao.SegRolDao;
import org.habitatnicaragua.micasa.dao.VwProveedorDao;
import org.habitatnicaragua.micasa.modelo.PerCalificacion;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.modelo.SegRol;
import org.habitatnicaragua.micasa.modelo.VwProveedor;
import org.habitatnicaragua.micasa.modelo.VwProveedor_;
import org.habitatnicaragua.micasa.modelo.dto.PerCalificacionDTO;
import org.habitatnicaragua.micasa.modelo.dto.CalificacionPromedioDTO;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.jsoup.Jsoup;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServicioPerfilImpl implements ServicioPerfil {
	
	public static final int LONGITUD_MINIMA_CLAVE = 5;
	
	public static final String PER_USUARIO_ACTUAL = "PER_USUARIO_ACTUAL";
	
	@Inject
	private ServicioComun servicioComun;
	
	@Inject
	private ServicioNotificacion servicioNotificacion;
	
	@Inject
	private PerCalificacionDao perCalificacionDao;
	
	@Inject
	private PerUsuarioDao perUsuarioDao;
	
	@Inject
	private SegRolDao segRolDao;

	@Inject
	private VwProveedorDao vwProveedorDao;
	
	@Inject
	private HttpServletRequest httpRequest;
	
	/** Inicio: PerCalificacion **/
	
	@Override
	public PerCalificacion buscarPerCalificacionPorId(Long id) {
		return perCalificacionDao.findOne(id);
	}
	
	@Override
	public Page<PerCalificacionDTO> listarPerCalificacion(Pageable pagina, String idProveedor) {
		Page<PerCalificacion> resultado = null;
		
		resultado = perCalificacionDao.listarPerCalificacionPorUsuario(idProveedor, pagina);
		Page<PerCalificacionDTO> resultadoDTO = resultado.map(new Converter<PerCalificacion, PerCalificacionDTO>(){
		
			@Override
			public PerCalificacionDTO convert(PerCalificacion calificacion) {
				return new PerCalificacionDTO(calificacion, getUsuarioActual());				
			}});
	
		
		return resultadoDTO;
	}
	
	
	@Override
	public void eliminarPerCalificacion(Long idCalificacion) throws ExcepcionUno {
		if(idCalificacion==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		PerCalificacion com = perCalificacionDao.findOne(idCalificacion);
		if (com == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		PerCalificacionDTO comentario = new PerCalificacionDTO(com, getUsuarioActual());
		
		if(!comentario.isPropio()) {
			throw ExcepcionUno.permisoDenegado();
		}		
		
		try {
			perCalificacionDao.delete(idCalificacion);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
    }
	
	@Override
	public PerCalificacion guardarPerCalificacion(PerCalificacion perCalificacion) throws ExcepcionUno {
		if(perCalificacion==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(StringUtils.isBlank(perCalificacion.getComentario())) {
			return null;
		}
		
		if(perCalificacion.getProveedor()==null) {
			return null;
		}
		
		perCalificacion.setComentario(StringUtils.truncate(Jsoup.parse(perCalificacion.getComentario()).text(), 500));
		
		if(perCalificacion.getPuntaje()==null) {
			perCalificacion.setPuntaje(0);
		}
		
		if(perCalificacion.getAutor()==null) {
			perCalificacion.setAutor(getUsuarioActual());
		}
		
		try {
			return perCalificacionDao.save(perCalificacion);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
	}
	
	@Override
	public CalificacionPromedioDTO getPromedioCalificacionPorProveedor(String idUsuario) {
		CalificacionPromedioDTO calificacion = perCalificacionDao.getPromedioCalificacionPorProveedor(idUsuario);
		if(calificacion==null) {
			calificacion = new CalificacionPromedioDTO(0l,0l);
		}
		
		return calificacion;
	}
	
	
	/** Fin: PerCalificacion **/
	
	
	/** Inicio: PerUsuario **/
	@Override
	public PerUsuario getUsuarioActual() {
		
		if(httpRequest!=null && httpRequest.getAttribute(PER_USUARIO_ACTUAL)!=null) {
			return (PerUsuario)httpRequest.getAttribute(PER_USUARIO_ACTUAL);
		}
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication!=null && authentication.getName()!=null && !(authentication instanceof AnonymousAuthenticationToken)) {
			PerUsuario perUsuario = perUsuarioDao.buscarUsuarioPorCorreo(authentication.getName());
			httpRequest.setAttribute(PER_USUARIO_ACTUAL, perUsuario);
			return perUsuario;
		}
		
		return null;
	}
	
	@Override
	public String getIdUsuarioActual(){
		PerUsuario perUsuario = getUsuarioActual();
		
		if(perUsuario!=null){
			return perUsuario.getIdUsuario();
		}
		
		return "";
	}
	
	@Override
	public boolean isPerUsuarioExistente(String correo) {
		PerUsuario perUsuario = perUsuarioDao.buscarUsuarioPorCorreo(correo);
		
		return perUsuario!=null;
	}
	
	@Override
	public boolean isUsuarioActualMiembroRol(String rol) {
        rol = "ROLE_" + rol;
        
		// get security context from thread local
        SecurityContext context = SecurityContextHolder.getContext();
        if (context == null)
            return false;

        Authentication authentication = context.getAuthentication();
        if (authentication == null)
            return false;

        for (GrantedAuthority auth : authentication.getAuthorities()) {
            if (rol.equals(auth.getAuthority()))
                return true;
        }

        return false;
    }
	
	@Override
	public boolean isUsuarioActualMiembroRol(Rol rol) {
		return isUsuarioActualMiembroRol(rol.name());
	}
	
	@Override
	public boolean isUsuarioActualMiembroRol(Rol... roles) {
		for(Rol rol:roles) {
			if(isUsuarioActualMiembroRol(rol.name())) {
				return true;
			}
		}
		
		return false;
	}
	
	@Override
	public boolean isUsuarioMiembroRol(PerUsuario usuario, Rol... roles) {
		if(roles==null || roles.length<=0) return false;
		
		for(SegRol rolUsuario : usuario.getRoles()) {
			for(Rol rol:roles) {
				if(rol.name().equals(rolUsuario.getRol())) {
					return true;
				}
			}
		}
		
		return false;
	}
	
	@Override
	public PerUsuario crearNuevaCuentaAutoRegistro(String correo, String clave, String nombresApellidos) {
		if(StringUtils.isBlank(nombresApellidos)) {
			throw ExcepcionUno.campoRequerido("Nombres y Apellidos");
		}
		
		if(StringUtils.isBlank(correo)) {
			throw ExcepcionUno.campoRequerido("Correo");
		}
		
		correo = StringUtils.trim(correo);
		
		if(StringUtils.isBlank(clave)) {
			throw ExcepcionUno.campoRequerido("Contraseña");
		}
		
		if(clave.length() < LONGITUD_MINIMA_CLAVE) {
			throw new ExcepcionUno("La longitud mínima permitida de la contraseña es: " + LONGITUD_MINIMA_CLAVE);
		}
		
		if(!servicioComun.isEmailValido(correo)) {
			throw new ExcepcionUno("El correo no es válido, favor corregir.");
		}
		
		if(isPerUsuarioExistente(correo)) {
			throw new ExcepcionUno("El correo ya está en uso.");
		}
		
		BCryptPasswordEncoder crypt = new BCryptPasswordEncoder();
		
		PerUsuario nuevoUsuario = new PerUsuario();
		nuevoUsuario.setActivo(false);
		
		nuevoUsuario.setIdUsuario(UUID.randomUUID().toString());
		nuevoUsuario.setClave(crypt.encode(clave));
		nuevoUsuario.setNombres(nombresApellidos);
		nuevoUsuario.setCorreo(correo);
		nuevoUsuario.setCodigoActivacion(UUID.randomUUID().toString());
		nuevoUsuario.setIrPerfil(true);
		
		SegRol segRol = segRolDao.findOne("USUARIO");
		nuevoUsuario.getRoles().add(segRol);
		
		try {
			nuevoUsuario = perUsuarioDao.save(nuevoUsuario);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
				
		notificarNuevaCuentaInactiva(nuevoUsuario);
		
		return nuevoUsuario;
	}

	private void notificarNuevaCuentaInactiva(PerUsuario nuevoUsuario) {
		String plantillaCorreo = servicioComun.getValorParametro("CORREO_NUEVA_CUENTA");
		
		if(!StringUtils.isBlank(plantillaCorreo)) {
			plantillaCorreo = plantillaCorreo.replace("{{CODIGO}}", nuevoUsuario.getCodigoActivacion());
			
			String asunto = servicioComun.getValorParametro("CORREO_NUEVA_CUENTA_ASUNTO");
			if(StringUtils.isBlank(asunto)) {
				asunto = "Activación de cuenta";
			}
			
			servicioNotificacion.notificar(asunto, plantillaCorreo, nuevoUsuario);
		}
	}
	
	@Override
	public boolean activarCuenta(String codigo) {

		if(StringUtils.isBlank(codigo)) {
			return false;
		}

		return perUsuarioDao.activarUsuarioPorCodigo(codigo)>0;
	}
	
	@Override
	public void recuperarClaveUsuario(String correo) {
		if(StringUtils.isBlank(correo)) {
			throw ExcepcionUno.campoRequerido("Correo");
		}
				
		if(!servicioComun.isEmailValido(correo)) {
			throw new ExcepcionUno("El correo no es válido, favor corregir.");
		}

		PerUsuario perUsuario = perUsuarioDao.buscarUsuarioPorCorreo(correo);
		
		if(perUsuario==null) {
			throw new ExcepcionUno("El usuario no existe o no está activo.");
		}
		
		if(!Boolean.TRUE.equals(perUsuario.getActivo())) {
			notificarNuevaCuentaInactiva(perUsuario);
			return;
		}
		
		BCryptPasswordEncoder crypt = new BCryptPasswordEncoder();
		
		char[] possibleCharacters = (new String("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%*.")).toCharArray();
		String nuevaClave = RandomStringUtils.random( 8, 0, possibleCharacters.length-1, false, false, possibleCharacters, new SecureRandom() );
		
		perUsuario.setClave(crypt.encode(nuevaClave));
		perUsuario.setIrPerfil(true);
		
		try {
			perUsuario = perUsuarioDao.save(perUsuario);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
		
		String plantillaCorreo = servicioComun.getValorParametro("CORREO_NUEVA_CONTRASENIA");
		
		if(!StringUtils.isBlank(plantillaCorreo)) {
			plantillaCorreo = plantillaCorreo.replace("{{CLAVE}}", nuevaClave);
			
			String asunto = servicioComun.getValorParametro("CORREO_NUEVA_CONTRASENIA_ASUNTO");
			if(StringUtils.isBlank(asunto)) {
				asunto = "Nueva contraseña";
			}
			
			servicioNotificacion.notificar(asunto, plantillaCorreo, perUsuario);
		}
		
	}
	
	@Override
	public void marcarPerfilVisitado(PerUsuario perUsuario) {
		perUsuario.setIrPerfil(false);
		perUsuarioDao.save(perUsuario);
	}
	
	@Override
	public List<PerUsuario> listarTecnicos(){
		return perUsuarioDao.listarUsuariosPorRol(Rol.TECNICO.name());
	}
	
	@Override
	public List<PerUsuario> listarAdministradoresTecnicos(){
		return perUsuarioDao.listarUsuariosPorRol(Rol.ADMIN_TECNICO.name());
	}	
	
	@Override
	public Page<VwProveedor> listarProveedoresPorRol(String rol, Pageable pagina, String filtro) {
		Page<VwProveedor> resultado = null;
		
		// SOLO MOSTRAR LOS ACTIVOS Y SEGÚN EL ROL
		Specification<VwProveedor> filtroBase = new Specification<VwProveedor>(){
			@Override
			public Predicate toPredicate(Root<VwProveedor> root	, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new LinkedList<>();
				predicates.add(cb.equal(root.get(VwProveedor_.activo), true));
				predicates.add(cb.equal(root.get(VwProveedor_.rol), rol.toUpperCase()));
				return cb.and(predicates.toArray(new Predicate[0]));
			}
		};
		
		Specification<VwProveedor> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<VwProveedor>() {
	
				@Override
				public Predicate toPredicate(Root<VwProveedor> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					predicates.add(cb.like(cb.upper(root.get(VwProveedor_.idUsuario)), filtroSql));
					predicates.add(cb.like(cb.upper(root.get(VwProveedor_.nombres)), filtroSql));
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}	
			};
		}
		
		resultado = vwProveedorDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		
		return resultado;
	}
		
	
	/** Fin: PerUsuario **/
}
