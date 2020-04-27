package org.habitatnicaragua.micasa.util;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter
public class SiNoJpaConverter implements AttributeConverter<Boolean, String> {

	@Override
	public String convertToDatabaseColumn(Boolean valor) {
		if(valor==null) return "N";
		
		if(valor) return "S";
		
		return "N";
	}

	@Override
	public Boolean convertToEntityAttribute(String valor) {
		if(valor==null) return Boolean.FALSE;
		
		return "S".equals(valor);
	}
}
