package org.habitatnicaragua.micasa.modelo.dto;

import java.io.Serializable;

import org.habitatnicaragua.micasa.modelo.Identificable;
import org.habitatnicaragua.micasa.modelo.PerCalificacion;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.util.FechasUno;
import org.jsoup.Jsoup;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idCalificacion"})
@ToString
public class PerCalificacionDTO implements Identificable<Long>, Serializable {
	private static final long serialVersionUID = 1L;
	
    private Long idCalificacion;
	
	private String comentario;
	
	private java.util.Date fechaReg;
	
	private java.util.Date fechaMod;
	
	private String usuarioRegEnmascarado;
	
	private boolean propio = false;
	
	public PerCalificacionDTO() {
		
	}
	
	public PerCalificacionDTO(PerCalificacion perCalificacion, PerUsuario usuarioActual) {
		this.idCalificacion = perCalificacion.getIdCalificacion();
		this.comentario =  Jsoup.parse(perCalificacion.getComentario()).text();
		this.fechaReg = perCalificacion.getAuditoria().getFechaReg();
		this.fechaMod = perCalificacion.getAuditoria().getFechaMod();
		
		if(perCalificacion.getAuditoria().getUsuarioReg()!=null) {
			this.usuarioRegEnmascarado = perCalificacion.getAutor().getCorreo().replaceAll("(^[^@]{4}|(?!^)\\G)[^@]", "$1*");
		}
		
		this.propio = false;
				
		if(usuarioActual.isAdmin()) {
			this.setPropio(true);
		} else if(perCalificacion.getAuditoria()!=null && 
				usuarioActual.getIdUsuario().equals(perCalificacion.getAuditoria().getUsuarioReg())){
			this.setPropio(true);
		}
	}
		
	@Override
	public Long getIdentificador() {
		return idCalificacion;
	}
	
	public String getFechaRegUI() {
		if(fechaReg!=null) return FechasUno.dfDiaHora.format(fechaReg);
		
		return "";
	}
	
	public String getFechaModUI() {
		if(fechaMod!=null) return FechasUno.dfDiaHora.format(fechaMod);
		
		return "";
	}
	
	public String getFechaRegModUI() {
		if(fechaMod!=null) return getFechaModUI();
		
		return getFechaRegUI();
	}
	
}
