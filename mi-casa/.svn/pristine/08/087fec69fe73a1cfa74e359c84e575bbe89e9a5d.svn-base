package org.habitatnicaragua.micasa.controlador.usuario;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.PerCalificacion;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.dto.CalificacionPromedioDTO;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("perCalificacionVista")
@ViewScoped
@Getter
@Setter
public class PerCalificacionVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioPerfil servicioPerfil;
	
	@Inject
	private ServicioSeguridad servicioSeguridad;

	private String idProveedor = null;
	private PerUsuario proveedor = null;
	private PerCalificacion perCalificacion = null;
	private CalificacionPromedioDTO calificacionPromedio = null;	
	
	@PostConstruct
	public void init() {
        idProveedor = getStringRequestParameter("u");
        
        if(idProveedor==null) {
			throw ExcepcionUno.parametroInvalido();
		}
        
		proveedor = servicioSeguridad.buscarPerUsuarioActivoPorUuid(idProveedor);		
		if(proveedor==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		perCalificacion = new PerCalificacion();
		perCalificacion.setProveedor(proveedor);
	}
	
	public void guardarCalificacion() {	
		
		if (perCalificacion == null) {
			throw ExcepcionUno.objetoNull();
		}	

		servicioPerfil.guardarPerCalificacion(perCalificacion);	
		
		perCalificacion = new PerCalificacion();
		perCalificacion.setProveedor(proveedor);
		calificacionPromedio = null;
	}
	
	public String getEnlaceUsuario() {
		return getHttpServletRequest().getContextPath() + "/usuario/usuarioDetallesForm.xhtml?u=" + idProveedor;
	}
	
	public CalificacionPromedioDTO getCalificacionPromedio() {
		if(calificacionPromedio==null) {
			calificacionPromedio = servicioPerfil.getPromedioCalificacionPorProveedor(proveedor.getIdUsuario());
		}
		
		return calificacionPromedio;
	}
	
	public void eliminarCalificacion() {
		Long idCalificacion = this.getLongRequestParameter("idCalificacion");
		if (idCalificacion == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioPerfil.eliminarPerCalificacion(idCalificacion);
		
	}
	
}
