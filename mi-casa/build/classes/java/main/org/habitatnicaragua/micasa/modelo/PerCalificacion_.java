package org.habitatnicaragua.micasa.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(PerCalificacion.class)
public abstract class PerCalificacion_ {

	public static volatile SingularAttribute<PerCalificacion, Integer> puntaje;
	public static volatile SingularAttribute<PerCalificacion, Long> idCalificacion;
	public static volatile SingularAttribute<PerCalificacion, PerUsuario> proveedor;
	public static volatile SingularAttribute<PerCalificacion, String> comentario;
	public static volatile SingularAttribute<PerCalificacion, Auditoria> auditoria;
	public static volatile SingularAttribute<PerCalificacion, PerUsuario> autor;

}

