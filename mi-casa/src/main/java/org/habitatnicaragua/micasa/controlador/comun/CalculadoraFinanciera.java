package org.habitatnicaragua.micasa.controlador.comun;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.Calculo;
import org.omnifaces.util.Ajax;

import lombok.Getter;
import lombok.Setter;

@Named("calculadoraFinanciera")
@ViewScoped
@Getter
@Setter
public class CalculadoraFinanciera extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	private Calculo calculo = null;	
	private boolean modoEditarMaestro = true;
	
	@PostConstruct
	public void init() {
		
		if(calculo==null) {
			calculo = new Calculo();
			modoEditarMaestro = false;
		} else {
			modoEditarMaestro = true;
		}	
	}
	
	public void calcularCuota() {
		double tasaIntMensual = calculo.getTasaInteres() / 12 / 100;
		double numeroExponenciado = Math.pow((tasaIntMensual  + 1), calculo.getPlazo());
		double resultado;
		resultado = Math.round(calculo.getMonto() * (tasaIntMensual * numeroExponenciado/(numeroExponenciado-1)));
		calculo.setCuota(resultado);
		
		Ajax.update("frm-filaDatosCalculadora");
	}
	
	public String getTituloPagina() {
		if(!modoEditarMaestro) return "Calcular Cuota";

		return "Editar Cálculo"; /* + idCalculadora */
	}
	
	public String getEnlaceListado() {
		String ruta;
		ruta = getHttpServletRequest().getContextPath() + "/financiamiento/index.xhtml";
		return ruta;
	}
}
