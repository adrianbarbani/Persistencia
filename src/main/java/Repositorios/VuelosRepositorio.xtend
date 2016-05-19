package Repositorios

import Dominio.Aeropuerto
import Dominio.Busqueda
import Dominio.Usuario
import Dominio.Vuelo
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable 
class VuelosRepositorio {
	static VuelosRepositorio repositorio = null

	List<Vuelo> todosLosVuelos
	List<Busqueda> busquedasRealizadas
	
	List<Vuelo> vuelosBuffer


	protected  new(){
		todosLosVuelos = new ArrayList<Vuelo>
		busquedasRealizadas = new ArrayList<Busqueda>
		vuelosBuffer = new ArrayList<Vuelo>
	}
	
	static public def VuelosRepositorio getInstance() {
		if (repositorio == null) {
			repositorio = new VuelosRepositorio()
		}
      repositorio
	}
	
	def buscar(Busqueda unaBusqueda) {
		iniciarBusqueda()
		
		unaBusqueda.validacionFecha()
		
		vuelosConDestino(unaBusqueda.destino)
		vuelosConOrigen (unaBusqueda.origen)
		vuelosDesdeFecha(unaBusqueda.desdeFecha)
		vuelosHastaFecha(unaBusqueda.hastaFecha)
		vuelosPrecioMax(unaBusqueda.maxPrecio)
		
		finalizarBusqueda(unaBusqueda)
		return	unaBusqueda.resultados
	}
	
	def iniciarBusqueda() {
		vuelosBuffer = todosLosVuelos
	}
	
	def finalizarBusqueda(Busqueda busqueda) {
		agregarBusqueda(busqueda)
		busqueda.setResultados(vuelosBuffer)
	}
	
	def vuelosConDestino(Aeropuerto unDestino){
		if (unDestino != null) {vuelosBuffer = vuelosBuffer.filter[destino == unDestino].toList}
	}
	
	def vuelosConOrigen(Aeropuerto unOrigen){
		if (unOrigen != null)	{vuelosBuffer = vuelosBuffer.filter[origen == unOrigen].toList}
	}
	
	def vuelosDesdeFecha(Date salida){
		if (salida != null) {vuelosBuffer = vuelosBuffer.filter[!saleAntesQue(salida)].toList}	
	}
	
	def vuelosHastaFecha(Date llegada){
		if (llegada != null) {vuelosBuffer = vuelosBuffer.filter[llegaAntesQue(llegada)].toList}	
	}
	
	def vuelosPrecioMax(Double precioMax){
		if (precioMax != null) {vuelosBuffer = vuelosBuffer.filter[contTarifaMenorA(precioMax)].toList}
	}
		
	def agregarBusqueda(Busqueda busqueda) {
		busquedasRealizadas.add(busqueda)
	}
	
	def busquedasDe(Usuario usr){
		busquedasRealizadas.filter[realizadoPor(usr)].toList
	}
	
	def public agregarVuelo(Vuelo vuelo) {
		todosLosVuelos.add(vuelo)
	}
}