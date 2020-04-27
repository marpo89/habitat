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
@EqualsAndHashCode(of={"idCupon"})
@ToString
@Entity
@Table(name="OFT_USAR_OFERTA")
@EntityListeners({AuditoriaListener.class})
public class OftCupon implements Auditable, Identificable<Long>, Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_USAR_OFERTA", nullable=false)
	private Long idCupon;
	
	@ManyToOne
	@JoinColumn(name="ID_OFERTA")
	private OftOferta oferta;
	
	@ManyToOne
	@JoinColumn(name="ID_USUARIO")
	private PerUsuario usuario;
	
	@Column(name = "CODIGO", length=255)
	private String codigo;
	
	@Convert(converter=SiNoJpaConverter.class)
	@Column(name = "UTILIZADO", nullable=false)
	private Boolean utilizado = false;

	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {
		return idCupon;
	}

}
