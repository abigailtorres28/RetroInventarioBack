package controller;

import DAO.FacturaDAO;
import Model.Factura;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.font.Standard14Fonts;

@WebServlet("/facturas")
public class FacturaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String cedula = request.getParameter("cedula");
            int precio = Integer.parseInt(request.getParameter("precio"));
            int idPedido = Integer.parseInt(request.getParameter("id"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));

            FacturaDAO fd = new FacturaDAO();
            Factura f = new Factura(idPedido, correo, nombre, cedula, cantidad, precio, fecha);
            fd.generarFactura(f);
            
            PDDocument document = new PDDocument();
            PDPage page = new PDPage();
            document.addPage(page);

            PDPageContentStream contentStream = new PDPageContentStream(document, page);
            contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.COURIER), 15);
            contentStream.beginText();
            contentStream.newLineAtOffset(50, 700);
            contentStream.showText("Nombre: " + nombre);
            contentStream.newLine();
            contentStream.showText("Correo: " + correo);
            contentStream.newLine();
            contentStream.showText("Cedula: " + cedula);
            contentStream.newLine();
            contentStream.showText("Precio: " + precio);
            contentStream.newLine();
            contentStream.showText("ID: " + idPedido);
            contentStream.newLine();
            contentStream.showText("Cantidad: " + cantidad);
            contentStream.newLine();
            contentStream.showText("Fecha: " + fecha);
            contentStream.endText();
            contentStream.close();

            document.save(response.getOutputStream());
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/JSP/facturas.jsp");
    }

}
