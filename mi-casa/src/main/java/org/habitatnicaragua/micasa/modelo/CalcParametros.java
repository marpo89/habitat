package org.habitatnicaragua.micasa.modelo;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Convert;
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
@EqualsAndHashCode(of={"idParametro"})
@ToString
@Entity
@Table(name="CALC_PARAMETROS")
//@EntityListeners({AuditoriaListener.class})
public class CalcParametros implements Identificable<Long>, Serializable{
		private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name = "ID_PARAMETRO", nullable=false)
		private Long idParametro;
		
		@ManyToOne
		@JoinColumn(name="ID_CALCULADORA")
		private Calculadora idCalculadora;
		
		@ManyToOne
		@JoinColumn(name="NOMBRE_PARAMETRO", nullable=false)
		private CatMaestro nombreParametro;
		
		@Column(name = "VALOR", nullable=false)
		private float valor;
		
		@Convert(converter=SiNoJpaConverter.class)
		@Column(name = "TIPO_CALCULO", nullable=false)
		private Boolean tipoCalculo = true;
		
		@Convert(converter=SiNoJpaConverter.class)
		@Column(name = "APLICA_CUOTA", nullable=false)
		private Boolean aplicaCuota = true;
		
		@Override
		public Long getIdentificador() {
			return idParametro;
		}		

}
