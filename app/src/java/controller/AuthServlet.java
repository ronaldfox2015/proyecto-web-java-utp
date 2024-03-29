/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Auth;
import com.google.gson.JsonObject;
import entity.Cliente;
import entity.Company;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import library.DtoResponse;
import library.Json;

/**
 *
 * @author ronald
 */
@WebServlet(name = "AuthServlet", urlPatterns = {"/auth/login", "/auth/logout"})
public class AuthServlet extends HttpServlet {

    Auth auth;
    Json json;
    private Object responseAuth;

    public AuthServlet() {
        auth = new Auth();
        json = new Json();
    }

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
            case "/auth/login":
                this.login(request, response);
                break;
            case "/auth/logout":
                this.logout(request, response);
                break;

        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;

        DtoResponse dtoSession = new DtoResponse();
        ArrayList<Object> list = new ArrayList();
        try {
            response.setContentType("application/json");
            User user = new User();
            Company company = new Company();
            Cliente cliente = new Cliente();
            JsonObject object = new JsonObject();
            out = response.getWriter();

            String mail = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("rol");
            user.setMail(mail);
            user.setPassword(password);
            user.setRole(role);
            boolean isLogin;
            isLogin = auth.isLogin(user);
            dtoSession.setMessages(auth.getMessages());
            if (isLogin) {

                if (auth.getCompany() != null) {
                    Company responseAuth = auth.getCompany();
                    HttpSession sessionCompany;
                    sessionCompany = request.getSession(true);
                    sessionCompany.setAttribute("company_session", responseAuth);
                }

                if (auth.getCliente() != null) {
                    Cliente responseAuth = auth.getCliente();
                    HttpSession sessionCompany;
                    sessionCompany = request.getSession(true);
                    sessionCompany.setAttribute("cliente_session", responseAuth);
                }

                dtoSession.setMessages("Se ingreso correctamente");
                dtoSession.setStatus(true);
                dtoSession.setData(list);
            }

        } catch (IOException ex) {
            dtoSession.setMessages(ex.getMessage());
            Logger.getLogger(AuthServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        String responseJson = this.json.convert(dtoSession);
        out.println(responseJson);
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = null;
        try {
            //  response.setContentType("application/json");
            HttpSession sessionCompany;
            sessionCompany = request.getSession(true);
            sessionCompany = (HttpSession) request.getSession();
            Company company = (Company) sessionCompany.getAttribute("company_session");
            if (company != null) {
                sessionCompany.invalidate();
                /*  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/empresa");

                 dispatcher.forward(request, response);*/
                RequestDispatcher disp = request.getRequestDispatcher("/view/home.jsp");

            }
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home");

            dispatcher.forward(request, response);;

        } catch (ServletException ex) {
            Logger.getLogger(AuthServlet.class.getName()).log(Level.SEVERE, null, ex);
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
