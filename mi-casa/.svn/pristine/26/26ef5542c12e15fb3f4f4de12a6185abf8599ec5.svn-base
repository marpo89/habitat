package org.habitatnicaragua.micasa.controlador.publico;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("videoYoutubeVista")
@ViewScoped
@Getter
@Setter
public class VideoYoutubeVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioContenido servicioContenido;
	
	private CmsArchivo archivo;
	
	private CmsArchivo archivoPrevio;
	private CmsArchivo archivoSiguiente;

	private List<CmsArchivo> archivosHermanos = null;
	
	@PostConstruct
	public void init() {
		
		Long idArchivo = getLongRequestParameter("a");
		
		if(idArchivo==null) {
			throw ExcepcionUno.parametroInvalido();
		}
		
		archivo = servicioContenido.buscarCmsArchivoPorId(idArchivo);
		
		if(archivo!=null && !archivo.isArchivoTipoYoutube()) {
			archivo=null;
		} else if(Boolean.TRUE!=archivo.getActivo() && !this.getUsuarioActual().isAdmin()) {
			archivo=null;
		} else {
			if(archivo.getNodo().isTipoEnlaces()) {
				archivosHermanos = servicioContenido.listarArchivosPorNodo(archivo.getNodo());
				
				int pos = archivosHermanos.indexOf(archivo);
				
				if(pos>=0) {
					if(pos - 1 >= 0) archivoPrevio = archivosHermanos.get(pos - 1);
					if(pos + 1 < archivosHermanos.size()) archivoSiguiente = archivosHermanos.get(pos + 1);
				}
			}
		}
	}
	
	public String getTituloPagina() {
		if(archivo==null) return "";
		
		return archivo.getTitulo();
	}
	
	public boolean isVisible() {
		return archivo!=null;
	}
	
	public String getEnlacePadre() {
		if(archivo==null) return "";
		
		return archivo.getNodo().getEnlaceWeb();
	}
	
	public String getTituloEnlacePadre() {
		if(archivo==null) return "";
		
		return StringUtils.abbreviate(archivo.getNodo().getTitulo(), 20);
	}
	
	public String getInfoRegistroActual() {
		if(archivo==null) return "";
		
		return StringUtils.abbreviate(archivo.getTitulo(), 20);
	}
}
