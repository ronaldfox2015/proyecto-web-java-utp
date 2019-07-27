/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.mysql.jdbc.JDBC4ResultSet;
import entity.Cliente;
import entity.Company;
import entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ronald
 */
public class Auth {

    private String messages;
    ListCompany listCompany;
    ListClient listClient;
    Company company;
    Cliente cliente;

    public Auth() {
        listCompany = new ListCompany();
        listClient = new ListClient();
        company = new Company();
        cliente = new Cliente();
    }

    public boolean isLogin(User user) {
        boolean isLogin = false;

        try {
            if (user.getRole().equals("admin-empresa")) {
                company = listCompany.getUserCompany(user);
                if (company.getId() > 0) {
                    isLogin = true;
                    return isLogin;
                }
                throw new SQLException("No se encontro al usuario de tipo " + user.getRole());
            }

            if (user.getRole().equals("cliente-user")) {
                cliente = listClient.getUserClient(user);
                if (cliente.getId() > 0) {
                    isLogin = true;
                    return isLogin;
                }
                throw new SQLException("No se encontro al usuario de tipo " + user.getRole());
            }
        } catch (SQLException ex) {
            this.messages = ex.getMessage();
            Logger.getLogger(Auth.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isLogin;
    }

    public Company getCompany() {
        return this.company;
    }

    public Cliente getCliente() {
        return this.cliente;
    }

    public String getMessages() {
        return this.messages;
    }

}
