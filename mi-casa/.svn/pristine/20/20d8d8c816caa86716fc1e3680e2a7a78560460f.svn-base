package org.habitatnicaragua.micasa.controlador.usuario;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.modelo.PerDireccion;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("misDireccionesVista")
@ViewScoped
@Getter
@Setter
public class MisDireccionesVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	private boolean modoEditarMaestro = true;
	private Long idDireccion = null;		
	private PerDireccion perDireccion = null;	
	
	private List<CatMaestro> listaLocalidades = null;
	
	@PostConstruct
	public void init() {
		
		idDireccion = getLongRequestParameter("idDireccion");
		if(idDireccion==null) {
			Double lat = getDoubleRequestParameter("lat");
			Double lng = getDoubleRequestParameter("lng");
			
			perDireccion = new PerDireccion();
			perDireccion.setUsuario(servicioPerfil.getUsuarioActual());
			perDireccion.setLatitud(lat);
			perDireccion.setLongitud(lng);
			modoEditarMaestro = false;
		} else {
			perDireccion = servicioSeguridad.buscarPerDireccionPorId(idDireccion);
			modoEditarMaestro = true;
		}		
	}
	
	public void eliminarRegistro() {
		if (idDireccion == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioSeguridad.eliminarPerDireccion(idDireccion);
	}
	
	public void guardarRegistro() {
		if (perDireccion == null) {
			throw ExcepcionUno.objetoNull();
		}

		perDireccion = servicioSeguridad.guardarPerDireccion(perDireccion);		
	}
	
	public String getTituloPagina() {
		if(!modoEditarMaestro) return "Direcciones";
		
		if(idDireccion==null) return "Nueva dirección";
		
		return "Editar dirección";
	}
	
	public List<CatMaestro> getListaLocalidades(){
		if(listaLocalidades==null) {
			listaLocalidades = servicioComun.listarCatalogosPorTipo("ID_LOCALIDAD");
		}
		
		return listaLocalidades;
	}
	
	public String getInfoDireccionActual() {
		if(idDireccion!=null) {
			return perDireccion.getIdentificador().toString();
		}
		
		return "Nueva Dirección";
	}
}
