package DAO;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import Model.Camisa;
import Model.Empleado;
import Model.Entrega;
import Model.Factura;
import Model.Lote;
import Model.Pedido;

public class pruebas {
    public static void main(String[] args) {
        //System.out.println("Vamos a asignarle un empleaodo al pedido 3");
        //crear();
        // ingresarLote();
        // listarLotes();
        // ingresarLote();
        // ingresarPedido();
        // listarPedidos();
        // modificarPedido();
        // modificar(2, null, "activo");
        // listarPedidosAsignadosEmpleado(2);
        // buscarPedido(2);
        // nuevaEntrega();
        // verEntregas();
        // crearFactura();
        // listarFacturas();
        // agregarCamisa();
        // listarCamisasPedido(3);
        // consultarDisponibles();
        //asignarEmpleado();
        //validarUsuario("admin@gmail.com", "abi");
        //listarColores();
        //listarTallas();
        cantidadDeCamisas("verde", "m");
    }

    public static void crear() {
        LocalDate fecha = LocalDate.of(2023, 12, 4);
        Empleado e = new Empleado("1010075365", "Jakeline", "Escudero Mantilla", "jakelinescudero@gmail.com", "3142981659", "user8", fecha, null);
        EmpleadoDAO Ed = new EmpleadoDAO();
        e.toString();
        try {
            boolean agrego = Ed.agregarEmpleado(e);
            System.out.println("la variable es : " + agrego);
            if (agrego) {
                System.out.println("Se creo un empleado wey");
            }
        } catch (Exception ex) {
            System.out.println("algo ta mal como sospechabas");
        }
    }

    public static void listar() {
        EmpleadoDAO ED = new EmpleadoDAO();
        List<Empleado> empleados = ED.listarEmpleados();
        List<Empleado> otraListaEmpleados = new ArrayList<>();
        otraListaEmpleados.addAll(empleados);

        Iterator<Empleado> iterator = otraListaEmpleados.iterator();
        while (iterator.hasNext()) {
            Empleado empleado = iterator.next();
            System.out.println(empleado.toString()); // Llama automáticamente a empleado.toString()
            System.out.println("--------------------------------------");
        }

    }

    public static void buscarEmpleado(int id) {
        EmpleadoDAO ED = new EmpleadoDAO();
        Empleado e = ED.verEmpleado(id);
        System.out.println(e.toString());
    }

    public static void modificar(int id, String telefono, String estado) {
        Empleado e = new Empleado();
        EmpleadoDAO ED = new EmpleadoDAO();
        e.setId_empleado(id);
        e.setEstado(estado);
        e.setTelefono(telefono);
        ED.editarEmpleado(e);

    }

    public static void ingresarLote() {
        LocalDate fecha = LocalDate.of(2023, 10, 13);
        System.out.println(fecha);
        Lote l = new Lote(fecha, "rojo", "M", 30, 200000);
        LoteDAO LD = new LoteDAO();
        LD.ingresar(l);
    }

    public static void listarLotes() {
        LoteDAO ED = new LoteDAO();
        List<Lote> lotes = ED.listarIngresos();
        List<Lote> otraLista = new ArrayList<>();
        otraLista.addAll(lotes);

        Iterator<Lote> iterator = otraLista.iterator();
        while (iterator.hasNext()) {
            Lote lote = iterator.next();
            System.out.println(lote.toString());
            System.out.println("--------------------------------------");
        }

    }

    public static void listarLotesColor(String color) {
        LoteDAO ED = new LoteDAO();
        List<Lote> lotes = ED.ListarColor(color);
        List<Lote> otraLista = new ArrayList<>();
        otraLista.addAll(lotes);

        Iterator<Lote> iterator = otraLista.iterator();
        while (iterator.hasNext()) {
            Lote lote = iterator.next();
            System.out.println(lote.toString());
            System.out.println("--------------------------------------");
        }

    }

    public static void ingresarPedido() {
        Pedido p = new Pedido("Kamil", 3, "calle 15 #5-015 LA PALMITA", LocalDate.of(2023, 11, 23));
        PedidoDAO PD = new PedidoDAO();
        PD.registrarPedido(p);
    }

    public static void listarPedidos() {
        PedidoDAO ped = new PedidoDAO();
        List<Pedido> pedidos = ped.listarPedidos();
        List<Pedido> otraLista = new ArrayList<>();
        otraLista.addAll(pedidos);
        Iterator<Pedido> iterator = otraLista.iterator();
        while (iterator.hasNext()) {
            Pedido pedido = iterator.next();
            System.out.println(pedido.toString());
            System.out.println("--------------------------------------");
        }

    }

    public static void modificarPedido() {
        // Pedido p = new Pedido(2, 2, null, 0, null, null, null, "asignado");
        // PedidoDAO PD = new PedidoDAO();
        // PD.modificarPedido(p);
    }

    public static void listarPedidosAsignadosEmpleado(int id) {
        EmpleadoDAO e = new EmpleadoDAO();
        List<Pedido> pedidos = e.listarPedidosAsigandos(id);
        List<Pedido> otraLista = new ArrayList<>();
        otraLista.addAll(pedidos);
        Iterator<Pedido> iterator = otraLista.iterator();
        while (iterator.hasNext()) {
            Pedido pedido = iterator.next();
            System.out.println(pedido.toString());
            System.out.println("--------------------------------------");
        }

    }

    public static void buscarPedido(int id) {
        PedidoDAO ped = new PedidoDAO();
        Pedido p = ped.buscarPedido(id);
        System.out.println(p.toString());
    }

    public static void nuevaEntrega() {
        Entrega e = new Entrega(1, 2, LocalDate.of(2023, 12, 5), 0, "todo salió bien");
        EntregaDAO ED = new EntregaDAO();
        ED.registrarEntrega(e);
    }

    public static void verEntregas() {
        EntregaDAO ED = new EntregaDAO();
        List<Entrega> pedidos = ED.listarEntregas();
        List<Entrega> otraLista = new ArrayList<>();
        otraLista.addAll(pedidos);
        Iterator<Entrega> iterator = otraLista.iterator();
        while (iterator.hasNext()) {
            Entrega pedido = iterator.next();
            System.out.println(pedido.toString());
            System.out.println("--------------------------------------");
        }
    }

    public static void crearFactura() {
        //Factura f = new Factura(2, "camila@gmail.com", 50000, LocalDate.of(2023, 11, 24));
        FacturaDAO fac = new FacturaDAO();
        //if (fac.generarFactura(f)) {
            System.out.println("se creo una factura");
        //} else {
        //    System.out.println("Algo falló we");
        //}
    }

    public static void listarFacturas() {
        FacturaDAO fac = new FacturaDAO();
        List<Factura> facturas = fac.listarFacturas();
        List<Factura> otraLista = new ArrayList<>();
        otraLista.addAll(facturas);

        Iterator<Factura> iterator = otraLista.iterator();
        while (iterator.hasNext()) {
            Factura lote = iterator.next();
            System.out.println(lote.toString());
            System.out.println("--------------------------------------");
        }
    }

    public static void agregarCamisa() {
        Camisa c = new Camisa(0, 3, "s", "rojo", "sublimado", null);
        CamisaDAO cd = new CamisaDAO();
        cd.agregarCamisa(c);

    }

    public static void listarCamisasPedido(int id) {
        PedidoDAO e = new PedidoDAO();
        List<Camisa> pedidos = e.listarCamisasPedido(id);
        List<Camisa> otraLista = new ArrayList<>();
        otraLista.addAll(pedidos);
        Iterator<Camisa> iterator = otraLista.iterator();
        while (iterator.hasNext()) {
            Camisa pedido = iterator.next();
            System.out.println(pedido.toString());
            System.out.println("--------------------------------------");
        }

    }

    public static void consultarDisponibles() {
       // PedidoDAO ped = new PedidoDAO();
        //if (ped.consultarDisponibles(3)) {
           // System.out.println("hay camisas disponibles");
        //}
    }

    public static void asignarEmpleado() {
        PedidoDAO ped = new PedidoDAO();
        ped.asignarEmpleado(4, 4);

    }

    public static void validarUsuario(String correo, String contraseña){
        EmpleadoDAO em= new EmpleadoDAO();
        boolean usuario= em.validarUsuario(correo, contraseña);
        if(usuario){
            System.out.println("wey si existe ese usaurio");
        }
        else{
            System.out.println("nanaiii no existe");
        }
    }
    
    public static void listarColores(){
        LoteDAO l = new LoteDAO();
        List<String> colores = l.colores();
        System.out.println("estos son los colores disponibles: "+ colores.toString());
        
    }

      public static void listarTallas(){
        LoteDAO l = new LoteDAO();
        List<String> colores = l.tallas();
        System.out.println("estos son las tallas disponibles: "+ colores.toString());
        
    }

    public static void cantidadDeCamisas(String color, String talla){
        LoteDAO l = new LoteDAO();
        int cantidad= l.buscarInventario(color, talla);
        System.out.println("Del color : "+ color + " y la talla: "+ talla + " hay : "+ cantidad + " de camisas");
    }
    

}
