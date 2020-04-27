package org.habitatnicaragua.micasa.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(PerDireccion.class)
public abstract class PerDireccion_ {

	public static volatile SingularAttribute<PerDireccion, Long> idDireccion;
	public static volatile SingularAttribute<PerDireccion, Double> latitud;
	public static volatile SingularAttribute<PerDireccion, Double> longitud;
	public static volatile SingularAttribute<PerDireccion, String> direccion;
	public static volatile SingularAttribute<PerDireccion, PerUsuario> usuario;
	public static volatile SingularAttribute<PerDireccion, Auditoria> auditoria;
	public static volatile SingularAttribute<PerDireccion, String> nombre;
	public static volatile SingularAttribute<PerDireccion, CatMaestro> idLocalidad;

}

