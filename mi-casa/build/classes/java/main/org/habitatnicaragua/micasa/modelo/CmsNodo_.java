package org.habitatnicaragua.micasa.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(CmsNodo.class)
public abstract class CmsNodo_ {

	public static volatile SingularAttribute<CmsNodo, String> contenido;
	public static volatile SingularAttribute<CmsNodo, Long> idNodo;
	public static volatile SingularAttribute<CmsNodo, CatMaestro> tipoNodo;
	public static volatile SingularAttribute<CmsNodo, Boolean> sistema;
	public static volatile SingularAttribute<CmsNodo, String> titulo;
	public static volatile SingularAttribute<CmsNodo, String> enlace;
	public static volatile SingularAttribute<CmsNodo, Auditoria> auditoria;
	public static volatile SingularAttribute<CmsNodo, Boolean> activo;

}

