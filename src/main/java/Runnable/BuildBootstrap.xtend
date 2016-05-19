package Runnable

import Dominio.Aeropuerto
import Dominio.Asiento
import Dominio.Escala
import Dominio.Reserva
import Dominio.TarifaBandaNegativa
import Dominio.TarifaComun
import Dominio.TarifaEspecial
import Dominio.Usuario
import Dominio.Vuelo
import Repositorios.AeropuertosRepositorio
import Repositorios.UsuarioRepositorio
import Repositorios.VuelosRepositorio
import java.util.ArrayList
import java.util.Calendar
import java.util.GregorianCalendar
import java.util.List
import org.uqbar.arena.bootstrap.Bootstrap

class BuildBootstrap implements Bootstrap{
	
	Aeropuerto ezeiza
	Aeropuerto costanera
	Aeropuerto ricafort
	Aeropuerto brazuca
	Aeropuerto gotze
	Aeropuerto ponja

	Usuario usr
	Usuario gabo
	Usuario fede

	Escala escala1
	Escala escala2
	Escala escala3
	Escala escala4
	Escala escala5
	Escala escala6
	Escala escala7

	Vuelo aeroArgVuelo
	Vuelo lanVuelo
	Vuelo emiratesVuelo
	Vuelo malasyaVuelo
	Vuelo peruvianVuelo
	
	Asiento asiento1
	Asiento asiento2
	Asiento asiento3
	Asiento asiento4
	Asiento asiento5
	Asiento asiento6
	Asiento asiento7

	TarifaComun tarifa_1
	TarifaComun tarifaComunUnPeso
	TarifaComun tarifa_3
	TarifaEspecial tEspecial_1
	TarifaEspecial tEspecial_2
	TarifaEspecial tEspecial_3
	TarifaBandaNegativa tBNegativa_1
	TarifaBandaNegativa tBNegativa_2
	TarifaBandaNegativa tBNegativa_3

	override run() {
		initAeropuertos
		initTarifas
		initEscalas
		initVuelos
		initAsientos
		initUsuarios
	}
	
	def initAeropuertos() {
		ezeiza = new Aeropuerto("Ezeiza", "Buenos Aires")
		costanera = new Aeropuerto("Aeroparque", "Buenos Aires")
		ricafort = new Aeropuerto("Miami International Airport", "Miami")
		brazuca = new Aeropuerto("Aeroporto Internacional de São Paulo", "San Pablo")
		gotze = new Aeropuerto("Aeropuerto Internacional de Múnich", "Munich")
		ponja = new Aeropuerto("Aeropuerto Internacional Haneda", "Tokio")
		
		AeropuertosRepositorio.instance => [
			agregarAeropuerto(ezeiza)
			agregarAeropuerto(costanera)
			agregarAeropuerto(ricafort)
			agregarAeropuerto(brazuca)
			agregarAeropuerto(gotze)
			agregarAeropuerto(ponja)
		]
	}
	
	def initTarifas() {
		tarifa_1 = new TarifaComun(150.0)
		tarifaComunUnPeso = new TarifaComun(1.0)
		tarifa_3 = new TarifaComun(532.0)
		tEspecial_1 = new TarifaEspecial(543.0, 44.0)
		tEspecial_2 = new TarifaEspecial(56.0, 8.0)
		tEspecial_3 = new TarifaEspecial(742.0, 345.0)
		tBNegativa_1 = new TarifaBandaNegativa(99.0)
		tBNegativa_2 = new TarifaBandaNegativa(1235.0)
		tBNegativa_3 = new TarifaBandaNegativa(15.0)
	}
	
	def initEscalas() {
		escala1 = new Escala()
		escala2 = new Escala()
		escala3 = new Escala()
		escala4 = new Escala()
		escala5 = new Escala()
		escala6 = new Escala()
		escala7 = new Escala()

		escala1 => [
			horaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 7).getTime();
			destino = brazuca
		]
		escala2 => [
			horaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 8).getTime();
			destino = gotze
		]
		escala3 => [
			horaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 6).getTime();
			destino = ricafort
		]
		escala4 => [
			horaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 5).getTime();
			destino = ezeiza
		]
		escala5 => [
			horaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 4).getTime();
			destino = brazuca
		]
		escala6 => [
			horaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 9).getTime();
			destino = ponja
		]
		escala7 => [
			horaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 22).getTime();
			destino = costanera
		]
	}
	
	def initVuelos() {
		aeroArgVuelo = new Vuelo()
		aeroArgVuelo => [
			agregarEscala(escala1)
			aerolinea = "Aerolineas Argentinas"
			origen = ezeiza
			destino = ricafort
			fechaSalida = new GregorianCalendar(2016, Calendar.MARCH, 21).getTime();
			fechaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 23).getTime();
		]

		lanVuelo = new Vuelo()
		lanVuelo => [
			agregarEscala(escala2)
			aerolinea = "LAN Airlines"
			origen = costanera
			destino = ponja
			fechaSalida = new GregorianCalendar(2016, Calendar.MARCH, 7).getTime();
			fechaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 15).getTime();
		]
		
		emiratesVuelo = new Vuelo()
		emiratesVuelo =>[
			agregarEscala(escala3)
			agregarEscala(escala4)
			aerolinea = "Fly Emirates"
			origen = ricafort
			destino = brazuca
			fechaSalida = new GregorianCalendar(2016, Calendar.MARCH, 10).getTime();
			fechaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 22).getTime();
		]
		malasyaVuelo = new Vuelo()
		malasyaVuelo =>[
			agregarEscala(escala5)
			aerolinea = "Malasya Airlines"
			origen = gotze
			destino = ezeiza
			fechaSalida = new GregorianCalendar(2016, Calendar.MARCH, 3).getTime();
			fechaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 6).getTime();
		]
		peruvianVuelo = new Vuelo()
		peruvianVuelo =>[
			agregarEscala(escala6)
			agregarEscala(escala7)
			aerolinea = "Peruvian Airlines"
			origen = brazuca
			destino = ponja
			fechaSalida = new GregorianCalendar(2016, Calendar.MARCH, 9).getTime();
			fechaLlegada = new GregorianCalendar(2016, Calendar.MARCH, 20).getTime();
		]
		
		VuelosRepositorio.instance => [
			agregarVuelo(aeroArgVuelo)
			agregarVuelo(lanVuelo)
			agregarVuelo(emiratesVuelo)
			agregarVuelo(malasyaVuelo)
			agregarVuelo(peruvianVuelo)
		]
	}

	def initAsientos() {
		asiento1 = new Asiento(1, "Pasillo", tarifa_1)
		asiento2 = new Asiento(1, "Centro", tEspecial_1)
		asiento3 = new Asiento(1, "Ventanilla", tBNegativa_1)
		asiento4 = new Asiento(9, "Pasillo", tarifaComunUnPeso)
		asiento5 = new Asiento(9, "Centro", tarifa_1)
		asiento6 = new Asiento(9, "Ventanilla", tBNegativa_2)
		asiento7 = new Asiento(9, "Ventanilla", tEspecial_2)

		var List<Asiento> asientosAA = new ArrayList<Asiento>
		asientosAA => [
			add(asiento1)
			add(asiento3)
			add(new Asiento(1, "Centro", tBNegativa_1))
			add(new Asiento(2, "Pasillo", tEspecial_2))
			add(new Asiento(2, "Centro", tBNegativa_3))
			add(new Asiento(2, "Ventanilla", tEspecial_1))
			add(new Asiento(3, "Pasillo", tarifa_1))
			add(new Asiento(3, "Centro", tBNegativa_2))
			add(new Asiento(3, "Ventanilla", tEspecial_3))
			add(new Asiento(4, "Pasillo", tEspecial_3))
			add(new Asiento(4, "Centro", tBNegativa_1))
			add(new Asiento(4, "Ventanilla", tarifa_3))
			add(new Asiento(5, "Pasillo", tEspecial_1))
			add(new Asiento(5, "Centro", tarifa_1))
			add(new Asiento(5, "Ventanilla", tarifa_3))
		]
		asientosAA.forEach[setVuelo(aeroArgVuelo)]
		aeroArgVuelo.asientos = asientosAA
		
		var List<Asiento> asientosLAN = new ArrayList<Asiento>
		asientosLAN => [
			add(asiento4)
			add(asiento6)
			add(new Asiento(2, "Pasillo", tEspecial_2))
			add(new Asiento(2, "Centro", tBNegativa_3))
			add(new Asiento(2, "Ventanilla", tEspecial_1))
			add(new Asiento(3, "Pasillo", tarifa_1))
			add(new Asiento(3, "Centro", tBNegativa_2))
			add(new Asiento(3, "Ventanilla", tEspecial_3))
			add(new Asiento(6, "Pasillo", tarifa_1)) 
			add(new Asiento(6, "Centro", tBNegativa_3))
			add(new Asiento(6, "Ventanilla", tEspecial_2)) 
			add(new Asiento(7, "Pasillo", tBNegativa_2))
			add(new Asiento(7, "Centro", tarifa_1))
			add(new Asiento(7, "Ventanilla", tarifa_3))
			add(new Asiento(8, "Pasillo", tBNegativa_1))
			add(new Asiento(8, "Centro", tEspecial_1))
			add(new Asiento(8, "Ventanilla", tarifaComunUnPeso))
			add(new Asiento(9, "Centro", tEspecial_2))
			]
		asientosLAN.forEach[setVuelo(lanVuelo)]
		lanVuelo.asientos = asientosLAN
		
		var List<Asiento> asientosEmirates = new ArrayList<Asiento>
		asientosEmirates => [
			add(asiento5)
			add(asiento7)
			add(new Asiento(1, "Pasillo", tarifa_1))
			add(new Asiento(1, "Centro", tBNegativa_1))
			add(new Asiento(1, "Ventanilla", tEspecial_2))
			add(new Asiento(2, "Pasillo", tEspecial_2))
			add(new Asiento(2, "Centro", tBNegativa_3))
			add(new Asiento(2, "Ventanilla", tEspecial_1))
			add(new Asiento(3, "Pasillo", tarifa_1))
			add(new Asiento(3, "Centro", tBNegativa_2))
			add(new Asiento(3, "Ventanilla", tEspecial_3))
			add(new Asiento(4, "Pasillo", tarifa_3))
			add(new Asiento(4, "Centro", tBNegativa_1))
			add(new Asiento(4, "Ventanilla", tarifa_3))
			add(new Asiento(5, "Pasillo", tEspecial_1))
			add(new Asiento(5, "Centro", tarifa_1))
			add(new Asiento(5, "Ventanilla", tarifa_3))
			add(new Asiento(9, "Pasillo", tarifa_1))
		]
		asientosEmirates.forEach[setVuelo(emiratesVuelo)]
		emiratesVuelo.asientos = asientosEmirates
		
		var List<Asiento> asientosMalasya = new ArrayList<Asiento>
		asientosMalasya => [
			add(asiento2)
			add(new Asiento(1, "Pasillo", tEspecial_2))
			add(new Asiento(1, "Ventanilla", tEspecial_1))
			add(new Asiento(3, "Pasillo", tarifa_1))
			add(new Asiento(3, "Centro", tBNegativa_2))
			add(new Asiento(3, "Ventanilla", tEspecial_3))
			add(new Asiento(6, "Pasillo", tarifa_1)) 
			add(new Asiento(6, "Centro", tBNegativa_3))
			add(new Asiento(6, "Ventanilla", tEspecial_2)) 
			add(new Asiento(7, "Pasillo", tBNegativa_2))
			add(new Asiento(7, "Centro", tarifa_1))
			add(new Asiento(7, "Ventanilla", tarifa_3))
			add(new Asiento(9, "Pasillo", tBNegativa_3))
			add(new Asiento(9, "Centro", tEspecial_2))
			add(new Asiento(9, "Ventanilla", tarifaComunUnPeso))
			]
		asientosMalasya.forEach[setVuelo(malasyaVuelo)]
		malasyaVuelo.asientos = asientosMalasya
		
		var List<Asiento> asientosPeruv = new ArrayList<Asiento>
		asientosPeruv => [
			add(new Asiento(3, "Pasillo", tarifa_1))
			add(new Asiento(3, "Centro", tBNegativa_2))
			add(new Asiento(3, "Ventanilla", tEspecial_3))
			add(new Asiento(6, "Pasillo", tarifa_1)) 
			add(new Asiento(6, "Centro", tBNegativa_3))
			add(new Asiento(6, "Ventanilla", tEspecial_2)) 
			add(new Asiento(7, "Pasillo", tBNegativa_2))
			add(new Asiento(7, "Centro", tarifa_1))
			add(new Asiento(7, "Ventanilla", tarifa_3))
			add(new Asiento(8, "Pasillo", tBNegativa_1))
			add(new Asiento(8, "Centro", tEspecial_1))
			add(new Asiento(8, "Ventanilla", tarifaComunUnPeso))
			]
		asientosPeruv.forEach[setVuelo(peruvianVuelo)]
		peruvianVuelo.asientos = asientosPeruv
	}

	def initUsuarios() {
		gabo = new Usuario("gabo", "gabo")
		gabo.nombre = "Gabriel Perez"
		usr = new Usuario("adrian", "adrian")
		usr.nombre = "Adrian Barbani"
		fede = new Usuario("fede", "fede")
		fede.nombre = "Federico Peña"
	
		UsuarioRepositorio.instance =>[
			agregarUsuario(gabo)
			agregarUsuario(usr)
			agregarUsuario(fede)
		]
		
		var List<Reserva> reservasParaUsr = new ArrayList<Reserva>
		reservasParaUsr => [
			add(new Reserva(asiento1))
			add(new Reserva(asiento2))
			add(new Reserva(asiento3))
		]
		reservasParaUsr.forEach[usr.reservar(it)]

		var List<Reserva> reservasParaGabo = new ArrayList<Reserva>
		reservasParaGabo => [
			add(new Reserva(asiento5))
			add(new Reserva(asiento6))
		]
		reservasParaGabo.forEach[gabo.reservar(it)]
		
		var List<Reserva> reservasParaFede = new ArrayList<Reserva>
		reservasParaFede => [
			add(new Reserva(asiento4))
			add(new Reserva(asiento7))
		]
		reservasParaFede.forEach[fede.reservar(it)]
	}

	override isPending() {
		false
	}
}

