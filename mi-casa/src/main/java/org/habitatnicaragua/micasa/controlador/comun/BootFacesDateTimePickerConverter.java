package org.habitatnicaragua.micasa.controlador.comun;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@FacesConverter("bootFacesDateTimePickerConverter")
public class BootFacesDateTimePickerConverter implements Converter {

	private static final SimpleDateFormat SDF_BOOTSFACES_DATETIMEPICKER = new SimpleDateFormat("dd/MM/yyyy");

	private static final Logger LOGGER = LoggerFactory.getLogger(BootFacesDateTimePickerConverter.class);

	@Override
	public Object getAsObject(FacesContext context, UIComponent component, String value) {
		return value;
	}

	@Override
	public String getAsString(FacesContext context, UIComponent component, Object value) {
		if(value instanceof String) {
			return (String)value;
		} 
		/*
		else if(value instanceof Date) {
			return SDF_BOOTSFACES_DATETIMEPICKER.format(value);
		}
		*/
		return String.valueOf(value);
	}

	public static String toString(Date fecha) {
		if(fecha==null) return null;
		
		return SDF_BOOTSFACES_DATETIMEPICKER.format(fecha);
	}
	
	public static Date toDate(String fecha) {
		return toDate(fecha, null);
	}
	
	public static Date toDate(String fecha, Date porDefecto) {
		if(!StringUtils.isBlank(fecha)) {
			try {
				return BootFacesDateTimePickerConverter.SDF_BOOTSFACES_DATETIMEPICKER.parse(fecha);
			} catch (ParseException e) { 
				LOGGER.info("BootFacesDateTimePickerConverter.parse: " + fecha + " :: " + e.getMessage());
				return porDefecto;
			}
		}
		
		return porDefecto;
	}

}
