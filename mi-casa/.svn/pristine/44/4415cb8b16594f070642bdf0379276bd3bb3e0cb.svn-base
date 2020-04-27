package org.habitatnicaragua.micasa.controlador.publico;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.modelo.PubPublicidad;
import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.habitatnicaragua.micasa.servicio.ServicioPublicidad;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("publicidadControlador")
@RequestMapping("/enlazar")
public class PublicidadControlador extends ContextoUno {
	private static final long serialVersionUID = 1L;

	@Inject
	private ServicioPublicidad servicioPublicidad;
	
	@Inject
	private ServicioComun servicioComun;
	
	@RequestMapping(value="/d4d1c1l8up/{idPublicidad}", method=RequestMethod.GET)
	public void enlazarPublicidad(HttpServletRequest request, HttpServletResponse response, @PathVariable("idPublicidad") Long idPublicidad) {
		PubPublicidad pubPublicidad = servicioPublicidad.buscarPubPublicidadPorId(idPublicidad);
		
		if(pubPublicidad!=null) {
			servicioPublicidad.contarClick(pubPublicidad);
			
			String enlace = pubPublicidad.getEnlace();
			
			if(!StringUtils.isBlank(enlace)) {
				
				if(!enlace.startsWith("http")) {
					enlace = "http://" + enlace;
				}
				
				if(servicioComun.isURLValida(enlace)){					
					irA(response, enlace);
					return;
				}
			}
		}
		
		irA(response, request.getContextPath() + "/index.xhtml");
	}
}
