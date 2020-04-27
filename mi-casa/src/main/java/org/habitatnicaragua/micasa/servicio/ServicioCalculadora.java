package org.habitatnicaragua.micasa.servicio;

import java.util.List;

import org.habitatnicaragua.micasa.modelo.CalcParametros;
import org.habitatnicaragua.micasa.modelo.Calculadora;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

public interface ServicioCalculadora {	
	
	/* Inicio: Calculadora */	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	Calculadora buscarCalculadoraPorId(Long idCalculo);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	CalcParametros buscarParametroPorId(Long idParametro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	CalcParametros buscarCalcParametrosPorId(Long idParametro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	void eliminarCalculadora(Long idCalculadora) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	void eliminarParametro(Long idParametro) throws ExcepcionUno;
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	Page<CalcParametros> listarCalcParametros(Long idCalculadora, Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	Page<Calculadora> listarCalculadoraPorUsuario(Pageable pagina, String filtro);
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	Calculadora guardarCalculadora(Calculadora calculadora) throws ExcepcionUno;

	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO', 'ADMIN_TECNICO', 'TECNICO')")
	CalcParametros guardarParametro(CalcParametros calcParametros) throws ExcepcionUno;

	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO')")
	List<String> listarTiposEntidades();
	
	@PreAuthorize("hasAnyRole('ADMIN', 'USUARIO') OR isAnonymous()")
	Calculadora buscarCalcPorEntidadFinanc(Long entidadFinanc);
	
}
