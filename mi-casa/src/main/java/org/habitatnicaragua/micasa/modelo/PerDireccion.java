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
@EqualsAndHashCode(of={"idDireccion"})
@ToString
@Entity
@Table(name="PER_DIRECCION")
@EntityListeners({AuditoriaListener.class})
public class PerDireccion implements Auditable, Identificable<Long>, Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_DIRECCION", nullable=false)
	private Long idDireccion;
	
	@ManyToOne
	@JoinColumn(name="ID_USUARIO")
	private PerUsuario usuario;
	
	@Column(name = "NOMBRE")
	private String nombre;
	
	@Column(name = "DIRECCION")
	private String direccion;
	
	@ManyToOne
	@JoinColumn(name="ID_LOCALIDAD")
	private CatMaestro idLocalidad;
		
	@Column(name = "LATITUD")
	private Double latitud;	
	
	@Column(name = "LONGITUD")
	private Double longitud;	
	
	@Embedded
	private Auditoria auditoria = new Auditoria();

	@Override
	public Long getIdentificador() {
		return idDireccion;
	}

}
