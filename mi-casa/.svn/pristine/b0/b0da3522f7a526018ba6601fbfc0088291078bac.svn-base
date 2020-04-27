package org.habitatnicaragua.micasa.modelo;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idCalificacion"})
@ToString
@Entity
@Table(name="PER_CALIFICACION")
@EntityListeners({AuditoriaListener.class})
public class PerCalificacion implements Auditable, Identificable<Long>, Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_CALIFICACION", nullable=false)
	private Long idCalificacion;
	
	@Column(name="PUNTAJE")
	private Integer puntaje;
	
	@Column(name = "COMENTARIO")
	private String comentario;
	
	@ManyToOne
	@JoinColumn(name="ID_PROVEEDOR")
	private PerUsuario proveedor;

	@ManyToOne
	@JoinColumn(name="ID_AUTOR")
	private PerUsuario autor;
	
	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {
		return idCalificacion;
	}


}
