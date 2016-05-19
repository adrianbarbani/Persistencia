package AppModel

import Dominio.Aeropuerto
import Dominio.Busqueda
import Dominio.Usuario
import Dominio.Vuelo
import Repositorios.AeropuertosRepositorio
import Repositorios.VuelosRepositorio
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable	
class BusquedaVueloAppModel {
	
	Usuario usr	
	List <Aeropuerto> todosLosAeropuertos = new ArrayList<Aeropuerto>
	
	Aeropuerto origen
	Aeropuerto destino
	Date fechaDesde
	Date fechaHasta
	Integer tarifaMax
		
	Vuelo vueloSeleccionado
	List <Vuelo> resultados = null
	
	new (Usuario unUsr){
		usr = unUsr
		todosLosAeropuertos = AeropuertosRepositorio.getInstance.todosLosAeropuertos
	}
		
	def buscar() {
		resultados = newArrayList
		var Double precioMaximo = null
		if(tarifaMax != null){precioMaximo = new Double(tarifaMax)} // para poder limpiar el campo
		var Busqueda busqueda = new Busqueda(origen, destino, fechaDesde, fechaHasta, precioMaximo,usr)
		resultados = VuelosRepositorio.getInstance.buscar(busqueda)
		if(resultados.isEmpty){ resultados = null}
	}
	
	def clear(){
		origen = null
		destino = null
		fechaDesde = null
		fechaHasta = null
		tarifaMax = null
	}
}