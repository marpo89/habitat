package org.habitatnicaragua.micasa.controlador.publico;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("bibliotecaVista")
@ViewScoped
@Getter
@Setter
public class BibliotecaVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioContenido servicioContenido;

	private CmsNodo cmsNodo;
	private Long idNodo = null;		
	
	@PostConstruct
	public void init() {
		idNodo = getLongRequestParameter("bib");
		
		if(idNodo!=null) {
			cmsNodo = servicioContenido.buscarCmsNodoPorId(idNodo);
			if(cmsNodo==null || !cmsNodo.isTipoFolderBiblioteca()) {
				cmsNodo = null;
				throw ExcepcionUno.parametroInvalido();
			}
		}
	}
	
	public String getTituloPaginaArchivos() {
		if(cmsNodo==null) return "";
		
		return cmsNodo.getTitulo();
	}
	
	public String getInfoRegistroActual() {
		if(cmsNodo==null) return "";
		
		return StringUtils.abbreviate(cmsNodo.getTitulo(), 20);
	}
	
}
