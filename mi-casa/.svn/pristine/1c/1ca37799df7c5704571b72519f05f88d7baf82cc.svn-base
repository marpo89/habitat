package org.habitatnicaragua.micasa.controlador.gestion;

import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.OftCupon;
import org.habitatnicaragua.micasa.servicio.ServicioOferta;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("validarOfertasVista")
@ViewScoped
@Getter
@Setter
public class ValidarOfertasVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioOferta servicioOferta;

	@Inject
	private ServicioPerfil servicioPerfil;

	private String codigoCuponOferta;
	private OftCupon oftCupon;
	
	public void validarOferta() {
		oftCupon = null;
		
		if (codigoCuponOferta == null) {
			throw ExcepcionUno.objetoNull();
		}

		oftCupon = servicioOferta.validarOferta(codigoCuponOferta);	
	}
	
	public boolean isCuponEncontrado() {
		return !StringUtils.isBlank(codigoCuponOferta) && oftCupon!=null;
	}
	
	public void utilizarCupon() {
		if (oftCupon!=null) {
			oftCupon = servicioOferta.utilizarOferta(oftCupon);
		}
	}	
	
	public boolean isDetalleCuponVisible() {
		return !StringUtils.isBlank(codigoCuponOferta);
	}
	
	public boolean isCuponUtilizado() {
		return isCuponEncontrado() && Boolean.TRUE.equals(oftCupon.getUtilizado());
	}
	
}
