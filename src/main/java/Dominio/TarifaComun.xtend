package Dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Date

@Accessors
@Observable
class TarifaComun extends Tarifa {
	
	new(Double unValor) {
		super(unValor)
	}
	
	override precioFinal(Date salidaVuelo, Date reservaAsiento){
		return precio
	}
	
}