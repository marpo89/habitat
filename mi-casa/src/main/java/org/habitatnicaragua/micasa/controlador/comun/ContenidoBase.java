package org.habitatnicaragua.micasa.controlador.comun;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.CmsNodo;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.springframework.web.util.HtmlUtils;

import lombok.Getter;

@Getter
public abstract class ContenidoBase extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioContenido servicioContenido;

	protected String titulo = null;
	protected String enlaces = null;
	
	protected CmsNodo cmsNodo = null;
	protected List<CmsArchivo> archivos = null;
	protected CmsArchivo archivo = null;
	
	private String nombreEnlaceNodo;
	
	public ContenidoBase(String nombreEnlaceNodo) {
		this.nombreEnlaceNodo = nombreEnlaceNodo;
	}
	
	@PostConstruct
	public void init() {
		Long a = getLongRequestParameter("a");
		
		cmsNodo = servicioContenido.buscarNodoDeSistema(nombreEnlaceNodo);
		archivos = servicioContenido.listarArchivosPorNodo(cmsNodo);
		
		archivo = seleccionarArchivoPorId(a, archivos);
	}
	
	public String getTitulo() {
		if(titulo==null && archivo!=null) {
			if(Boolean.TRUE.equals(archivo.getVisibleTituloPagina())) {
				titulo = archivo.getTitulo();
			} else {
				titulo = "";
			}
		}
		
		return titulo;
	}
	
	public String getEnlacesSistema(String url) {
		CmsNodo cmsNodo = servicioContenido.buscarNodoDeSistema(url);
		
		return getEnlacesSistema(servicioContenido.listarArchivosPorNodo(cmsNodo));
	}
	
	public String getEnlacesSistema(List<CmsArchivo> archivos) {
	
			StringBuilder sb = new StringBuilder();
			
			sb.append("<div class='list-group'>");
			
			for(CmsArchivo archivo : archivos) {
				
				sb.append(String.format("<a href='%s' class='list-group-item'>", archivo.getEnlaceWeb()));
				sb.append(String.format("<h4 class='list-group-item-heading'>%s</h4>", HtmlUtils.htmlEscape(archivo.getTitulo())));
				
				if(!StringUtils.isBlank(archivo.getComentario())) {
					sb.append(String.format("<p class='list-group-item-text'>%s</p>", HtmlUtils.htmlEscape(archivo.getComentario())));
				}
				
				sb.append("</a>"); 
			}
			
			sb.append("</div>");
			
			return sb.toString();
	}
	
	public String getListadoEnlacesLateral(List<CmsArchivo> archivos, RenderEnlace renderEnlace) {
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("<div class='list-group'>");
		
		for(CmsArchivo archivo : archivos) {
			
			sb.append(String.format("<a href='%s' class='list-group-item'>", renderEnlace.render(archivo)));
			sb.append(String.format("<div class='list-group-item-heading'>%s</div>", HtmlUtils.htmlEscape(archivo.getTitulo())));
			
			if(!StringUtils.isBlank(archivo.getComentario())) {
				sb.append(String.format("<p class='list-group-item-text'>%s</p>", HtmlUtils.htmlEscape(archivo.getComentario())));
			}
			
			sb.append("</a>"); 
		}
		
		sb.append("</div>");
		
		return sb.toString();
	}
	
	public static interface RenderEnlace {
		String render(CmsArchivo archivo);
	}
	
	public abstract RenderEnlace getRenderEnlaceInstance();
	
	public String getEnlaces() {
		if(enlaces==null) {
			enlaces =  getListadoEnlacesLateral(archivos, getRenderEnlaceInstance());
		}
		return enlaces;
	}
	
	public CmsArchivo seleccionarArchivoPorId(Long idArchivo, List<CmsArchivo> archivos) {
		CmsArchivo archivo = null;
		
		if(idArchivo==null) {
			if(archivos!=null && archivos.size()>0) {
				archivo = archivos.get(0);
			}
		} else {
			for(CmsArchivo ai:archivos) {
				if(idArchivo.equals(ai.getIdArchivo())) {
					archivo = ai;
					break;
				}
			}
			if(archivo==null) {
				archivo = archivos.get(0);
			}
		}
		
		return archivo;
	}
	

	public boolean isRenderYoutube() {
		if(archivo!=null && archivo.isArchivoTipoYoutube()) {
			return true;
		}
		
		return false;
	}
	
	public boolean isRenderInfografia() {
		if(archivo!=null && archivo.isArchivoTipoGrafico()) {
			return true;
		}
		
		return false;
	}
}
