package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idComentario"})
@ToString
@Entity
@Table(name="PRY_COMENTARIO")
@EntityListeners({AuditoriaListener.class})
public class PryComentario implements Auditable, Identificable<Long>, Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_COMENTARIO", nullable=false)
	private Long idComentario;
	
	@ManyToOne
	@JoinColumn(name = "ID_PROYECTO", nullable=false)
	private PryProyecto idProyecto;
		
	@ManyToOne
	@JoinColumn(name="ID_COMENTARISTA", nullable=false)
	private PerUsuario comentarista;
	
	@Column(name = "CONTENIDO")
	private String contenido;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "ACTIVO", nullable=false)
	private Boolean activo = true;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "VISTO", nullable=false)
	private Boolean visto = false;
	
	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {
		return idComentario;
	}
	
}
