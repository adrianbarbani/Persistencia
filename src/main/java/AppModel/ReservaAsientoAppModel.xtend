package AppModel

import Dominio.Asiento
import Dominio.Reserva
import Dominio.Usuario
import Dominio.Vuelo
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class ReservaAsientoAppModel {

	Vuelo unVuelo
	Usuario unUsuario
	Asiento asientoSeleccionado
	String alertaReserva
	
	new(Usuario usr, Vuelo vuelo) {
		unUsuario = usr
		unVuelo = vuelo
	}

	def getAsientos() {
		unVuelo.asientos	
	}
	
	def asientosDeFila(int filaPedida) {
		asientos.filter[it.fila == filaPedida]
	}

	def reservarAsiento() {
		if(asientoSeleccionado.disponible){
		  unUsuario.reservar(new Reserva(asientoSeleccionado))
		  alertaReserva = "Se reservo con exito el asiento" + asientoSeleccionado.toString()
		  true
		}else {
			alertaReserva = "El Asiento ya se encuentra reservado (está en rojo!!!)"
			false
		}
	}

	def cantidadAsientos() {
		asientos.size
	}
	
	def filas(){
		asientos.map[fila].toSet.sort
	}

	@Dependencies("asientoSeleccionado")
	def getAsientoSeleccionadoPrecio() {
		if (asientoSeleccionado == null) {
			return "--"
		} else {
			return Math.round(asientoSeleccionado.getPrecio()).toString // redondeo para que se vea mejor
		}
	}

	@Dependencies("asientoSeleccionado")
	def getNombreAsientoSeleccionado() {
		if (asientoSeleccionado == null) {
			return "--"
		} else {
			return asientoSeleccionado.toString()
		}
	}

}
