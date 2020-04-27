package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.habitatnicaragua.micasa.servicio.ServicioPerfil;
import org.habitatnicaragua.micasa.util.SpringContextHolder;


/**
 * https://kenai.com/projects/javaee-patterns/forums/forum/topics/3191-Adding-current-user-information-to-JPA-entities
 * 
 * @author Denis
 *
 */
public class AuditoriaListener implements Serializable {
	private static final long serialVersionUID = 1L;

	@PrePersist
    public void auditCreation(Auditable auditable) {
		ServicioComun servicioComun = SpringContextHolder.getSpringCtx().getBean(ServicioComun.class);
		ServicioPerfil servicioPerfil = SpringContextHolder.getSpringCtx().getBean(ServicioPerfil.class);
		
		if(auditable.getAuditoria()==null) {
			auditable.setAuditoria(new Auditoria());
		}
		
		auditable.getAuditoria().setFechaReg(servicioComun.getFechaHoraSistema());
        auditable.getAuditoria().setUsuarioReg(servicioPerfil.getIdUsuarioActual());
    }

    @PreUpdate
    public void auditUpdate(Auditable auditable) {
    	ServicioComun servicioComun = SpringContextHolder.getSpringCtx().getBean(ServicioComun.class);
    	ServicioPerfil servicioPerfil = SpringContextHolder.getSpringCtx().getBean(ServicioPerfil.class);
    	
    	if(auditable.getAuditoria()==null) {
			auditable.setAuditoria(new Auditoria());
		}
    	
    	auditable.getAuditoria().setFechaMod(servicioComun.getFechaHoraSistema());
    	auditable.getAuditoria().setUsuarioMod(servicioPerfil.getIdUsuarioActual());
    }
}
