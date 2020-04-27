package org.habitatnicaragua.micasa.seguridad;

import java.util.Iterator;

import javax.faces.FacesException;
import javax.faces.context.ExceptionHandler;
import javax.faces.context.ExceptionHandlerWrapper;
import javax.faces.context.FacesContext;
import javax.faces.event.ExceptionQueuedEvent;
import javax.faces.event.ExceptionQueuedEventContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * https://memorynotfound.com/jsf-global-exception-handler-factory-example/
 *
 */
public class JsfExceptionHandler extends ExceptionHandlerWrapper {

	private final static Logger LOGGER = LoggerFactory.getLogger(JsfExceptionHandler.class);

    private ExceptionHandler exceptionHandler;

    public JsfExceptionHandler(ExceptionHandler exceptionHandler) {
        this.exceptionHandler = exceptionHandler;
    }

    @Override
    public ExceptionHandler getWrapped() {
        return exceptionHandler;
    }

    @Override
    public void handle() throws FacesException {
        FacesContext context = FacesContext.getCurrentInstance();
        HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();
        HttpServletResponse response = (HttpServletResponse) context.getExternalContext().getResponse();

        final Iterator<ExceptionQueuedEvent> queue = getUnhandledExceptionQueuedEvents().iterator();

        while (queue.hasNext()){
            ExceptionQueuedEvent item = queue.next();
            ExceptionQueuedEventContext exceptionQueuedEventContext = (ExceptionQueuedEventContext)item.getSource();

            boolean removeElement = true;
            try {
                Throwable throwable = exceptionQueuedEventContext.getException();
                
                if(throwable==null) continue;
                
                throwable = ExcepcionUno.getCausaOriginal(throwable);
                
                if(throwable instanceof ExcepcionUno && StringUtils.lowerCase(throwable.getMessage()).contains("permiso")) {
                	request.setAttribute("javax.servlet.error.status_code", 403);
                } else if(throwable instanceof ExcepcionUno) {
                	
                	if (null != context && context.getPartialViewContext().isAjaxRequest()) {
                		removeElement = false;
                    	break; // while
                    } else {
                    	request.setAttribute("javax.servlet.error.status_code", 400);
                    }
                	
                } else {
                	request.setAttribute("javax.servlet.error.status_code", 500);
                }
                request.setAttribute("javax.servlet.error.exception", throwable);
                request.setAttribute("javax.servlet.error.message", throwable.getMessage());
                
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/error");
                dispatcher.forward(request, response);
                return;
            } catch (Exception e) {
				LOGGER.error(e.getMessage(), e);
			} finally {
				if(removeElement) queue.remove();
            }
        }
        
        super.handle();
    }
}