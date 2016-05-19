	package Dominio

import java.text.SimpleDateFormat
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Vuelo {
	
	Aeropuerto origen
	Aeropuerto destino
	String aerolinea
	List <Asiento> asientos = newArrayList
	Date fechaSalida
	Date fechaLlegada
	List<Escala> escalas = newArrayList
	
	transient static SimpleDateFormat dateToString = new SimpleDateFormat("dd/MM/yyyy - hh:mm 'hs'")
	
	def agregarEscala(Escala escala){
		escalas.add(escala)
	}
		
	def getCantidadDeAsientosLibres(){
		asientos.filter[disponible].toList.size()
	}
	
	def conDestino(String destinoStr) {
		destino.nombre.equals(destinoStr)
	}
	
	def conOrigen(String origenStr){
		origen.nombre.equals(origenStr)
	}
	
	def contTarifaMenorA(Double valor){
		asientos.exists[conPrecioMaximo(valor)]
	}
	
	def asientosValorMaximo (Double valor){
		asientos.filter[conPrecioMaximo(valor)].toList
	}
	
	def llegaAntesQue(Date unaFecha){
		fechaLlegada.before(unaFecha)
	}
	
	def saleAntesQue(Date unaFecha){
		fechaSalida.before(unaFecha)
	}
	
	def getNombreOrigen(){ origen.nombre }
	
	def getNombreDestino(){ destino.nombre }
	
	def getCantidadEscalas(){ escalas.size }
	
	def getFechaSalidaStr(){ dateToString.format(fechaSalida)}
	
	def getFechaLlegadaStr(){ dateToString.format(fechaLlegada) }
	
}