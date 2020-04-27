package org.habitatnicaragua.micasa.controlador.comun;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.bean.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;

import lombok.Getter;
import lombok.Setter;

@Named("menuVista")
@SessionScoped
@Getter
@Setter
public class MenuVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioPerfil servicioPerfil;
	
	private Map <String, Rol[]> menuPorRoles;
	private Map <String, Boolean> menuVisible;
	
	@PostConstruct
	public void inicializar() {
		menuPorRoles = new HashMap<String, Rol[]>();
		menuVisible = new HashMap<String, Boolean>();
		
		menuPorRoles.put("validar_oferta", new Rol[]{Rol.DISTRIBUIDOR});
		menuPorRoles.put("ofertas", new Rol[]{Rol.ADMIN, Rol.FINANCIAMIENTO, Rol.MATERIAL});
		menuPorRoles.put("gestionar", new Rol[]{Rol.ADMIN, Rol.ADMIN_TECNICO, Rol.TECNICO});
		menuPorRoles.put("administracion", new Rol[]{Rol.ADMIN});
		
		// logica no basada solo en roles ver abajo
		menuPorRoles.put("mis_proyectos", new Rol[]{});
		menuPorRoles.put("biblioteca", new Rol[]{});
		menuPorRoles.put("mi_perfil_anonimo", new Rol[]{});
		menuPorRoles.put("mi_perfil_simple", new Rol[]{});
		menuPorRoles.put("mi_perfil", new Rol[]{}); 
		menuPorRoles.put("salir", new Rol[]{});
		
		initMenuVisible();
	}

	private void initMenuVisible() {
		for(String menuKey:menuPorRoles.keySet()) {
			menuVisible.put(menuKey, false);
			Rol[] roles = menuPorRoles.get(menuKey);
			if(servicioPerfil.isUsuarioActualMiembroRol(roles)) {
				menuVisible.put(menuKey, true);
			}
		}
		
		menuVisible.put("biblioteca", true);
		
		PerUsuario usuarioActual = servicioPerfil.getUsuarioActual();
		
		if(usuarioActual!=null) {
			menuVisible.put("mi_perfil_anonimo", false);
			if(servicioPerfil.getUsuarioActual().isNivel2() || servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN)) {
				menuVisible.put("mi_perfil_simple", false);
				menuVisible.put("mi_perfil", true);
			} else if(servicioPerfil.getUsuarioActual()!=null){
				menuVisible.put("mi_perfil_simple", true);
				menuVisible.put("mi_perfil", false);
			}
			
			if(servicioPerfil.getUsuarioActual().isNivel1()) {
				menuVisible.put("mis_proyectos", true);
			} else {
				menuVisible.put("mis_proyectos", false);
			}
			
			menuVisible.put("salir", true);
		} else {
			menuVisible.put("mi_perfil_anonimo", true);
		}
	}
}
