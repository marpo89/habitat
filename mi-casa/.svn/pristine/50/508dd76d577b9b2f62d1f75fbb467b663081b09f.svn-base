package org.habitatnicaragua.micasa.controlador.admin;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.modelo.PubPublicidad;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.servicio.ServicioPublicidad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.model.UploadedFile;

import lombok.Getter;
import lombok.Setter;

@Named("publicidadVista")
@ViewScoped
@Getter
@Setter
public class PublicidadVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioPublicidad servicioPublicidad;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	private Long idPublicidad = null;
	private PubPublicidad pubPublicidad = null;
	private boolean modoEditarMaestro = true;
	
	private List<CatMaestro> ubicacionesPublicidad = null;	

	private UploadedFile archivo1;
	private UploadedFile archivo2;
	private UploadedFile archivo3;
	
	private boolean removerArchivo1 = false;
	private boolean removerArchivo2 = false;
	private boolean removerArchivo3 = false;
	
	@PostConstruct
	public void init() {
		idPublicidad = getLongRequestParameter("idPublicidad");
		
		if(idPublicidad==null) {
			pubPublicidad = new PubPublicidad();
			modoEditarMaestro = false;
		} else {
			pubPublicidad = servicioPublicidad.buscarPubPublicidadPorId(idPublicidad);
			modoEditarMaestro = true;
		}
	}
		
	public String getTituloPagina() {
		if(!modoEditarMaestro) return "Publicidad";
		
		if(idPublicidad==null) return "Nueva Publicidad";
		
		return "Editar Publicidad";
	}
	
	public String getEnlaceListado() {
		return getHttpServletRequest().getContextPath() + "/admin/publicidad.xhtml";
	}
	
	public String getInfoRegistroActual() {
		if(idPublicidad!=null) {
			return pubPublicidad.getIdentificador().toString();
		}
		
		return "Nuevo";
	}	
	
	public void eliminarRegistro() {
		if (idPublicidad == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioPublicidad.eliminarPubPublicidad(idPublicidad);
	}
	
	public void guardarRegistro() {
		if (pubPublicidad == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		if(removerArchivo1 || removerArchivo2 || removerArchivo3) {
			servicioPublicidad.removerArchivosPubPublicidad(pubPublicidad, removerArchivo1, removerArchivo2, removerArchivo3);
		}
		
		pubPublicidad = servicioPublicidad.guardarPubPublicidad(pubPublicidad, archivo1, archivo2, archivo3);		
	}
	
	public List<CatMaestro> getUbicacionesPublicidad(){
		if(ubicacionesPublicidad==null) {
			ubicacionesPublicidad = servicioComun.listarCatalogosPorTipo("ID_UBICACION_PUBLICIDAD");
		}
		
		return ubicacionesPublicidad;
	}
	
}
