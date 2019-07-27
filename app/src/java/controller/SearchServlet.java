/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cliente;
import entity.Company;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ListDistrito;
import model.ListLocation;
import model.ListSearchGarage;

/**
 *
 * @author ronald
 */
@WebServlet(
        name = "SearchServlet",
        urlPatterns = {"/buscar", "/buscar/filter", "/buscar/anuncio"}
)
public class SearchServlet extends HttpServlet {

    private Company company;
    private Cliente cliente;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("href-empresa", "/cliente");
        
        HttpSession sessionCompany;
        sessionCompany = (HttpSession) request.getSession();

        if (sessionCompany.getAttribute("company_session") != null) {
            company = (Company) sessionCompany.getAttribute("company_session");
            request.setAttribute("company_session", company);
            request.setAttribute("href-my-account", "/empresa/dashboard");
        }

        
        if (sessionCompany.getAttribute("cliente_session") != null) {
            cliente = (Cliente) sessionCompany.getAttribute("cliente_session");
            request.setAttribute("cliente_session", cliente);
            request.setAttribute("href-my-account", "/cliente/dashboard");
        }

        String url = request.getServletPath();

        switch (url) {
            case "/buscar":
                this.index(request, response);
                break;
            case "/buscar/filter":
                this.filterByDistrito(request, response);
                break;
            case "/buscar/anuncio":
                this.filterByAnuncio(request, response);

                break;
        }

    }

    /**
     *
     * @param request
     * @param response
     */
    protected void index(HttpServletRequest request, HttpServletResponse response) {

        try {
            ListSearchGarage listSearchGarage = new ListSearchGarage();
            request.setAttribute("listGarage", listSearchGarage.get());
            listarDistritos(request, response);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/search.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(PublishServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void filterByDistrito(HttpServletRequest request, HttpServletResponse response) {

        try {
            String idDistrito = request.getParameter("distrito");
            request.setAttribute("idDistrito", idDistrito);

            ListSearchGarage listSearchGarage = new ListSearchGarage();
            request.setAttribute("listGarage", listSearchGarage.getByDistrito(Integer.parseInt(idDistrito)));
            listarDistritos(request, response);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/search.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(PublishServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void filterByAnuncio(HttpServletRequest request, HttpServletResponse response) {

        try {
            String titulo = request.getParameter("titulo");

            ListSearchGarage listSearchGarage = new ListSearchGarage();
            request.setAttribute("listGarage", listSearchGarage.getByTexto(titulo));
            listarDistritos(request, response);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/search.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(PublishServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void listarDistritos(HttpServletRequest request, HttpServletResponse response) {
        try {
            ListDistrito list = new ListDistrito();
            request.setAttribute("listDistrito", list.get());

        } catch (SQLException ex) {
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
