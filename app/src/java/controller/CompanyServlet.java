/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Company;
import entity.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import library.DateTime;
import model.ModelCompany;
import model.ModelUser;
import model.Auth;

/**
 *
 * @author ronald
 */
@WebServlet(
        name = "registerCompany",
        description = "empresa",
        urlPatterns = {
            "/empresa",
            "/empresa/registrar",
            "/empresa/create-acount",
            "/empresa/dasword"
        }
)
public class CompanyServlet extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        String url = request.getServletPath();
        request.setAttribute("href-empresa", "/empresa/registrar");
        request.setAttribute("href-my-account", "/empresa/mi-cuenta");
        HttpSession sessionCompany;
        sessionCompany = (HttpSession) request.getSession();

        switch (url) {
            case "/empresa/create-acount":
                this.createAccount(request, response);
                break;
            case "/empresa/dasword":
                Company company = (Company) sessionCompany.getAttribute("company_session");
                request.setAttribute("company_session", company);
                if (company != null) {
                    this.dasword(request, response);
                }
                break;
            case "/empresa/registrar":
                this.registrationForm(request, response);
                break;
            case "/empresa":
                this.home(request, response);
                break;
        }

        try {
            response.sendRedirect("/empresa");
        } catch (IOException ex) {
            Logger.getLogger(CompanyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @SuppressWarnings("empty-statement")
    protected void createAccount(HttpServletRequest request, HttpServletResponse response) {
        try {
            ModelCompany modelCompany = new ModelCompany();
            ModelUser userModel = new ModelUser();
            DateTime date = new DateTime();

            String name = request.getParameter("nombre");
            String lastName = request.getParameter("apellido");
            String mail = request.getParameter("email");
            String password = request.getParameter("password");

            String businessName = request.getParameter("razon_social");
            String tradename = request.getParameter("nombre_comercial");
            String ruc = request.getParameter("ruc");
            String mobile = request.getParameter("celular");
            String address = request.getParameter("direccion");

            Company company = new Company();
            User user = new User();
            user.setName(name);
            user.setLastName(lastName);
            user.setMail(mail);
            user.setRole("admin-empresa");
            user.creationDate();
            user.setPassword(password);

            company.setBusinessName(businessName);
            company.setTradename(tradename);
            company.setRuc(ruc);
            company.setMobile(mobile);
            company.setAddress(address);
            company.creationDate();
            company.setUser(user);

            modelCompany.register(company);

            HttpSession sessionCompany;
            sessionCompany = request.getSession(true);
            sessionCompany.setAttribute("company_session", company);

            response.sendRedirect("/empresa/dasword");
        } catch (IOException ex) {
            Logger.getLogger(CompanyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void dasword(HttpServletRequest request, HttpServletResponse response) {

        try {

            dispatcher = request.getRequestDispatcher("/view/company-dasword.jsp");
            dispatcher.forward(request, response);

        } catch (ServletException | IOException ex) {
            Logger.getLogger(CompanyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void registrationForm(HttpServletRequest request, HttpServletResponse response) {

        dispatcher = request.getRequestDispatcher(
                "/view/register-company.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(CompanyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void home(HttpServletRequest request, HttpServletResponse response) {

        dispatcher = request.getRequestDispatcher("/view/company.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(CompanyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processUrl(String path, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext ctx = getServletContext();
        if (ctx.getRequestDispatcher(path) != null) {
            ctx.getRequestDispatcher(path).forward(request, response);
        }
    }

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
