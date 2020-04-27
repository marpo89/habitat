package org.habitatnicaragua.micasa.controlador.usuario;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.OftCupon;
import org.habitatnicaragua.micasa.modelo.VwOferta;
import org.habitatnicaragua.micasa.servicio.ServicioOferta;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.omnifaces.util.Ajax;

import lombok.Getter;
import lombok.Setter;

@Named("detalleOfertaVista")
@ViewScoped
@Getter
@Setter
public class DetalleOfertaVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioOferta servicioOferta;
	
	private Long idOferta = null;
	private VwOferta oferta = null;
	private OftCupon oftCuponUsuarioActual = null;
	
	private String condiciones = null;
	
	private boolean primerActivoEncontrado = false;
	private Boolean botonCuponVisible = null;
	private Boolean cuponVisible = null;
	private Boolean botonIrLoginVisible = null;
	
	@PostConstruct
	public void init() {
		idOferta = getLongRequestParameter("u");
		
		if(idOferta==null) {
			throw ExcepcionUno.parametroInvalido();
		} else {
			oferta = servicioOferta.buscarDetalleOfertaPorId(idOferta);
		}
		
		if(oferta==null) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		recargarInfoCuponActual();
	}
	
	private void recargarInfoCuponActual() {
		primerActivoEncontrado = false;
		botonCuponVisible = null;
		cuponVisible = null;
		botonIrLoginVisible = null;
		
		oftCuponUsuarioActual = servicioOferta.buscarCuponPorUsuarioOferta(oferta.getIdOferta(), getUsuarioActual());
	}
	
	public String getCondiciones() {
		if(condiciones==null) {
			condiciones = servicioComun.getValorParametro("CONDICIONES_TOMAR_OFERTA");
		}
		
		return condiciones;
	}
	
	public boolean isBotonCuponVisible() {
		if(botonCuponVisible==null) {
			botonCuponVisible=true;
			
			if(getUsuarioActual()==null) {
				botonCuponVisible=false;
			}
			
			if(oferta.getLimiteCantidad()>0 && oferta.getTomadas()>=oferta.getLimiteCantidad()) {
				botonCuponVisible=false;
			}
			
			if(oftCuponUsuarioActual!=null) {
				botonCuponVisible=false;
			}
		}
		
		return botonCuponVisible;
	}
	
	public Boolean getBotonCuponVisible() {
		return isBotonCuponVisible();
	}

	public boolean isBotonIrLoginVisible() {
		if(botonIrLoginVisible==null) {
			botonIrLoginVisible=false;
			
			if(getUsuarioActual()==null) {
				botonIrLoginVisible=true;
			}
			
		}
		
		return botonIrLoginVisible;
	}
	
	public Boolean getBotonIrLoginVisible() {
		return isBotonIrLoginVisible();
	}
	
	public boolean isCuponVisible() {
		if(cuponVisible==null) {
			cuponVisible=true;
			
			if(oftCuponUsuarioActual==null) {
				cuponVisible=false;
			}
		}
		
		return cuponVisible;
	}
	
	public Boolean getCuponVisible() {
		return isCuponVisible();
	}
	
	public void generarCupon() {	
		servicioOferta.generarCuponOferta(oferta.getIdOferta(), this.getUsuarioActual());
		
		recargarInfoCuponActual();
		
		Ajax.update("frm-filaDatosOferta");
	}
	
	public void borrarMiCupon() {	
		servicioOferta.borrarCuponOferta(oferta.getIdOferta(), this.getUsuarioActual());
		
		recargarInfoCuponActual();
		
		Ajax.update("frm-filaDatosOferta");
	}
	
	
	public String getActivoCarrusel() {
		if(primerActivoEncontrado==false) {
			primerActivoEncontrado=true;
			return "active";
		}
		
		return "";
	}
}
