package org.habitatnicaragua.micasa.modelo.dto;

import java.io.Serializable;

import org.habitatnicaragua.micasa.modelo.CmsArchivo;
import org.habitatnicaragua.micasa.modelo.PryComentario;
import org.habitatnicaragua.micasa.modelo.PryProyecto;


import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ActividadRecienteProyectoDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Getter(AccessLevel.NONE)
	@Setter(AccessLevel.NONE)
	public static final String COMENTARIO = "Comentario";
	
	@Getter(AccessLevel.NONE)
	@Setter(AccessLevel.NONE)
	public static final String ARCHIVO = "Archivo";
	
	private CmsArchivo cmsArchivo;
 	private PryComentario pryComentario;
 	
 	private String tipoActividadReciente = null;
 	
 	public String getTipoActividadReciente() {
 		if(tipoActividadReciente!=null) return tipoActividadReciente;
 		
 		if(cmsArchivo==null && pryComentario==null) return null;
 		
 		if(cmsArchivo==null) {
 			tipoActividadReciente = COMENTARIO;
 		} else  if(pryComentario==null) {
 			tipoActividadReciente = ARCHIVO;
 		} else if(cmsArchivo.getAuditoria().getFechaReg().getTime() > pryComentario.getAuditoria().getFechaReg().getTime()) {
 			tipoActividadReciente = ARCHIVO;
 		} else {
 			tipoActividadReciente = COMENTARIO;
 		}
 		
 		return tipoActividadReciente;
 	}
 	
 	public PryProyecto getProyecto() {
 		if(ARCHIVO.equals(getTipoActividadReciente())) {
 			return cmsArchivo.getProyecto();
 		}
 		
 		if(COMENTARIO.equals(getTipoActividadReciente())) {
 			return pryComentario.getIdProyecto();
 		}
 		
 		return null;
 	}
}
