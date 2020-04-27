package org.habitatnicaragua.micasa.controlador.gestion;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CmsContenidoNivel2;
import org.habitatnicaragua.micasa.servicio.ServicioContenidoNivel2;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.model.UploadedFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.Getter;
import lombok.Setter;

@Named("contenidoNivel2Vista")
@ViewScoped
@Getter
@Setter
public class ContenidoNivel2Vista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = LoggerFactory.getLogger(ContenidoNivel2Vista.class);

	@Inject
	private ServicioPerfil servicioPerfil;
	
	@Inject
	private ServicioContenidoNivel2 servicioContenidoNivel2;
	
	private boolean modoEditarMaestro = true;
	private Long idContenido = null;
	private CmsContenidoNivel2 cmsContenidoNivel2 = null;

	private UploadedFile archivo;
	
	private boolean removerArchivo = false;
	
	private Boolean mostrarColumnaDuenio = null;

	@PostConstruct
	public void init() {
		
		if(StringUtils.isBlank(getIdUsuarioActual())) {
			try {
				getExternalContext().redirect("/");
			} catch (IOException e) {
				LOGGER.error(e.getMessage(), e);
			}
			return;
		}
		
		idContenido = getLongRequestParameter("idContenido");
		if (idContenido == null) {
			cmsContenidoNivel2 = new CmsContenidoNivel2();
			modoEditarMaestro = false;
		} else {
			cmsContenidoNivel2 = servicioContenidoNivel2.buscarCmsContenidoNivel2PorId(idContenido);
			modoEditarMaestro = true;
			
			if(!servicioContenidoNivel2.isContenidoNivel2Editable(cmsContenidoNivel2)) {
				cmsContenidoNivel2 = null;
				modoEditarMaestro = false;
				throw ExcepcionUno.permisoDenegado();
			}
		}
	}

	public String getTituloPagina() {
		if (idContenido == null)
			return "Nuevo Contenido";

		return "Editar Contenido #" + idContenido;
	}
	
	public String getInfoRegistroActual() {
		if (idContenido != null) {
			return cmsContenidoNivel2.getIdentificador().toString();
		}

		return "Nuevo";
	}
	
	public void guardarRegistro() {
		if (cmsContenidoNivel2 == null) {
			throw ExcepcionUno.objetoNull();
		}

		if(removerArchivo) {
			servicioContenidoNivel2.removerArchivoCmsContenidoNivel2(cmsContenidoNivel2, removerArchivo);
		}
		
		cmsContenidoNivel2 = servicioContenidoNivel2.guardarCmsContenidoNivel2(cmsContenidoNivel2, archivo);
	}

	
}
