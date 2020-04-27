package org.habitatnicaragua.micasa.servicio;

import java.sql.Date;
import java.util.List;

import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ServicioComun {
	
	Date getFechaSistema();
	
	Date getFechaHoraSistema();
	
	boolean isTextoLimpio(String texto);
	
	boolean isNumeroEnteroValido(String numero);
	
	boolean isEmailValido(String email);
	
	boolean isURLValida(String urlString);
		
	String limpiarNombreArchivo(String nombre);
	
	/** Inicio: CatMaestro **/
	// Maestro
	@PreAuthorize("hasAnyRole('ADMIN')")
	CatMaestro buscarCatMaestroPorId(Long idCatMaestro);
	
	CatMaestro buscarCatMaestroPorTipoNombre(String tipoCatalogo, String nombre);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	Page<CatMaestro> listarCatMaestro(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	void eliminarCatMaestro(Long idCatMaestro) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	CatMaestro guardarCatMaestro(CatMaestro catMaestro) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	List<String> listarTiposCatalogos();
	
	String getValorParametro(String parametro);
	
	String getValorParametro(String parametro, String valorDefault);
	
	List<CatMaestro> listarCatalogosPorTipo(String tipoCatalogo);
	
	List<CatMaestro> listarCatalogosPorTipo(String tipoCatalogo, Sort orden);
	
	List<String> listarStringCatalogosPorTipo(String tipoCatalogo);
	
	/** Fin: CatMaestro **/	
	
}
