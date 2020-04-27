package org.habitatnicaragua.micasa.controlador.comun;

import javax.faces.bean.ViewScoped;
import javax.inject.Named;

import org.habitatnicaragua.micasa.modelo.CmsArchivo;

import lombok.Getter;

@Named("contenidoMaterial")
@ViewScoped
@Getter
public class ContenidoMaterial extends ContenidoBase {
	private static final long serialVersionUID = 1L;

	private RenderEnlace renderEnlace = null;
		
	public ContenidoMaterial() {
		super("/materiales/index.xhtml");
	}
	
	@Override
	public RenderEnlace getRenderEnlaceInstance() {
		if(renderEnlace==null) {
			renderEnlace = new RenderEnlace() {
				public String render(CmsArchivo archivo) {
					if(archivo.isArchivoTipoYoutube() || archivo.isArchivoTipoGrafico()) {
						return getServletContext().getContextPath() + "/materiales/index.xhtml?a=" + archivo.getIdArchivo();
					} else {
						return  archivo.getEnlaceWeb();
					}
				}
			};
		}
			
		return renderEnlace;
	}
}
