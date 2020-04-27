package org.habitatnicaragua.micasa.controlador.comun;

import java.io.Serializable;
import java.util.List;

import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;

import lombok.Getter;

@Named("contenidoPortadaVista")
@ViewScoped
@Getter
public class ContenidoPortadaVista implements Serializable {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioComun servicioComun;

	@Inject
	private ServicioContenido servicioContenido;

	private String videoPortada = null;
	private String tituloPortada = null;
		
	public String getTituloPortada() {
		if(tituloPortada==null) {
			cargarDatosPortada();
		}
		
		return tituloPortada;
	}
	
	public String getVideoPortada() {
		if(videoPortada==null) {
			cargarDatosPortada();
		}
		
		return videoPortada;
	}
	
	private synchronized void cargarDatosPortada() {
		if(videoPortada==null || tituloPortada==null) {
			CmsNodo cmsNodo = servicioContenido.buscarNodoDeSistema("/index.xhtml");
			tituloPortada = cmsNodo.getTitulo();
			List<CmsArchivo> archivos = servicioContenido.listarArchivosPorNodo(cmsNodo);
			for(CmsArchivo archivo : archivos) {
				if(!StringUtils.isBlank(archivo.getYoutube())) {
					videoPortada = archivo.getYoutube();
					return;
				}
			}
			videoPortada = "";
		}
	}
}
