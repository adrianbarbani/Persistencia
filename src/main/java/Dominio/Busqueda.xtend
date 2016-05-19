package Dominio

import java.util.ArrayList
import java.util.Calendar
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Busqueda {

	Date fechaRealizacion
	public Usuario quienBusca
	public List<Vuelo> resultados = new ArrayList<Vuelo>

	Aeropuerto origen
	Aeropuerto destino
	Date desdeFecha
	Date hastaFecha
	Double maxPrecio

	new (Aeropuerto inicio, Aeropuerto fin, Date desde, Date hasta, Double max, Usuario usr) {
		origen = inicio
		destino = fin
		desdeFecha = desde
		hastaFecha = hasta
		maxPrecio = max
		quienBusca = usr
		fechaRealizacion = Calendar.getInstance.getTime
	}

	def validacionFecha() {
		if (desdeFecha != null && hastaFecha != null) {
			if (desdeFecha > hastaFecha) {throw new UserException("La 'Fecha Desde' no puede ser menor que 'Fecha Hasta' ")}
		}
	}
	
	def realizadoPor(Usuario unUsr){
		quienBusca == unUsr
	}
}
