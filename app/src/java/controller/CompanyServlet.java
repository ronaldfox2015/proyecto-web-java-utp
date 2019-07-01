/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Company;
import entity.User;
import java.io.IOException;
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
import model.Session;

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

    RequestDispatcher dispatcher;
    Session session;

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

        switch (url) {
            case "/empresa/create-acount":
                this.createAccount(request, response);
                break;
            case "/empresa/dasword":
                this.dasword(request, response);
                break;
            case "/empresa/registrar":
                this.registrationForm(request, response);
                break;
            case "/empresa":
                this.home(request, response);
                break;
        }

        dispatcher = request.getRequestDispatcher(
                "/view/index.jsp");

    }

    @SuppressWarnings("empty-statement")
    protected void createAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        user.setRole("empresa-user");
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
        sessionCompany.setAttribute("company", company);
        
        response.sendRedirect("/empresa/dasword");;

    }

    protected void dasword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessionCompany;
        sessionCompany = (HttpSession) request.getSession();
        Company company = (Company) sessionCompany.getAttribute("company");
        request.setAttribute("company", company);
        dispatcher = request.getRequestDispatcher(
                "/view/company-dasword.jsp");
        dispatcher.forward(request, response);
    }

    protected void registrationForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        dispatcher = request.getRequestDispatcher(
                "/view/register-company.jsp");
        dispatcher.forward(request, response);
    }

    protected void home(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        dispatcher = request.getRequestDispatcher("/view/company.jsp");
        dispatcher.forward(request, response);
    }

    protected void processUrl(String path, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext ctx = getServletContext();
        if (ctx.getRequestDispatcher(path) != null) {
            ctx.getRequestDispatcher(path).forward(request, response);
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
