package org.habitatnicaragua.micasa.controlador.comun;

import java.sql.Date;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.habitatnicaragua.micasa.util.FechasUno;
import org.omnifaces.util.Ajax;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;

/**
 * Util:
 * 
 * RequestContext requestContext = RequestContext.getCurrentInstance();
 * requestContext.addCallbackParam("x", "ddddd");
 *
 */
public abstract class ControladorBaseUno extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	protected ServicioComun servicioComun;
	
		
	public String getFechaVisibleUsuario(){
		Date fecha = servicioComun.getFechaSistema();
		
		return FechasUno.dfDiaHora.format(fecha);
	}
	
	public ContextoUno getContextoUno(){
    	return this;
    }
	
	public FacesContext getFacesContext(){
    	return FacesContext.getCurrentInstance();
    }
	
	public ExternalContext getExternalContext() {
        FacesContext fc = getFacesContext();
        return fc.getExternalContext();
    }
	
	public Map<String, String> getRequestParameterMap() {
		return getExternalContext().getRequestParameterMap();
	}
	
	public ServletContext getServletContext() {
		if(getExternalContext().getContext() instanceof ServletContext)
			return (ServletContext) getExternalContext().getContext();
		
		return null;
    }
    
	public HttpServletRequest getHttpServletRequest() {
		ExternalContext ec = getExternalContext();
    	
    	if(ec!=null){
    		Object request = ec.getRequest();
    		if(request instanceof HttpServletRequest)
    			return (HttpServletRequest)request;
    	}
    	
        return null;
    }
	
	public HttpServletResponse getHttpServletResponse() {
		ExternalContext ec = getExternalContext();
    	
    	if(ec!=null){
    		Object response = ec.getResponse();
    		if(response instanceof HttpServletResponse)
    			return (HttpServletResponse)response;
    	}
    	
        return null;
    }
	
    public HttpSession getHttpSession() {
    	ExternalContext ec = getExternalContext();
    	
    	if(ec!=null){
    		Object session = ec.getSession(true);
    		if(session instanceof HttpSession)
    			return (HttpSession)session;
    	}
    
    	return null;
    }
    	
	public Long getLongRequestParameter(String name) {
		try {
			return ServletRequestUtils.getLongParameter(getHttpServletRequest(), name);
		} catch (ServletRequestBindingException e) {
			return null;
		}
	}
	
	public Integer getIntegerRequestParameter(String name) {
		try {
			return ServletRequestUtils.getIntParameter(getHttpServletRequest(), name);
		} catch (ServletRequestBindingException e) {
			return null;
		}
	}
	
	public String getStringRequestParameter(String name) {
		try {
			return ServletRequestUtils.getStringParameter(getHttpServletRequest(), name);
		} catch (ServletRequestBindingException e) {
			return null;
		}
	}
	
	public Double getDoubleRequestParameter(String name) {
		try {
			return ServletRequestUtils.getDoubleParameter(getHttpServletRequest(), name);
		} catch (ServletRequestBindingException e) {
			return null;
		}
	}
	
	public void mostrarError(String mensaje){
		mensaje = StringUtils.replaceAll(mensaje, "\n", " ");
		FacesContext.getCurrentInstance().validationFailed();
		
		FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, mensaje, mensaje);
		FacesContext.getCurrentInstance().addMessage(null, msg);
		
		Ajax.update("frmMsg-global");
	}
	
	public void mostrarError(Throwable t){
		if(t==null) return;
		Throwable t2 = getCausaOriginal(t);
		
		if(t2!=null) {
			mostrarError(t2.getMessage());
		} else {
			mostrarError(t.getMessage());
		}
	}
	
	public Throwable getCausaOriginal(Throwable t){
		return ExcepcionUno.getCausaOriginal(t);
	}
	
	public void mostrarAdvertencia(String mensaje) {
		mensaje = StringUtils.replaceAll(mensaje, "\n", " ");
		FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_WARN, mensaje, mensaje);
		FacesContext.getCurrentInstance().addMessage(null, msg);
		
		Ajax.update("frmMsg-global");
	}
	
	public void mostrarMensaje(String mensaje) {
		mensaje = StringUtils.replaceAll(mensaje, "\n", " ");
		FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, mensaje, mensaje);
		FacesContext.getCurrentInstance().addMessage(null, msg);
		
		Ajax.update("frmMsg-global");
	}
}
