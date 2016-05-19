package Dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class TarifaEspecial extends Tarifa {
	
	new(Double unValor) {
		super(unValor)
	}
	
	new (Double unValor, Double unDescuento){
		super (unValor, unDescuento)
	}
	
	override precioFinal(Date salidaVuelo, Date reservaAsiento){
		precio - descuento
	}
	
}