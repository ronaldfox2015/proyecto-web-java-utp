/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.mysql.jdbc.JDBC4ResultSet;
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

    ListCompany listCompany;
    Company company;

    public Auth() {
        listCompany = new ListCompany();
        company = new Company();
    }

    public boolean isLogin(User user) throws SQLException {
        boolean isLogin = false;
        if (user.getRole().equals("admin-empresa")) {
            company = listCompany.getUserCompany(user);
            if (company.getId()> 0) {
                isLogin = true;
            }
        }
        return isLogin;
    }

    public Company getCompany() {
        return this.company;
    }
}
