package org.habitatnicaragua.micasa.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class SpringContextHolder implements ApplicationContextAware {

	private static ApplicationContext springCtx = null;
	
	@Override
	public void setApplicationContext(ApplicationContext springCtx) throws BeansException {
		SpringContextHolder.springCtx = springCtx;
	}

	public static ApplicationContext getSpringCtx() {
		return springCtx;
	}	
}
