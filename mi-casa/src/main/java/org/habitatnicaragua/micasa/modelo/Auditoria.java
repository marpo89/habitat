package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.habitatnicaragua.micasa.util.FechasUno;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Embeddable
public class Auditoria implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name = "USUARIO_REG", length=100)
	private String usuarioReg;
	
	@Column(name = "FECHA_REG")
	@Temporal(TemporalType.TIMESTAMP)
	private java.util.Date fechaReg;
	
	@Column(name = "USUARIO_MOD", length=100)
	private String usuarioMod;
	
	@Column(name = "FECHA_MOD")
	@Temporal(TemporalType.TIMESTAMP)
	private java.util.Date fechaMod;

	@Transient
	public String getFechaRegUI() {
		if(fechaReg!=null) return FechasUno.dfDiaHora.format(fechaReg);
		
		return "";
	}
	
	@Transient
	public String getFechaModUI() {
		if(fechaMod!=null) return FechasUno.dfDiaHora.format(fechaMod);
		
		return "";
	}
	
	@Transient
	public String getFechaRegModUI() {
		if(fechaMod!=null) return getFechaModUI();
		
		return getFechaRegUI();
	}

}
