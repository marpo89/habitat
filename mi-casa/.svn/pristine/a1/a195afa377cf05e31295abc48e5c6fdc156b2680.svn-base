package org.habitatnicaragua.micasa.controlador.publico;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("validacionHttps")
@RequestMapping("/.well-known")
public class ValidacionHttps {

	@Inject
	private ServicioComun servicioComun;
	
	@RequestMapping(value="/pki-validation/gsdv.txt", method=RequestMethod.GET)
	@ResponseBody
	public String validacionHttps(HttpServletRequest request) {
		
		String extraMetaName1 = servicioComun.getValorParametro("EXTRA_META_NAME_1");
		String extraMetaContent1 = servicioComun.getValorParametro("EXTRA_META_CONTENT_1");
		
		return "<meta name=\"" + extraMetaName1 + "\" content=\"" + extraMetaContent1 + "\" />";
	}
	
}
