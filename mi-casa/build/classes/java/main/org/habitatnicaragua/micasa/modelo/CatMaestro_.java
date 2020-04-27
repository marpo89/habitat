package org.habitatnicaragua.micasa.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(CatMaestro.class)
public abstract class CatMaestro_ {

	public static volatile SingularAttribute<CatMaestro, String> descripcion;
	public static volatile SingularAttribute<CatMaestro, Long> idCatMaestro;
	public static volatile SingularAttribute<CatMaestro, String> tipoCatalogo;
	public static volatile SingularAttribute<CatMaestro, Integer> orden;
	public static volatile SingularAttribute<CatMaestro, Auditoria> auditoria;
	public static volatile SingularAttribute<CatMaestro, String> nombre;
	public static volatile SingularAttribute<CatMaestro, Boolean> activo;

}

