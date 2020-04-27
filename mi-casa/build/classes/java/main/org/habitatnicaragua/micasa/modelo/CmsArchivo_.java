package org.habitatnicaragua.micasa.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(CmsArchivo.class)
public abstract class CmsArchivo_ {

	public static volatile SingularAttribute<CmsArchivo, String> youtube;
	public static volatile SingularAttribute<CmsArchivo, String> rutaOriginal;
	public static volatile SingularAttribute<CmsArchivo, String> ruta;
	public static volatile SingularAttribute<CmsArchivo, String> titulo;
	public static volatile SingularAttribute<CmsArchivo, PryProyecto> proyecto;
	public static volatile SingularAttribute<CmsArchivo, String> comentario;
	public static volatile SingularAttribute<CmsArchivo, CatMaestro> tipoArchivo;
	public static volatile SingularAttribute<CmsArchivo, Boolean> visibleTituloPagina;
	public static volatile SingularAttribute<CmsArchivo, Long> idArchivo;
	public static volatile SingularAttribute<CmsArchivo, Integer> orden;
	public static volatile SingularAttribute<CmsArchivo, Auditoria> auditoria;
	public static volatile SingularAttribute<CmsArchivo, Boolean> activo;
	public static volatile SingularAttribute<CmsArchivo, CmsNodo> nodo;

}

