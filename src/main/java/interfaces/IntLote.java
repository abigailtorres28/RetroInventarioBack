package interfaces;

import java.util.List;

import Model.Lote;

public interface IntLote {
    public boolean ingresar(Lote lote);
    public List<Lote> listarIngresos ();
    public List<Lote> ListarColor(String color);
}