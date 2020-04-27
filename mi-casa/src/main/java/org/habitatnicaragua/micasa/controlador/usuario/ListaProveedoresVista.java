package org.habitatnicaragua.micasa.controlador.usuario;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;

import lombok.Getter;
import lombok.Setter;

@Named("listaProveedoresVista")
@ViewScoped
@Getter
@Setter
public class ListaProveedoresVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioContenido servicioContenido;
	
	private String rol = null;
			
	@PostConstruct
	public void init() {
		rol = getStringRequestParameter("rol");		
	}
	
	public String getTituloPagina() {
		if (rol != null) {
			switch (rol) {
			case "financiamiento":
				return "Instituciones financieras";
			case "material":
				return "Proveedores de materiales y mano de obra";
			}
		}
		return "Proveedores";
	}
	
}
