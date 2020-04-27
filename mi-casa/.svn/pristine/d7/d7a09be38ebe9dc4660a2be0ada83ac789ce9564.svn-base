package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idProyecto"})
@ToString
@Entity
@Table(name="PRY_PROYECTO")
@EntityListeners({AuditoriaListener.class})
public class PryProyectoTmp implements Identificable<Long>, Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_PROYECTO", nullable=false)
	private Long idProyecto;
	
	@Column(name="USUARIO_TECNICO")
	private String tecnico;
	
	@Override
	public Long getIdentificador() {
		return idProyecto;
	}
}
