package org.habitatnicaragua.micasa.servicio;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.PerCalificacion;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.modelo.VwProveedor;
import org.habitatnicaragua.micasa.modelo.dto.PerCalificacionDTO;
import org.habitatnicaragua.micasa.modelo.dto.CalificacionPromedioDTO;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ServicioPerfil {
	
	/** Inicio: PerCalificacion **/	
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	PerCalificacion buscarPerCalificacionPorId(Long idCalificacion);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	Page<PerCalificacionDTO> listarPerCalificacion(Pageable pagina, String idProveedor);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	void eliminarPerCalificacion(Long idCalificacion) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	PerCalificacion guardarPerCalificacion(PerCalificacion idCalificacion) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	CalificacionPromedioDTO getPromedioCalificacionPorProveedor(String idUsuario);
	
	/** Fin: PerCalificacion **/
	
	
	/** Inicio: PerUsuario **/

	PerUsuario getUsuarioActual();
	
	String getIdUsuarioActual();
	
	boolean isUsuarioActualMiembroRol(String rol);
	
	boolean isUsuarioActualMiembroRol(Rol rol);
	
	boolean isUsuarioActualMiembroRol(Rol... roles);
	
	boolean isPerUsuarioExistente(String idPerUsuario);
	
	boolean isUsuarioMiembroRol(PerUsuario usuario, Rol... roles);
	
	PerUsuario crearNuevaCuentaAutoRegistro(String correo, String clave, String nombresApellidos);
	
	boolean activarCuenta(String codigo);
		
	void recuperarClaveUsuario(String correo);
	
	void marcarPerfilVisitado(PerUsuario perUsuario);
	
	@PreAuthorize("hasAnyRole('ADMIN','ADMIN_TECNICO')")
	List<PerUsuario> listarTecnicos();
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	public List<PerUsuario> listarAdministradoresTecnicos();
	
	/** Fin: PerUsuario **/
	
	/** Inicio: VwProveedores **/
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	Page<VwProveedor> listarProveedoresPorRol(String rol, Pageable pagina, String filtro);
	

}
