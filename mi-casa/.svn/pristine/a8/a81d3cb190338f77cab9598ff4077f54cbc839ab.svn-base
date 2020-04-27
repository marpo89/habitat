package org.habitatnicaragua.micasa.controlador.gestion;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.OftOferta;
import org.habitatnicaragua.micasa.servicio.ServicioOferta;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.primefaces.model.UploadedFile;

import lombok.Getter;
import lombok.Setter;

@Named("ofertasVista")
@ViewScoped
@Getter
@Setter
public class OfertasVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioOferta servicioOferta;

	@Inject
	private ServicioPerfil servicioPerfil;
	
	private boolean modoEditarMaestro = true;
	private Long idOferta = null;
	private OftOferta oftOferta = null;

	private UploadedFile archivo1;
	private UploadedFile archivo2;
	private UploadedFile archivo3;
	
	private boolean removerArchivo1 = false;
	private boolean removerArchivo2 = false;
	private boolean removerArchivo3 = false;
	
	private Boolean mostrarColumnaDuenio = null;
	
	@PostConstruct
	public void init() {
		idOferta = getLongRequestParameter("idOferta");
		if (idOferta == null) {
			oftOferta = new OftOferta();
			modoEditarMaestro = false;
		} else {
			oftOferta = servicioOferta.buscarOftOfertaPorId(idOferta);
			modoEditarMaestro = true;
			
			if(!servicioOferta.isOfertaEditable(oftOferta)) {
				oftOferta = null;
				modoEditarMaestro = false;
				throw ExcepcionUno.permisoDenegado();
			}
		}
	}

	public void eliminarRegistro() {
		if (idOferta == null) {
			throw ExcepcionUno.objetoNull();
		}
		
		servicioOferta.eliminarOftOferta(idOferta);
	}

	public void guardarRegistro() {
		if (oftOferta == null) {
			throw ExcepcionUno.objetoNull();
		}

		if(removerArchivo1 || removerArchivo2 || removerArchivo3) {
			servicioOferta.removerArchivosOftOferta(oftOferta, removerArchivo1, removerArchivo2, removerArchivo3);
		}
		
		oftOferta = servicioOferta.guardarOftOferta(oftOferta, archivo1, archivo2, archivo3);
	}

	public String getTituloPagina() {
		if (idOferta == null)
			return "Nueva Oferta";

		return "Editar Oferta #" + idOferta;
	}

	public String getEnlaceListado() {
		return getHttpServletRequest().getContextPath() + "/gestion/ofertas.xhtml";
	}
	
	public String getInfoRegistroActual() {
		if (idOferta != null) {
			return oftOferta.getIdentificador().toString();
		}

		return "Nuevo";
	}

	public boolean isMostrarColumnaDuenio() {
		if(mostrarColumnaDuenio==null) {
			mostrarColumnaDuenio=servicioPerfil.getUsuarioActual().isAdmin();
		}
		
		return mostrarColumnaDuenio;
	}
	
	public boolean getMostrarColumnaDuenio() {
		return isMostrarColumnaDuenio();
	}
}
