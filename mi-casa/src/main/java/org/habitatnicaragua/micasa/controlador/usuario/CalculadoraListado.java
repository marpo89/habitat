package org.habitatnicaragua.micasa.controlador.usuario;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.habitatnicaragua.micasa.controlador.comun.ContextoUno;
import org.habitatnicaragua.micasa.dto.datatable.RespuestaDataTable;
import org.habitatnicaragua.micasa.dto.datatable.SolicitudDataTable;
import org.habitatnicaragua.micasa.modelo.CalcParametros;
import org.habitatnicaragua.micasa.modelo.Calculadora;
import org.habitatnicaragua.micasa.servicio.ServicioCalculadora;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController("calculadoraListado")
@RequestMapping("/usuario")
public class CalculadoraListado extends ContextoUno {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ServicioCalculadora servicioCalculadora;
		
	@RequestMapping(value="/calculadora.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<Calculadora>> listarCalculadora(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		Page<Calculadora> calculadora = null;
		
		
		calculadora = servicioCalculadora.listarCalculadoraPorUsuario(solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<Calculadora> respuesta = new RespuestaDataTable<Calculadora>(solicitud, calculadora);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
	@RequestMapping(value="/parametros.json", method=RequestMethod.POST)
	public ResponseEntity<RespuestaDataTable<CalcParametros>> listarCalcParametros(HttpServletRequest request) {
		
		SolicitudDataTable solicitud = new SolicitudDataTable(request);
		Page<CalcParametros> calcParametros = null;
		
		Long idCalculadora = ServletRequestUtils.getLongParameter(request, "idCalculadora", 0);
		
		calcParametros = servicioCalculadora.listarCalcParametros(idCalculadora, solicitud.getSpringPageRequest(), solicitud.getSearchValue());
		
		RespuestaDataTable<CalcParametros> respuesta = new RespuestaDataTable<CalcParametros>(solicitud, calcParametros);
		
		return new ResponseEntity<>(respuesta, HttpStatus.OK);
	}
	
}
