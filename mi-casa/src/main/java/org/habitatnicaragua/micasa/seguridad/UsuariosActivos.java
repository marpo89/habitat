package org.habitatnicaragua.micasa.seguridad;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class UsuariosActivos {
	private static UsuariosActivos instancia = null;
	
	private Map<String, String> sesionesActivas = new ConcurrentHashMap<String, String>();
	
	private UsuariosActivos() { }
	
	public static synchronized UsuariosActivos get() {
		if(instancia==null) {
			instancia = new UsuariosActivos();
		}
		
		return instancia;
	}
	
	public Set<String> getUsuariosEnLinea() {
		return new HashSet<String>(sesionesActivas.values());
	}

	public Map<String, String> getSesionesActivas() {
		return sesionesActivas;
	}
	
	
}
