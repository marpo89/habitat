package org.habitatnicaragua.micasa.controlador.admin;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("catalogosVista")
@ViewScoped
@Getter
@Setter
public class CatalogosVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioComun servicioComun;
	
	private boolean modoEditarMaestro = true;
	private Long idCatMaestro = null;		
	private CatMaestro catMaestro = null;	
	private List<String> tipoCatalogo = null;

	@PostConstruct
	public void init() {
		
		idCatMaestro = getLongRequestParameter("idCatMaestro");
		if(idCatMaestro==null) {
			catMaestro = new CatMaestro();
			modoEditarMaestro = false;
		} else {
			catMaestro = servicioComun.buscarCatMaestroPorId(idCatMaestro);
			modoEditarMaestro = true;
		}		
	}
	
	public void eliminarRegistro() {
		if (idCatMaestro == null) {
			throw new ExcepcionUno("Debe seleccionar un registro.");
		}

		servicioComun.eliminarCatMaestro(idCatMaestro);
	}
	
	public void guardarRegistro() {
		if (catMaestro == null) {
			throw new ExcepcionUno("Debe indicar el registro.");
		}

		catMaestro = servicioComun.guardarCatMaestro(catMaestro);		
	}
	
	public String getEnlaceListado() {
		return getHttpServletRequest().getContextPath() + "/admin/catalogos.xhtml";
	}
	
	public String getTituloPagina() {
		if(!modoEditarMaestro) return "Catálogos";
		
		if(idCatMaestro==null) return "Nuevo Catálogo";
		
		return "Editar Catálogo";
	}
	
	public List<String> getTipoCatalogo(){
		if(tipoCatalogo==null) {
			tipoCatalogo = servicioComun.listarTiposCatalogos();
		}
		
		return tipoCatalogo;
	}
	
	public String getInfoRegistroActual() {
		if(idCatMaestro!=null) {
			return catMaestro.getIdentificador().toString();
		}
		
		return "Nuevo";
	}
	
	
	
}
