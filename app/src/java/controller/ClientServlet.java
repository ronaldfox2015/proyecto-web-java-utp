/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cliente;
import entity.Company;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ModelCliente;

/**
 *
 * @author Lucia&Angel:D
 */
@WebServlet(name = "ClientServlet", urlPatterns = {"/cliente", "/cliente/registrar", "/cliente/dashboard"})
public class ClientServlet extends HttpServlet {

    private RequestDispatcher dispatcher;
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
        String url = request.getServletPath();
        request.setAttribute("href-empresa","/cliente");
        request.setAttribute("href-empresa", "/cliente/registrar");
        HttpSession sessionCliente;
        sessionCliente = (HttpSession) request.getSession();
        Cliente cliente = (Cliente) sessionCliente.getAttribute("company_session");
        request.setAttribute("company_session", cliente);
         switch (url) {
            case "/cliente":
                this.registrationForm(request, response);
                break;
            case "/cliente/registrar":
                this.registrarCliente(request,response);
                break;
            case "/cliente/dashboard":
                this.clienteForm(request, response);
         }
    }
    
    protected void registrarCliente(HttpServletRequest request, HttpServletResponse response){
        
        try {
            ModelCliente modelcli = new ModelCliente();
            User user = new User();
            Cliente cliente = new Cliente();
            cliente.setDni(request.getParameter("dni"));
            cliente.setCelular(request.getParameter("celular"));
            user.setRole("cliente-user");
            user.setLastName(request.getParameter("apellido"));
            user.setName(request.getParameter("nombre"));
            user.setPassword(request.getParameter("password"));
            user.setMail(request.getParameter("email"));
            user.creationDate();
            cliente.setUser(user);
            modelcli.register(cliente);
            
            HttpSession sessionCliente;
            sessionCliente = request.getSession(true);
            sessionCliente.setAttribute("company_session", cliente);

            request.getRequestDispatcher("/cliente/dashboard").forward(request, response);

        } catch (ServletException ex) {
            Logger.getLogger(CompanyServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ClientServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    protected void registrationForm(HttpServletRequest request, HttpServletResponse response) {

        dispatcher = request.getRequestDispatcher(
                "/view/register-cliente.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(CompanyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void clienteForm(HttpServletRequest request, HttpServletResponse response) {

        dispatcher = request.getRequestDispatcher(
                "/view/clienteDash.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(CompanyServlet.class.getName()).log(Level.SEVERE, null, ex);
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
