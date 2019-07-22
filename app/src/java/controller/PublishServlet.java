/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Company;
import entity.Garage;
import entity.Location;
import entity.ParkingGarage;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ListLocation;
import model.ParkingAnnouncement;

/**
 *
 * @author ronald
 */
@WebServlet(name = "publish", urlPatterns = {"/publicar", "/publicar/create", "/publicar/listar-activo"})
@MultipartConfig
public class PublishServlet extends HttpServlet {

    private RequestDispatcher dispatcher;
    private Company company;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {

        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setAttribute("href-empresa", "/empresa/registrar");
            request.setAttribute("href-my-account", "/empresa/dashboard");
            HttpSession sessionCompany;
            sessionCompany = (HttpSession) request.getSession();
            company = (Company) sessionCompany.getAttribute("company_session");
            request.setAttribute("company_session", company);
            String url = request.getServletPath();
            switch (url) {
                case "/publicar":
                    this.publicar(request, response);
                    break;
                case "/publicar/create":
                    this.createPublicar(request, response);
                    break;
                case "/publicar/listar-activo":
                    this.listarActivos(request, response);

                    break;
            }
            RequestDispatcher disp = request.getRequestDispatcher("/view/publish.jsp");
            disp.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(PublishServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void publicar(HttpServletRequest request, HttpServletResponse response) {

        try {
            ListLocation listLocation = new ListLocation();
            request.setAttribute("listLocation", listLocation.get());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/publish.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            Logger.getLogger(PublishServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void createPublicar(HttpServletRequest request, HttpServletResponse response) {
        try {
            String title = request.getParameter("title");
            String district = request.getParameter("district");
            String address = request.getParameter("address");
            String banner = request.getParameter("banner");

            String price = request.getParameter("price");
            String discont = request.getParameter("discont");

            ListLocation listLocation = new ListLocation();
            String nGarage = request.getParameter("n_garage");

            Garage garage = new Garage();
            garage.setName(title);
            garage.setCompany(company);
            garage.setAddress(address);
            int district_id = Integer.parseInt(district);
            Location location = (Location) listLocation.getById(district_id);
            garage.setLocation(location);
            garage.setNumberOfVehicles(Integer.parseInt(nGarage));
            garage.setCreationDate();

            ParkingGarage parkingGarage = new ParkingGarage();
            parkingGarage.setDiscount(Integer.parseInt(discont));
            parkingGarage.setPrice(Integer.parseInt(price));

            ParkingAnnouncement parkingAnnouncement = new ParkingAnnouncement();
            parkingAnnouncement.create(garage, parkingGarage);
            ServletContext sc = getServletContext();
            sc.getRequestDispatcher("/empresa/dashboard").forward(request, response);
        } catch (SQLException | IOException | ServletException ex) {
            Logger.getLogger(PublishServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void listarActivos(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher disp = request.getRequestDispatcher("/view/list-active.jsp");

            disp.forward(request, response);
        } catch (ServletException | IOException ex) {
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
