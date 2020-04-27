package org.habitatnicaragua.micasa.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Auditoria.class)
public abstract class Auditoria_ {

	public static volatile SingularAttribute<Auditoria, Date> fechaReg;
	public static volatile SingularAttribute<Auditoria, Date> fechaMod;
	public static volatile SingularAttribute<Auditoria, String> usuarioMod;
	public static volatile SingularAttribute<Auditoria, String> usuarioReg;

}

