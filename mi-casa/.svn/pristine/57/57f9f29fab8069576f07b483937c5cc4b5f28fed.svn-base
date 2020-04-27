package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.habitatnicaragua.micasa.util.FechasUno;
import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of = { "idUsuario" })
@ToString
@Entity
@Table(name = "vw_actividad_usr_n2")
public class VwActividadUsuarioNivel2 implements Identificable<String>, Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID_USUARIO")
	private String idUsuario;

	@Column(name = "NOMBRES", length=255)
	private String nombres;
	
	@Column(name = "CORREO")
	private String correo;

	@Convert(converter = SiNoJpaConverter.class)
	@Column(name = "ACTIVO")
	private Boolean activo = false;

	@Temporal(TemporalType.DATE)
	@Column(name = "FECHA_MURO")
	private java.util.Date fechaMuro;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "FECHA_LOGIN")
	private java.util.Date fechaLogin;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "FECHA_OFERTA")
	private java.util.Date fechaOferta;
	
	@Override
	public String getIdentificador() {
		return idUsuario;
	}
	
	@Transient
	public String getFechaMuroUI() {
		if(fechaMuro!=null) return FechasUno.dfDia.format(fechaMuro);
		
		return "";
	}
	
	@Transient
	public String getFechaLoginUI() {
		if(fechaLogin!=null) return FechasUno.dfDia.format(fechaLogin);
		
		return "";
	}
	
	@Transient
	public String getFechaOfertaUI() {
		if(fechaOferta!=null) return FechasUno.dfDia.format(fechaOferta);
		
		return "";
	}
}
