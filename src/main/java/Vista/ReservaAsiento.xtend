package Vista

import AppModel.ReservaAsientoAppModel
import Dominio.Asiento
import Dominio.Escala
import java.awt.Color
import java.util.List
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ReservaAsiento extends TransactionalDialog<ReservaAsientoAppModel> {

	new(WindowOwner parent, ReservaAsientoAppModel model) {
		super(parent, model)
		title = "Reserva de Asientos"
	}

	override protected addActions(Panel actionsPanel) {
	}

	override protected createFormPanel(Panel mainPanel) {

		this.labelUsuarioOrigenYDestino(mainPanel)

		this.tablaTramosYAerolinea(mainPanel)

		this.asientos(mainPanel)

		this.ultimaLinea(mainPanel)

	}

	protected def ultimaLinea(Panel mainPanel) {
		val linea = new Panel(mainPanel).layout = new HorizontalLayout
		val columna = new Panel(linea).layout = new VerticalLayout

		new Label(columna) => [
			text = "Asiento seleccionado"
			foreground = Color.BLUE
		]
		new Label(columna).value <=> "nombreAsientoSeleccionado"

		val columna2 = new Panel(linea).layout = new VerticalLayout

		new Label(columna2) => [
			text = "Monto a Pagar"
			foreground = Color.BLUE
		]
		new Label(columna2).value <=> "asientoSeleccionadoPrecio"

		val columna3 = new Panel(linea).layout = new VerticalLayout

		new Button(columna3) => [
			caption = "Reservar"
			onClick [| this.refresh // para que cambie el color del asiento verde o rojo.
//				modelObject.reservarAsiento
			]
			setAsDefault
			disableOnError
		]
		
		val columna4 = new Panel(linea).layout = new VerticalLayout
		
		new Button(columna4) => [
			caption = "Volver"
			onClick [| this.accept]
		]

		val linea2 = new Panel(mainPanel).layout = new HorizontalLayout

		new Label(linea2) => [value <=> "alertaReserva" fontSize = 10]
	}

	protected def asientos(Panel mainPanel) {
		val columna = new Panel(mainPanel).layout = new VerticalLayout

		new Label(columna) => [
			text = "Asientos"
			modelObject.filas.forEach [ fila |
				val filaPanel = new Panel(mainPanel)
				filaPanel.layout = new HorizontalLayout
				sortUbicacion(modelObject.asientosDeFila(fila)).forEach [ asiento |
					new Button(filaPanel) => [
						if (asiento.disponible) {
							background = Color.GREEN
						} else {
							background = Color.RED
						}
						caption = asiento.toString
						onClick [|modelObject.asientoSeleccionado = asiento]
					]
				]
			]
		]
	}

	protected def tablaTramosYAerolinea(Panel mainPanel) {
		val linea = new Panel(mainPanel).layout = new HorizontalLayout
		val columna = new Panel(linea).layout = new VerticalLayout

		new Label(columna) => [text = "Tramos"]

		val table = new Table<Escala>(columna, typeof(Escala)) => [
			bindItemsToProperty("unVuelo.escalas")
		]

		new Column<Escala>(table) => [
			title = "Destino Intermedio"
			fixedSize = 200
			bindContentsToProperty("destino.pais")
		]

		new Column<Escala>(table) => [
			title = "Llegada"
			fixedSize = 200
			bindContentsToProperty("horaLlegadaStr")
		]

		val columna2 = new Panel(linea).layout = new VerticalLayout
		new Label(columna2) => [
			text = "Aerolinea"
		]
		new Label(columna2).value <=> "unVuelo.aerolinea"
		linea

	}

	protected def labelUsuarioOrigenYDestino(Panel mainPanel) {
		val linea = new Panel(mainPanel).layout = new HorizontalLayout
		val columna1 = new Panel(linea).layout = new VerticalLayout
		new Label(columna1) => [text = "Usuario"]
		new Label(columna1).value <=> "unUsuario.nombre"

		val columna2 = new Panel(linea).layout = new VerticalLayout

		new Label(columna2).value <=> "unVuelo.origen.pais"
		new Label(columna2).value <=> "unVuelo.fechaSalidaStr"

		val columna3 = new Panel(linea).layout = new VerticalLayout

		new Label(columna3).value <=> "unVuelo.destino.pais"
		new Label(columna3).value <=> "unVuelo.fechaLlegadaStr"
		linea
	}
	
	def refresh() { 
		if(modelObject.reservarAsiento){
			this.accept
			new ReservaAsiento(this, modelObject).open			
		}
	}
	
	def sortUbicacion(Iterable<Asiento> asientos){
		var List<Asiento> asientosOrdenados =  newArrayList
		asientosOrdenados =>[
			add(0,asientos.findFirst[ubicacion.equals("Ventanilla")])
			add(1,asientos.findFirst[ubicacion.equals("Centro")])
			add(2,asientos.findFirst[ubicacion.equals("Pasillo")])
		]
		asientosOrdenados
	}
	
}