package interfaces;

import java.util.List;

import Model.Factura;

public interface IntFacura {
    public boolean generarFactura(Factura f);
    public List<Factura> listarFacturas();    
}