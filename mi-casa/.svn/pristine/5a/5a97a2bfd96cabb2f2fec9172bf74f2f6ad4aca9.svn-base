package org.habitatnicaragua.micasa.controlador.usuario;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.habitatnicaragua.micasa.controlador.comun.ControladorBaseUno;
import org.habitatnicaragua.micasa.modelo.CatMaestro;
import org.habitatnicaragua.micasa.modelo.PerUsuario;
import org.habitatnicaragua.micasa.modelo.PryProyecto;
import org.habitatnicaragua.micasa.modelo.PryProyectoEstado;
import org.habitatnicaragua.micasa.servicio.ServicioComun;
import org.habitatnicaragua.micasa.servicio.ServicioContenido;
import org.habitatnicaragua.micasa.servicio.ServicioProyecto;
import org.habitatnicaragua.micasa.servicio.ServicioSeguridad;
import org.habitatnicaragua.micasa.util.ExcepcionUno;

import lombok.Getter;
import lombok.Setter;

@Named("misProyectosVista")
@ViewScoped
@Getter
@Setter
public class MisProyectosVista extends ControladorBaseUno {
	private static final long serialVersionUID = 1L;

	private static final String ESTADO_ULTIMO_PROY_GUARDADO = "org.habitatnicaragua.micasa.controlador.usuario.MisProyectosVista.ESTADO_ULTIMO_PROY_GUARDADO";
	
	@Inject
	private ServicioProyecto servicioProyecto;
	
	@Inject
	private ServicioContenido servicioContenido;
	
	@Inject
	private ServicioSeguridad servicioSeguridad;

	@Inject
	private ServicioComun servicioComun;
	
	private boolean modoEditarMaestro = true;
	private Long idProyecto = null;		
	private PryProyecto pryProyecto = null;
	private PerUsuario perUsuario = null;
	private String comentario = null;
	
	private List<CatMaestro> listaBancos = null;
	private List<String> listaEspaciosMejora = null;	
	private List<String> listaMaterialesMejora = null;
	private List<CatMaestro> listaMonedas = null;
	
	private boolean soloLectura = true;
	
	@PostConstruct
	public void init() {

		idProyecto = getLongRequestParameter("idProyecto");
		
		if(idProyecto==null) {
			pryProyecto = new PryProyecto();
			modoEditarMaestro = false;
			soloLectura = false;
		} else {
			pryProyecto = servicioProyecto.buscarPryProyectoPorId(idProyecto);
			modoEditarMaestro = true;
			
			if(pryProyecto==null) {
				pryProyecto = new PryProyecto();
				idProyecto=null;
				modoEditarMaestro = false;
				throw ExcepcionUno.permisoDenegado();
			}
			
			if(PryProyectoEstado.COTIZANDO.getNombre().equals(pryProyecto.getEstado().getNombre()) ||
					PryProyectoEstado.PENDIENTE_PAGO.getNombre().equals(pryProyecto.getEstado().getNombre())) {
				soloLectura = false;
			}
		}

		perUsuario = getUsuarioActual();
		
		Long fn = getLongRequestParameter("fn");
		if(fn!=null && fn==1) {
			String estadoUltimoProyectoGuadado = (String) getHttpSession().getAttribute(ESTADO_ULTIMO_PROY_GUARDADO);
			
			String mensajeOk = null;
			if(PryProyectoEstado.COTIZANDO.getNombre().equals(estadoUltimoProyectoGuadado)) {
				mensajeOk = servicioComun.getValorParametro("MENSAJE_PROYECTO_POR_COTIZAR", null);
			} else {
				mensajeOk = servicioComun.getValorParametro("MENSAJE_PROYECTO_POR_VISITAR", null);
			}
			
			if(!StringUtils.isBlank(mensajeOk)) {
				mostrarAdvertencia(mensajeOk);
			}
		}
	}
	
	public void guardarRegistro() {
		if(soloLectura) {
			throw new ExcepcionUno("No se permite modificar el proyecto.");
		}
		
		if (pryProyecto == null) {
			throw ExcepcionUno.objetoNull();
		}

		if(StringUtils.isBlank(perUsuario.getNombres()) || StringUtils.isBlank(perUsuario.getTelefonos()) || StringUtils.isBlank(perUsuario.getDireccionFisica())) {
			throw new ExcepcionUno("Todos los campos son requeridos."); 
		}
		
		if(StringUtils.isBlank(pryProyecto.getEspaciosMejora()) || StringUtils.isBlank(pryProyecto.getDescripcion()) || 
				StringUtils.isBlank(pryProyecto.getMaterialesMejora())) {
			throw new ExcepcionUno("Todos los campos son requeridos.");
		}
		
		if(pryProyecto.getEstado()!=null && PryProyectoEstado.PENDIENTE_PAGO.getNombre().equals(pryProyecto.getEstado().getNombre())) {
			if(pryProyecto.getFechaPago()==null || pryProyecto.getIdBanco()==null || StringUtils.isBlank(pryProyecto.getComprobante())) {
				throw new ExcepcionUno("Todos los campos son requeridos.");
			}
		}
		
		if(pryProyecto.getPresupuesto()==Boolean.TRUE) {
			if(pryProyecto.getMontoPresupuesto()==null || pryProyecto.getMontoPresupuesto()<=0) {
				throw ExcepcionUno.campoRequerido("Monto Presupuesto");
			}
			
			if(pryProyecto.getIdMoneda()==null) {
				throw ExcepcionUno.campoRequerido("Moneda Presupuesto");
			}
		}
		
		pryProyecto = servicioProyecto.guardarPryProyectoUsuario(pryProyecto);		
		perUsuario = servicioSeguridad.guardarPerUsuario(perUsuario);
		
		getHttpSession().setAttribute(ESTADO_ULTIMO_PROY_GUARDADO, pryProyecto.getEstado().getNombre());
	}
	

	public void eliminarRegistro() {
		if (idProyecto == null) {
			throw new ExcepcionUno("Debe seleccionar un registro.");
		}
		
		servicioProyecto.cancelarProyectoPorCliente(idProyecto);
		mostrarAdvertencia("Registro actualizado.");
	}
	
	public void guardarComentario() {
		servicioProyecto.guardarPryComentario(comentario, pryProyecto);
		comentario = "";
		mostrarAdvertencia("Mensaje agregado.");
	}
	
	public void eliminarComentario() {
		Long idComentario = this.getLongRequestParameter("idComentario");
		
		if (idComentario == null) {
			throw ExcepcionUno.objetoNull();
		}

		servicioProyecto.eliminarPryComentario(idComentario);
	}
	
	public boolean isHabilitadoNuevoComentario() {
		if (pryProyecto == null || pryProyecto.getEstadoEnum()==null) {
			return false;
		}
		
		return !pryProyecto.getEstadoEnum().isTerminal();
	}
	
	public String getTituloPagina() {
		//if(!modoEditarMaestro) return "Proyecto";
		
		if(idProyecto==null) {
			if(this.isCotizando()) {
				return "Nueva cotización";
			} else {
				return "Nuevo proyecto";
			}
		}
		
		String comentarioExtra = "";
		if(pryProyecto!=null && PryProyectoEstado.PENDIENTE_PAGO.getNombre().equals(pryProyecto.getEstado().getNombre()) &&
				pryProyecto.getFechaPago()==null) {
			comentarioExtra = " - pendiente de pago.";
		}
		
		return "Código de proyecto:" + idProyecto + comentarioExtra;
	}

	public String getInfoRegistroActual() {
		if(idProyecto!=null) {
			return pryProyecto.getIdProyecto().toString();
		}
		
		return "Nuevo";
	}
	
	public List<CatMaestro> getListaBancos(){
		if(listaBancos==null) {
			listaBancos = servicioComun.listarCatalogosPorTipo("ID_BANCO");
		}
		
		return listaBancos;
	}
	
	public List<CatMaestro> getListaMonedas(){
		if(listaMonedas==null) {
			listaMonedas = servicioComun.listarCatalogosPorTipo("ID_MONEDA");
		}
		
		return listaMonedas;
	}
	
	public List<String> getListaMaterialesMejora(){
		if(listaMaterialesMejora==null) {
			listaMaterialesMejora = servicioComun.listarStringCatalogosPorTipo("ID_TIPO_MATERIAL");
		}
		
		return listaMaterialesMejora;
	}
	
	public List<String> getListaEspaciosMejora(){
		if(listaEspaciosMejora==null) {
			listaEspaciosMejora = servicioComun.listarStringCatalogosPorTipo("ID_ESPACIO_VIVIENDA");
		}
		
		return listaEspaciosMejora;
	}
	
	public boolean isCotizando() {
		if(pryProyecto.getEstado()==null || PryProyectoEstado.COTIZANDO.getNombre().equals(pryProyecto.getEstado().getNombre())) {
			return true;
		}
		
		return false;
	}
	
	public String getTituloBotonGuardar() {
		if(isCotizando()) {
			return "Guardar y Cotizar";
		}
		
		return "Guardar";
	}
}
