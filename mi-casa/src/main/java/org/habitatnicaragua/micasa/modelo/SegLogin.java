package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.habitatnicaragua.micasa.util.FechasUno;
import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of={"idLogin"})
@Entity
@Table(name="SEG_LOGIN")
public class SegLogin implements Identificable<Long>, Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_LOGIN", nullable=false)
	private Long idLogin;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "FECHA", nullable=false)
	private java.util.Date fecha;
	
	@Column(name = "CORREO")
	private String correo;
	
	@Column(name = "IP", length=100)
	private String ip;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "EXITOSO")
	private Boolean exitoso;

	@Override
	public Long getIdentificador() {
		return idLogin;
	}
	
	public String getFechaUi() {
		if(fecha!=null) return FechasUno.dfDiaHora.format(fecha);
		
		return "";
	}
	
}
