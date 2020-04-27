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
import javax.persistence.Table;

import org.habitatnicaragua.micasa.util.SiNoJpaConverter;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of={"idCatMaestro"})
@ToString
@Entity
@Table(name="CAT_MAESTRO")
@EntityListeners({AuditoriaListener.class})
public class CatMaestro implements Auditable,  Identificable<Long>, Serializable{
		private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name = "ID_CAT_MAESTRO", nullable=false)
		private Long idCatMaestro;
		
		@Column(name = "TIPO_CATALOGO", nullable=false, length=100)
		private String tipoCatalogo;
		
		@Column(name = "NOMBRE", length=255)
		private String nombre;
		
		@Column(name = "DESCRIPCION")
		private String descripcion;
		
		@Convert(converter=SiNoJpaConverter.class)
		@Column(name = "ACTIVO", nullable=false)
		private Boolean activo = true;
		
		@Column(name = "ORDEN")
		private Integer orden = 0;
		
		@Embedded
		private Auditoria auditoria = new Auditoria();

		@Override
		public Long getIdentificador() {
			return idCatMaestro;
		}		

}
