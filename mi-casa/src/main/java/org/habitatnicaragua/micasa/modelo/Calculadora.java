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
@EqualsAndHashCode(of={"idCalculadora"})
@ToString
@Entity
@Table(name="CALCULADORA")
@EntityListeners({AuditoriaListener.class})
public class Calculadora implements Auditable,  Identificable<Long>, Serializable{
		private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name = "ID_CALCULADORA", nullable=false)
		private Long idCalculadora;
		
		@ManyToOne
		@JoinColumn(name="ID_USUARIO")
		private PerUsuario usuario;
		
		@ManyToOne
		@JoinColumn(name="ENTIDAD_FINANC", nullable=false)
		private CatMaestro entidadFinanc;
		
		@ManyToOne
		@JoinColumn(name="SISTEMA_AMORT", nullable=false)
		private CatMaestro sistemaAmort;
		
		@Column(name = "TASA_INTERES", nullable=false)
		private float tasaInteres;
		
		@Embedded
		private Auditoria auditoria = new Auditoria();

		@Override
		public Long getIdentificador() {
			return idCalculadora;
		}		

}
