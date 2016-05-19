package Dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
abstract class Tarifa {
	
	Double descuento
	Double precio
	String tipo 

	new(Double unValor) {
		precio = unValor
	}

	new(Double unValor, Double otroValor) {
		precio = unValor
		descuento = otroValor
	}

	def Double precioFinal(Date salidaVuelo, Date reservaAsiento) {
		0.0
	}
	
}