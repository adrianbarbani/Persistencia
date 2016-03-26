package Vista;

import AppModel.ReservaAsientoAppModel;
import Dominio.Asiento;
import Dominio.Escala;
import Dominio.Vuelo;
import java.awt.Color;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.bindings.PropertyAdapter;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;

@SuppressWarnings("all")
public class ReservaAsiento extends TransactionalDialog<ReservaAsientoAppModel> {
  public ReservaAsiento(final WindowOwner parent, final ReservaAsientoAppModel model) {
    super(parent, model);
  }
  
  protected void addActions(final Panel actionsPanel) {
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    final Panel linea1 = _panel.setLayout(_horizontalLayout);
    Panel _panel_1 = new Panel(linea1);
    VerticalLayout _verticalLayout = new VerticalLayout();
    final Panel columna1 = _panel_1.setLayout(_verticalLayout);
    Label _label = new Label(columna1);
    final Procedure1<Label> _function = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Usuario");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
    Label _label_1 = new Label(columna1);
    ObservableValue<Control, ControlBuilder> _value = _label_1.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value, "unUsuario.nombre");
    Panel _panel_2 = new Panel(linea1);
    VerticalLayout _verticalLayout_1 = new VerticalLayout();
    final Panel columnaX = _panel_2.setLayout(_verticalLayout_1);
    Label _label_2 = new Label(columnaX);
    ObservableValue<Control, ControlBuilder> _value_1 = _label_2.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_1, "unVuelo.origen.pais");
    Label _label_3 = new Label(columnaX);
    ObservableValue<Control, ControlBuilder> _value_2 = _label_3.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_2, "unVuelo.fechaSalida");
    Panel _panel_3 = new Panel(linea1);
    VerticalLayout _verticalLayout_2 = new VerticalLayout();
    final Panel columnaX2 = _panel_3.setLayout(_verticalLayout_2);
    Label _label_4 = new Label(columnaX2);
    ObservableValue<Control, ControlBuilder> _value_3 = _label_4.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_3, "unVuelo.destino.pais");
    Label _label_5 = new Label(columnaX2);
    ObservableValue<Control, ControlBuilder> _value_4 = _label_5.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_4, "unVuelo.fechaLlegada");
    Panel _panel_4 = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout_1 = new HorizontalLayout();
    final Panel linea2 = _panel_4.setLayout(_horizontalLayout_1);
    Panel _panel_5 = new Panel(linea2);
    VerticalLayout _verticalLayout_3 = new VerticalLayout();
    final Panel columna2 = _panel_5.setLayout(_verticalLayout_3);
    Label _label_6 = new Label(columna2);
    final Procedure1<Label> _function_1 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Tramos");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_6, _function_1);
    final Table<Vuelo> table = new Table<Vuelo>(columna2, Vuelo.class);
    Panel _panel_6 = new Panel(columna2);
    final Procedure1<Panel> _function_2 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
        List<Object> _list = new List<Object>(it);
        final Procedure1<List<Object>> _function = new Procedure1<List<Object>>() {
          public void apply(final List<Object> it) {
            Binding<?, Selector<Object>, ListBuilder<Object>> propiedadCondiciones = it.bindItemsToProperty("unVuelo.escalas");
            PropertyAdapter _propertyAdapter = new PropertyAdapter(Escala.class, "destino.pais");
            propiedadCondiciones.setAdapter(_propertyAdapter);
            it.setWidth(150);
            it.setHeight(30);
          }
        };
        ObjectExtensions.<List<Object>>operator_doubleArrow(_list, _function);
      }
    };
    ObjectExtensions.<Panel>operator_doubleArrow(_panel_6, _function_2);
    Column<Vuelo> _column = new Column<Vuelo>(table);
    final Procedure1<Column<Vuelo>> _function_3 = new Procedure1<Column<Vuelo>>() {
      public void apply(final Column<Vuelo> it) {
        it.setTitle("Destino Intermedio");
        it.setFixedSize(200);
        it.bindContentsToProperty("unVuelo.escalas.destino.pais");
      }
    };
    ObjectExtensions.<Column<Vuelo>>operator_doubleArrow(_column, _function_3);
    Column<Vuelo> _column_1 = new Column<Vuelo>(table);
    final Procedure1<Column<Vuelo>> _function_4 = new Procedure1<Column<Vuelo>>() {
      public void apply(final Column<Vuelo> it) {
        it.setTitle("Llegada");
        it.setFixedSize(100);
        it.bindContentsToProperty("fechaLlegada");
      }
    };
    ObjectExtensions.<Column<Vuelo>>operator_doubleArrow(_column_1, _function_4);
    Panel _panel_7 = new Panel(linea2);
    VerticalLayout _verticalLayout_4 = new VerticalLayout();
    final Panel columna3 = _panel_7.setLayout(_verticalLayout_4);
    Label _label_7 = new Label(columna3);
    final Procedure1<Label> _function_5 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Aerolinea");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_7, _function_5);
    Label _label_8 = new Label(columna3);
    ObservableValue<Control, ControlBuilder> _value_5 = _label_8.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_5, "unVuelo.aerolinea");
    Label _label_9 = new Label(mainPanel);
    final Procedure1<Label> _function_6 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Asientos");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_9, _function_6);
    IntegerRange _upTo = new IntegerRange(1, ReservaAsientoAppModel.MAX_ASIENTO);
    final Consumer<Integer> _function_7 = new Consumer<Integer>() {
      public void accept(final Integer i) {
        final Panel filaPanel = new Panel(mainPanel);
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        filaPanel.setLayout(_horizontalLayout);
        ReservaAsientoAppModel _modelObject = ReservaAsiento.this.getModelObject();
        Iterable<Asiento> _asientosDeFila = _modelObject.asientosDeFila((i).intValue());
        final Consumer<Asiento> _function = new Consumer<Asiento>() {
          public void accept(final Asiento asiento) {
            Button _button = new Button(filaPanel);
            final Procedure1<Button> _function = new Procedure1<Button>() {
              public void apply(final Button it) {
                boolean _disponible = asiento.getDisponible();
                if (_disponible) {
                  it.setBackground(Color.GREEN);
                } else {
                  it.setBackground(Color.RED);
                }
                String _string = asiento.toString();
                it.setCaption(_string);
                final Action _function = new Action() {
                  public void execute() {
                    ReservaAsientoAppModel _modelObject = ReservaAsiento.this.getModelObject();
                    _modelObject.setAsientoSeleccionado(asiento);
                  }
                };
                it.onClick(_function);
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
          }
        };
        _asientosDeFila.forEach(_function);
      }
    };
    _upTo.forEach(_function_7);
    Panel _panel_8 = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout_2 = new HorizontalLayout();
    final Panel linea3 = _panel_8.setLayout(_horizontalLayout_2);
    Panel _panel_9 = new Panel(linea3);
    VerticalLayout _verticalLayout_5 = new VerticalLayout();
    final Panel columna4 = _panel_9.setLayout(_verticalLayout_5);
    Label _label_10 = new Label(columna4);
    final Procedure1<Label> _function_8 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Asiento seleccionado");
        it.setForeground(Color.BLUE);
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_10, _function_8);
    Label _label_11 = new Label(columna4);
    ObservableValue<Control, ControlBuilder> _value_6 = _label_11.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_6, "asientoSeleccionado");
    Panel _panel_10 = new Panel(linea3);
    VerticalLayout _verticalLayout_6 = new VerticalLayout();
    final Panel linea4 = _panel_10.setLayout(_verticalLayout_6);
    Label _label_12 = new Label(linea4);
    final Procedure1<Label> _function_9 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Monto a Pagar");
        it.setForeground(Color.BLUE);
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_12, _function_9);
    Label _label_13 = new Label(linea4);
    ObservableValue<Control, ControlBuilder> _value_7 = _label_13.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_7, "asientoSeleccionado.tarifa.precio");
    Panel _panel_11 = new Panel(linea3);
    VerticalLayout _verticalLayout_7 = new VerticalLayout();
    final Panel linea5 = _panel_11.setLayout(_verticalLayout_7);
    Button _button = new Button(linea5);
    final Procedure1<Button> _function_10 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Reservar");
        final Action _function = new Action() {
          public void execute() {
            ReservaAsientoAppModel _modelObject = ReservaAsiento.this.getModelObject();
            _modelObject.reservarAsiento();
            ReservaAsiento.this.accept();
          }
        };
        it.onClick(_function);
        it.setAsDefault();
        it.disableOnError();
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_10);
  }
}
