package org.habitatnicaragua.micasa.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(SegLogin.class)
public abstract class SegLogin_ {

	public static volatile SingularAttribute<SegLogin, Date> fecha;
	public static volatile SingularAttribute<SegLogin, Boolean> exitoso;
	public static volatile SingularAttribute<SegLogin, String> correo;
	public static volatile SingularAttribute<SegLogin, String> ip;
	public static volatile SingularAttribute<SegLogin, Long> idLogin;

}

