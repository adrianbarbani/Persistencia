package Dominio

import java.util.Date
import java.util.GregorianCalendar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Reserva {
	
	Asiento asiento
    Vuelo vuelo
    Date fechaReserva  
    
	new(Asiento unAsiento){
		fechaReserva = GregorianCalendar.instance.time
		unAsiento.reservar()
		asiento = unAsiento
		vuelo = unAsiento.vuelo
	}
	
	def getTramos(){
		vuelo.cantidadEscalas
	}	
	
	def void liberarAsiento(){
		asiento.liberar
	}
	
	def getAsientoDescripcion() {
		asiento.toString
	}
	
	def getOrigen() {
		vuelo.nombreOrigen
	}
	
	def getDestino() {
		vuelo.nombreDestino
	}
	
	def getFechaSalida() {
		vuelo.fechaSalidaStr
	}
	
	def getFechaLlegada() {
		vuelo.fechaLlegadaStr
	}
}