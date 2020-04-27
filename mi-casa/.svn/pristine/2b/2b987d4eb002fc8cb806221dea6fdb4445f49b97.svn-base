package org.habitatnicaragua.micasa.controlador.publico;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.jsoup.Jsoup;

import lombok.Getter;
import lombok.Setter;

@Named("paginaVista")
@ViewScoped
@Getter
@Setter
public class PaginaVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioContenido servicioContenido;

	private CmsNodo nodo;
	
	private CmsArchivo cmsArchivoEnlazado;
	
	private CmsArchivo archivoPrevio;
	private CmsArchivo archivoSiguiente;

	private List<CmsArchivo> archivosHermanos = null;
	
	@PostConstruct
	public void init() {
		
		Long idNodo = getLongRequestParameter("p");
		
		if(idNodo==null) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		nodo = servicioContenido.buscarCmsNodoPorId(idNodo);
		
		if(nodo!=null) {
			cmsArchivoEnlazado = servicioContenido.buscarArchivosTipoEnlacePorRuta(nodo.getEnlaceWeb());
			if(cmsArchivoEnlazado!=null && cmsArchivoEnlazado.getNodo().isTipoEnlaces()) {
				archivosHermanos = servicioContenido.listarArchivosPorNodo(cmsArchivoEnlazado.getNodo());
				
				int pos = archivosHermanos.indexOf(cmsArchivoEnlazado);
				
				if(pos>=0) {
					if(pos - 1 >= 0) archivoPrevio = archivosHermanos.get(pos - 1);
					if(pos + 1 < archivosHermanos.size()) archivoSiguiente = archivosHermanos.get(pos + 1);
				}
			}
		}
	}
	
	public String getTituloPagina() {
		if(nodo==null) return "";
		
		return Jsoup.parse(nodo.getTitulo()).text();
	}
	
	public boolean isVisible() {
		return nodo!=null;
	}
}
