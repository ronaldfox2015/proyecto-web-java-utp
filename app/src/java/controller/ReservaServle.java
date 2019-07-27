/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.JsonObject;
import entity.Cliente;
import entity.Reserva;
import entity.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import library.DtoResponse;
import library.Json;
import model.ListSearchGarage;
import model.ModelCreateVehiculo;

/**
 *
 * @author ronald
 */
@WebServlet(name = "ReservaServle", urlPatterns = {"/reserva"})
public class ReservaServle extends HttpServlet {

    Json json;
    private Object dispatcher;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        json = new Json();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = request.getServletPath();

            switch (url) {
                case "/reserva":
                    this.index(request, response);
                    break;

            }
        }
    }

    /**
     *
     * @param request
     * @param response
     */
    protected void index(HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        try {
            DtoResponse dtoSession = new DtoResponse();
            JsonObject object = new JsonObject();
            out = response.getWriter();

            HttpSession sessionCliente;
            sessionCliente = (HttpSession) request.getSession();
            Cliente cliente = (Cliente) sessionCliente.getAttribute("cliente_session");

            String idCochera = request.getParameter("idCochera");
            String placa = request.getParameter("placa");
            String modelo = request.getParameter("modelo");
            String descripcion = request.getParameter("descripcion");

            Vehiculo vehiculo = new Vehiculo();
            vehiculo.setCliente(cliente);
            vehiculo.setModelo(modelo);
            vehiculo.setPlaca(placa);
            vehiculo.setDescripcion(descripcion);

            Reserva reserva = new Reserva();
            reserva.setIdCochera(Integer.parseInt(idCochera));
            reserva.setVehiculo(vehiculo);
            ModelCreateVehiculo createVehiculo  = new ModelCreateVehiculo();
            createVehiculo.save(vehiculo);
            
            dtoSession.setData(null);
            dtoSession.setMessages("todo ok ");
            dtoSession.setStatus(true);

            String responseJson = this.json.convert(dtoSession);
            out.println(responseJson);
        } catch (IOException ex) {
            Logger.getLogger(PublishServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
