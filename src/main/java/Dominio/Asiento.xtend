package Dominio

import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import static org.uqbar.commons.model.ObservableUtils.firePropertyChanged

@Accessors
@Observable	
class Asiento {
	
	int fila
	String ubicacion
	boolean disponible = true
	Tarifa tarifa
	Vuelo vuelo
	
	new(int fila, String ubicacion, Tarifa unaTarifa) {
		this.fila = fila
		this.ubicacion = ubicacion
		setTarifa(unaTarifa)	
	}
	
	
	new(int fila, String ubicacion) {
		this.fila = fila
		this.ubicacion = ubicacion
	}
	
	override toString() {
		" " + fila + ubicacion.substring(0,1) + " "
	}
	
	def liberar() {
		 disponible = true
		 firePropertyChanged(this,"disponible",disponible)
	}

	def conPrecioMaximo(Double valor) {
		if (disponible){
			this.getPrecio() <= valor
		}
		else { false }
	}
	
	def Double getPrecio() {
		tarifa.precioFinal(vuelo.fechaSalida, Calendar.getInstance.time)
	}
	
	def setVuelo(Vuelo unVuelo){
		vuelo = unVuelo
	}	

	def reservar() {
		disponible = false
		firePropertyChanged(this,"disponible",disponible)
	}
}
