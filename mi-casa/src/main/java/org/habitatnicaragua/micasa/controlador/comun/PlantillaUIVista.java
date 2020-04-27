package org.habitatnicaragua.micasa.controlador.comun;

import java.io.Serializable;
import java.time.Year;

import javax.faces.bean.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.springframework.beans.factory.annotation.Value;

import lombok.Getter;

@Named("plantillaUIVista")
@SessionScoped
@Getter
public class PlantillaUIVista implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioComun servicioComun;

	private String direccionFisica;
	
	private String googleAnalyticsCode;
	
	private String extraMetaName1;
	
	private String extraMetaContent1;
	
	@Value("${juno.version-app}")
	private String versionApp;
	
	@Value("${juno.nombre-app}")
	private String nombreApp;
	
	@Value("${juno.nombre-largo-app}")
	private String nombreLargoApp;
	
	@Value("${juno.autor-app}")
	private String autorApp;
	
	@Value("${juno.url-autor}")
	private String urlAutor;
	
	@Value("${juno.descipcion-app}")
	private String descripcionApp;
	
	@Value("${juno.size-limit.avatar}")
	private long sizeLimitAvatar;
	
	@Value("${juno.size-limit.proyecto}")
	private long sizeLimitProyecto;

	@Value("${juno.size-limit.general}")
	private long sizeLimitGeneral;
	
	public int getCopyrightAnio() {
		return Year.now().getValue();
	}
	
	public String getPieDePagina() {
		if(direccionFisica==null) {
			direccionFisica = servicioComun.getValorParametro("PIE_DE_PAGINA");
		}
		
		return direccionFisica;
	}
	
	public String getGoogleAnalyticsCode() {
		if(googleAnalyticsCode==null) {
			googleAnalyticsCode = servicioComun.getValorParametro("GOOGLE_ANALYTICS_CODE");
		}
		
		return googleAnalyticsCode;
	}

	public String getExtraMetaName1() {
		if(extraMetaName1==null) {
			extraMetaName1 = servicioComun.getValorParametro("EXTRA_META_NAME_1");
		}
		
		return extraMetaName1;
	}
	
	public String getExtraMetaContent1() {
		if(extraMetaContent1==null) {
			extraMetaContent1 = servicioComun.getValorParametro("EXTRA_META_CONTENT_1");
		}
		
		return extraMetaContent1;
	}
	
}
