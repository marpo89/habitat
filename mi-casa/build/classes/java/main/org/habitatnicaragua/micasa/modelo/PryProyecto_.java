package org.habitatnicaragua.micasa.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(PryProyecto.class)
public abstract class PryProyecto_ {

	public static volatile SingularAttribute<PryProyecto, String> descripcion;
	public static volatile SingularAttribute<PryProyecto, Long> idProyecto;
	public static volatile SingularAttribute<PryProyecto, CatMaestro> idBanco;
	public static volatile SingularAttribute<PryProyecto, CatMaestro> estado;
	public static volatile SingularAttribute<PryProyecto, CatMaestro> tipoServicio;
	public static volatile SingularAttribute<PryProyecto, PerUsuario> duenio;
	public static volatile SingularAttribute<PryProyecto, String> comprobante;
	public static volatile SingularAttribute<PryProyecto, PerUsuario> tecnico;
	public static volatile SingularAttribute<PryProyecto, CatMaestro> idPryFormaPago;
	public static volatile SingularAttribute<PryProyecto, Date> fechaPago;
	public static volatile SingularAttribute<PryProyecto, CatMaestro> idMoneda;
	public static volatile SingularAttribute<PryProyecto, Double> montoPresupuesto;
	public static volatile SingularAttribute<PryProyecto, Boolean> presenteVisita;
	public static volatile SingularAttribute<PryProyecto, Boolean> presupuesto;
	public static volatile SingularAttribute<PryProyecto, String> materialesMejora;
	public static volatile SingularAttribute<PryProyecto, Boolean> tieneAlbanil;
	public static volatile SingularAttribute<PryProyecto, Auditoria> auditoria;
	public static volatile SingularAttribute<PryProyecto, String> nombrePerAtencionVisita;
	public static volatile SingularAttribute<PryProyecto, String> espaciosMejora;
	public static volatile SingularAttribute<PryProyecto, String> fechaHoraDisponible;

}

