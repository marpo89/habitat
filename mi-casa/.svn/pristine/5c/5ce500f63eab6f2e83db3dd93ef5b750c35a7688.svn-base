package org.habitatnicaragua.micasa.controlador.admin;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.model.UploadedFile;

import lombok.Getter;
import lombok.Setter;

@Named("nodosVista")
@ViewScoped
@Getter
@Setter
public class NodosVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioContenido servicioContenido;
	
	private boolean modoEditarMaestro = true;
	private Long idNodo = null;		
	private CmsNodo cmsNodo = null;
	private List<CatMaestro> listaTiposNodo = null;
	
	private Long idArchivo = null;
	private CmsArchivo cmsArchivo = null;
	private List<CatMaestro> listaTiposArchivo = null;
	
	private UploadedFile archivoSubido;
	private UploadedFile videoSubido;
	
	@PostConstruct
	public void init() {

		idNodo = getLongRequestParameter("idNodo");
		
		if(idNodo==null) {
			cmsNodo = new CmsNodo();
			modoEditarMaestro = false;
		} else {
			cmsNodo = servicioContenido.buscarCmsNodoPorId(idNodo);
			modoEditarMaestro = true;
		}
		
		if (modoEditarMaestro == true ) {
			idArchivo = getLongRequestParameter("idArchivo");		
			if(idArchivo==null) {
				cmsArchivo = new CmsArchivo();
			} else {
				cmsArchivo = servicioContenido.buscarCmsArchivoPorId(idArchivo);
			}
		}
	}
	
	public void eliminarRegistro() {
		if (idNodo == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioContenido.eliminarCmsNodo(idNodo);
	}
	
	public void eliminarRegistroArchivo() {
		if (idArchivo == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioContenido.eliminarCmsArchivo(idArchivo);
	}
	
	public void guardarRegistro() {
		if (cmsNodo == null) {
			throw ExcepcionUno.objetoNull();
		}
		cmsNodo = servicioContenido.guardarCmsNodo(cmsNodo);
	}
	
	public void guardarRegistroArchivo() {
		if (cmsArchivo == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		cmsArchivo.setNodo(cmsNodo);
		
		cmsArchivo = servicioContenido.subirCmsArchivo(cmsArchivo, archivoSubido!=null && archivoSubido.getSize()>0?archivoSubido:videoSubido);
	}
	
	public String getEnlaceListado() {
		return getHttpServletRequest().getContextPath() + "/admin/contenidos.xhtml";
	}
	
	public String getEnlaceListadoContenido() {
		return getHttpServletRequest().getContextPath() + "/admin/contenidoForm.xhtml?idNodo="+idNodo;
	}
	
	public String getTituloPagina() {
		if(!modoEditarMaestro) return "Contenido";
		
		if(idNodo==null) return "Nuevo Contenido";
		
		return "Editar Contenido";
	}
	
	public String getTituloPaginaArchivo() {
		if(!modoEditarMaestro) return "Archivo";
		
		if(idNodo==null) return "Nuevo Archivo";
		
		return "Editar Archivo";
	}
	
	public String getInfoRegistroActual() {
		if(cmsNodo!=null) {
			return cmsNodo.getTitulo();
		}
		
		return "Nuevo";
	}
	
	public String getInfoRegistroActualArchivo() {
		if(cmsNodo!=null) {
			return cmsArchivo.getTitulo();
		}
		
		return "Nuevo";
	}
	
	public List<CatMaestro> getListaTiposNodo(){
		if(listaTiposNodo==null) {
			listaTiposNodo = servicioComun.listarCatalogosPorTipo("ID_CMS_TIPO_NODO");
		}
		
		return listaTiposNodo;
	}
	
	public List<CatMaestro> getListaTiposArchivo(){
		if(listaTiposArchivo==null) {
			listaTiposArchivo = servicioComun.listarCatalogosPorTipo("ID_CMS_TIPO_ARCHIVO");
		}
		
		return listaTiposArchivo;
	}
}
