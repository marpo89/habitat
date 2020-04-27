package org.habitatnicaragua.micasa.seguridad;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter({"*.xhtml", "*.json", "/javax.faces.resource/*","/AdminLTE/*"})
public class FiltroSeguridadEncabezadosCache implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException { }

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		chain.doFilter(request, response);

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		
		if(httpServletRequest.getRequestURI().contains("javax.faces.resource") || 
				httpServletRequest.getRequestURI().contains("AdminLTE")) {
			httpServletResponse.setHeader("Cache-Control", "max-age=2628000, public");
		} else if(httpServletResponse.getHeader("Expires")==null && 
					httpServletResponse.getHeader("Pragma")==null && 
					httpServletResponse.getHeader("Expires")==null) {
			httpServletResponse.setHeader("Expires", "no-cache, no-store, max-age=0, must-revalidate");
			httpServletResponse.setHeader("Pragma", "no-cache");
			httpServletResponse.setHeader("Cache-Control", "0");
		}
	}

	@Override
	public void destroy() { }

}
