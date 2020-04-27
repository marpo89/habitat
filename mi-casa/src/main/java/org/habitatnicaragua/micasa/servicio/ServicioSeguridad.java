package org.habitatnicaragua.micasa.servicio;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.PerDireccion;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.modelo.SegLogin;
import org.habitatnicaragua.micasa.modelo.SegRol;
import org.habitatnicaragua.micasa.modelo.VwActividadUsuarioNivel2;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ServicioSeguridad {
	
	/** Inicio: PerUsuario **/
	// Maestro
	@PreAuthorize("hasAnyRole('ADMIN')")
	PerUsuario buscarPerUsuarioPorId(String idUsuario);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	SegLogin buscarSegLoginPorCorreo(PerUsuario perUsuario);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	PerUsuario buscarPerUsuarioActivoPorUuid(String uuidUsuario);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	Page<PerUsuario> listarUsuarios(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	void eliminarUsuario(String idUsuario) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	PerUsuario guardarPerUsuario(PerUsuario segUsuario) throws ExcepcionUno;
	
	/** Fin: PerUsuario **/
	
	/** Inicio: SegRol **/
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	List<SegRol> listarRoles();
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	SegRol buscarRolePorNombre(Rol rol);
	
	/** Fin: SegRol **/
	
	/** Inicio: PerDireccion **/
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	List<PerDireccion> listarTodasDireccionesUsuario(String idPerUsuario);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'MATERIAL', 'FINANCIAMIENTO')")
	Page<PerDireccion> listarDireccionesPorUsuario(String idPerUsuario, Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'MATERIAL', 'FINANCIAMIENTO')")
	PerDireccion buscarPerDireccionPorId(Long idPerDireccion);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'MATERIAL', 'FINANCIAMIENTO')")
	void eliminarPerDireccion(Long idPerDireccion) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'MATERIAL', 'FINANCIAMIENTO')")
	PerDireccion guardarPerDireccion(PerDireccion perDireccion) throws ExcepcionUno;
	
	/** Fin: PerDireccion **/
	
	/** Inicio: SegLogin **/
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	Page<SegLogin> listarSegLogin(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	Page<VwActividadUsuarioNivel2> listarActividadUsuarioNivel2(Pageable pagina, String filtro);
	
	SegLogin guardarSegLogin(SegLogin segLogin) throws ExcepcionUno;
	
	/** Fin: SegLogin **/
	
}
