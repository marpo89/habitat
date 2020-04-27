package org.habitatnicaragua.micasa.seguridad;

import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControlarError extends ControladorBaseUno implements ErrorController  {
 	private static final long serialVersionUID = 1L;

	@RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
    	
    	Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
    	Throwable exception = (Exception) request.getAttribute("javax.servlet.error.exception");

    	String message = "";
    	Object messageObj = request.getAttribute("javax.servlet.error.message");
    	if(messageObj instanceof String) {
    		message = (String)messageObj;
    	}
    	
    	Throwable exceptionOriginal = getCausaOriginal(exception);
    	
    	if(exceptionOriginal!=null && exceptionOriginal instanceof ExcepcionUno) {
    		request.setAttribute("message", exceptionOriginal.getMessage());
    	} else {
    		request.setAttribute("message", message);
    	}
    	
    	request.setAttribute("exception", exceptionOriginal);
    	request.setAttribute("status", statusCode);
    	
    	if(statusCode==403) {
    		return "/publico/403.xhtml";
    	}
    	
    	if(statusCode==404) {
    		return "/publico/404.xhtml";
    	}
    	
    	return "/publico/error.xhtml";
    }
 
    @Override
    public String getErrorPath() {
        return "/error";
    }
}
