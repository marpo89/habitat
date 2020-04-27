package org.habitatnicaragua.micasa.controlador.usuario;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CalcParametros;
import org.habitatnicaragua.micasa.modelo.Calculadora;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.servicio.ServicioCalculadora;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.springframework.data.domain.Sort;

import lombok.Getter;
import lombok.Setter;

@Named("calculadoraVista")
@ViewScoped
@Getter
@Setter
public class CalculadoraVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioCalculadora servicioCalculadora;
	
	@Inject
	private ServicioSeguridad servicioSeguridad;
	
	private boolean modoEditarMaestro = true;
	private Long idCalculadora = null;
	private PerUsuario segUsuario = null;
	private String idPerUsuario = null;
	private Long idParametro = null;
	private Calculadora calculadora = null;	
	private double plazo = 0;
	private double tasaInteres = 0;
	private double monto = 0;
	public double cuota = 0;
	private Long idCatMaestro = null;
	//private List<String> entidadFinanc = null;
	private List<CatMaestro> listaFinancieras = null;
	private List<CatMaestro> listaSistemasAmort = null;
	private List<CatMaestro> listaParametros = null;
	private CalcParametros calcParametros = null;
	
	@PostConstruct
	public void init() {
		plazo = 0;
		tasaInteres = 0;
		
		monto = 0;
		idCatMaestro = getLongRequestParameter("idCatMaestro");
		
		idCalculadora = getLongRequestParameter("idCalculadora");
		if(idCalculadora==null) {
			calculadora = new Calculadora();
			modoEditarMaestro = false;
		} else {
			calculadora = servicioCalculadora.buscarCalculadoraPorId(idCalculadora);
			modoEditarMaestro = true;
		}	
		
		idPerUsuario = getStringRequestParameter("idPerUsuario");
		if(idPerUsuario==null) {
			segUsuario = new PerUsuario();
			modoEditarMaestro = false;
		} else {
			segUsuario = servicioSeguridad.buscarPerUsuarioPorId(idPerUsuario);
			modoEditarMaestro = true;
		}
		
		idParametro = getLongRequestParameter("idParametro");
		if(idParametro==null) {
			calcParametros = new CalcParametros();
		} else {
			calcParametros = servicioCalculadora.buscarCalcParametrosPorId(idParametro);
		}
	}
	
	public void getGuardarRegistro() {
		if (calculadora == null) {
			throw new ExcepcionUno("Debe indicar el registro.");
		}

		calculadora = servicioCalculadora.guardarCalculadora(calculadora);		
	}
	
	public void guardarRegistro() {
		if (calculadora == null) {
			throw new ExcepcionUno("Debe indicar el registro.");
		}

		calculadora = servicioCalculadora.guardarCalculadora(calculadora);		
	}
	
	public void guardarParametro() {
		if (calcParametros == null) {
			throw new ExcepcionUno("Debe indicar el registro.");
		}
		
		calcParametros.setIdCalculadora(calculadora);
		
		calcParametros = servicioCalculadora.guardarParametro(calcParametros);		
	}
	
	/*public void calcularCuota() {
		double tasaIntMensual = tasaInteres / 12 / 100;
		double numeroExponenciado = Math.pow((tasaIntMensual  + 1), plazo);
		cuota = monto * (tasaIntMensual * numeroExponenciado/(numeroExponenciado-1));
	}*/
	
	public void eliminarRegistro() {
		if (idCalculadora == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioCalculadora.eliminarCalculadora(idCalculadora);
	}
	
	public void eliminarParametro() {
		if (idParametro == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioCalculadora.eliminarParametro(idParametro);
	}
	
	public String getTituloPagina() {
		if(!modoEditarMaestro) return "Configurar Calculadora";
		
		if (idCalculadora == null)
			return "Editar Configuración";

		return "Editar Calculadora"; /* + idCalculadora */
	}
	
	public String getEnlaceUsuario() {
		return getHttpServletRequest().getContextPath() + "/usuario/usuarioForm.xhtml?idPerUsuario=" + idPerUsuario;
	}	
	
	public String getEnlaceListado() {
		String ruta;
		ruta = getHttpServletRequest().getContextPath() + "/usuario/confCalculadora.xhtml";
		return ruta;
	}
	
	/*
	public double getObtenerCuota()
	{
		double tasaIntMensual = tasaInteres / 12;
		double numeroExponenciado = Math.pow((tasaIntMensual  + 1), plazo);
		cuota = monto * (tasaIntMensual * numeroExponenciado/(numeroExponenciado-1));
		return cuota;
	}
	*/
	
	public String getDatosCalculadora() {
		return getHttpServletRequest().getContextPath() + "/financiamiento/calculadora.xhtml?cuota=" + cuota;
	}
	
	public String getInfoRegistroActual() {
		if(idCalculadora!=null) {
			return calculadora.getIdentificador().toString();
		}
		
		return "Nuevo";
	}
	
	public String getInfoParametroActual() {
		if(idParametro!=null) {
			return calcParametros.getIdentificador().toString();
		}
		
		return "Nuevo Parámetro";
	}
	
	public String getEnlaceCalculadora() {
		return getHttpServletRequest().getContextPath() + "/usuario/calculadoraForm.xhtml?idCalculadora=" + idCalculadora;
	}
	
	public List<CatMaestro> getListaFinancieras(){
		if(listaFinancieras==null) {
			listaFinancieras = servicioComun.listarCatalogosPorTipo("ID_FINANCIERA", new Sort(Sort.Direction.ASC, "orden"));
		}
		
		return listaFinancieras;
	}
	
	public List<CatMaestro> getListaSistemasAmort(){
		if(listaSistemasAmort==null) {
			listaSistemasAmort = servicioComun.listarCatalogosPorTipo("ID_SISTEMA_AMORTIZACION", new Sort(Sort.Direction.ASC, "orden"));
		}
		
		return listaSistemasAmort;
	}
	
	public List<CatMaestro> getListaParametros(){
		if(listaParametros==null) {
			listaParametros = servicioComun.listarCatalogosPorTipo("ID_PARAMETRO", new Sort(Sort.Direction.ASC, "orden"));
		}
		
		return listaParametros;
	}
	
	
}
