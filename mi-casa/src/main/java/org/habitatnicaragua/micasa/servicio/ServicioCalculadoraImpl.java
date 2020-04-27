package org.habitatnicaragua.micasa.servicio;

import java.util.LinkedList;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.habitatnicaragua.micasa.dao.CalcParametrosDao;
import org.habitatnicaragua.micasa.dao.CalculadoraDao;
import org.habitatnicaragua.micasa.modelo.CalcParametros;
import org.habitatnicaragua.micasa.modelo.CalcParametros_;
import org.habitatnicaragua.micasa.modelo.Calculadora;
import org.habitatnicaragua.micasa.modelo.Calculadora_;
import org.habitatnicaragua.micasa.modelo.PerUsuario_;
import org.habitatnicaragua.micasa.modelo.Rol;
import org.habitatnicaragua.micasa.util.ExcepcionUno;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServicioCalculadoraImpl implements ServicioCalculadora {
	
	public static final int LONGITUD_MINIMA_CLAVE = 5;
			
	@Inject
	private ServicioPerfil servicioPerfil;
	
	@Inject
	private CalculadoraDao calculadoraDao;
	
	@Inject
	private CalcParametrosDao calcParametrosDao;
	
	/** Inicio: Calculadora **/
	
	@Override
	public Calculadora buscarCalculadoraPorId(Long idCalculo) {
		Calculadora resultado = null;
		if(servicioPerfil.isUsuarioActualMiembroRol("ADMIN") || servicioPerfil.isUsuarioActualMiembroRol("USUARIO") || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO.name())) {
			return calculadoraDao.findOne(idCalculo);
		}
		
		return resultado;
	}
	
	@Override
	public CalcParametros buscarParametroPorId(Long idParametro) {
		CalcParametros resultado = null;
		if(servicioPerfil.isUsuarioActualMiembroRol("ADMIN") || servicioPerfil.isUsuarioActualMiembroRol("USUARIO") || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO.name())) {
			return calcParametrosDao.findOne(idParametro);
		}
		
		return resultado;
	}
	
	@Override
	public Calculadora buscarCalcPorEntidadFinanc(Long entidadFinanc)
	{
		return calculadoraDao.buscarCalculadoraPorIF(entidadFinanc);		
	}
	
	@Override
	public CalcParametros buscarCalcParametrosPorId(Long idParametro) {
		CalcParametros resultado = null;
		if(servicioPerfil.isUsuarioActualMiembroRol("ADMIN") || servicioPerfil.isUsuarioActualMiembroRol("USUARIO") || 
				servicioPerfil.isUsuarioActualMiembroRol(Rol.ADMIN_TECNICO.name())) {
			return calcParametrosDao.findOne(idParametro);
		}
		
		return resultado;
	}
	
	@Override
	public Calculadora guardarCalculadora(Calculadora calculadora) throws ExcepcionUno {
		if (calculadora == null) {
			throw ExcepcionUno.objetoNull();
		}

		if(calculadora.getUsuario()==null) {
			calculadora.setUsuario(servicioPerfil.getUsuarioActual());
		}
		
		try {
			
			calculadora = calculadoraDao.save(calculadora);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
		
		return calculadora;
	}

	@Override
	public CalcParametros guardarParametro(CalcParametros calcParametros) throws ExcepcionUno {
		if (calcParametros == null) {
			throw ExcepcionUno.objetoNull();
		}

		try {
			
			calcParametros = calcParametrosDao.save(calcParametros);
		} catch (Throwable t){
			throw new ExcepcionUno(t);
		}
		
		return calcParametros;
	}

	@Override
	public void eliminarCalculadora(Long idCalculadora) throws ExcepcionUno {
		if(idCalculadora==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		Calculadora calculadora = buscarCalculadoraPorId(idCalculadora);
				
		if(calculadora==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		try {
		
			calculadoraDao.delete(idCalculadora);
		} 
		catch (Throwable t){
				throw new ExcepcionUno(t);
		}
	}
	
	@Override
	public void eliminarParametro(Long idParametro) throws ExcepcionUno {
		if(idParametro==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		CalcParametros calcParametros = buscarParametroPorId(idParametro);
				
		if(calcParametros==null) {
			throw ExcepcionUno.objetoNull();
		}
		
		try {
		
			calcParametrosDao.delete(idParametro);
		} 
		catch (Throwable t){
				throw new ExcepcionUno(t);
		}
	}
	
	@Override
	public List<String> listarTiposEntidades() {
		List<String> resultado = null;		
		resultado = calculadoraDao.buscarTiposEntidades();
		
		return resultado;
	}

	@Override
	public Page<Calculadora> listarCalculadoraPorUsuario(Pageable pagina, String filtro) {
		Page<Calculadora> resultado = null;
		
        // filtrar por idPerUsuario
		Specification<Calculadora> filtroBase = new Specification<Calculadora>(){
			@Override
			public Predicate toPredicate(Root<Calculadora> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(Calculadora_.usuario).get(PerUsuario_.idUsuario), servicioPerfil.getIdUsuarioActual());
			}
		};
				
		Specification<Calculadora> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final Long filtroLong = NumberUtils.toLong(filtro, -1L);
			//final String filtroSql = StringUtils.trim(filtro.toUpperCase()) + "%";
			where = new Specification<Calculadora>() {
	
				@Override
				public Predicate toPredicate(Root<Calculadora> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					if(filtroLong>0) {
						predicates.add(cb.equal(root.get(Calculadora_.idCalculadora), filtroLong));
					}
					//predicates.add(cb.like(cb.upper(root.get(Calculadora_.idCalculadora.toString())), filtroSql));
					return cb.or(predicates.toArray(new Predicate[0]));
				}	
			};
		}
		try {
		resultado = calculadoraDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		//resultado = calculadoraDao.buscarCalculadora();
		}
		catch (Throwable t){
			throw new ExcepcionUno(t);
		}
		return resultado;
	}
	
	@Override
	public Page<CalcParametros> listarCalcParametros(Long idCalculadora, Pageable pagina, String filtro) {
		Page<CalcParametros> resultado = null;
		
        // filtrar por idPerUsuario
		Specification<CalcParametros> filtroBase = new Specification<CalcParametros>(){
			@Override
			public Predicate toPredicate(Root<CalcParametros> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(CalcParametros_.idCalculadora).get(Calculadora_.idCalculadora), idCalculadora);
			}
		};
		
		Specification<CalcParametros> where = null;
		if(!StringUtils.isBlank(filtro)) {
			final Long filtroLong = NumberUtils.toLong(filtro, -1L);
			
			where = new Specification<CalcParametros>() {
	
				@Override
				public Predicate toPredicate(Root<CalcParametros> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new LinkedList<>();
					if(filtroLong>0) {
						predicates.add(cb.equal(root.get(CalcParametros_.idParametro), filtroLong));
					}
					
					return cb.or(predicates.toArray(new Predicate[0]));
				}	
			};
		}
		
		resultado = calcParametrosDao.findAll(Specifications.where(filtroBase).and(where), pagina);
		
		return resultado;
	}


}
