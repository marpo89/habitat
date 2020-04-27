package org.habitatnicaragua.micasa.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of={"rol"})
@Entity
@Table(name="SEG_ROL")
@EntityListeners(AuditoriaListener.class)
public class SegRol implements Auditable, Identificable<String>, Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "ROL", length=100)
	private String rol;
	
	@Embedded
	private Auditoria auditoria = new Auditoria();
	
	@Override
	public String getIdentificador(){
		return rol;
	}
}
