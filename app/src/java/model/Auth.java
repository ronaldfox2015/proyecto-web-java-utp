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

   private final AdapterOrm mysql;

    public Auth() {
        mysql = new AdapterOrm();
    }
    
    public void login(User user)
    {
     
    }
    
    public Company company(User user) throws SQLException {
        String sql = "SELECT "
                + "e.`id`  , "
                + "e.`razonSocial`,"
                + "e.`fechaCreacion`, "
                + "e.`fechaActualizacion`,"
                + "e.`ruc`, "
                + "e.`celular`, "
                + "e.`nombreComercial`, "
                + "e.`direccion`, "
                + "e.`logo`, "
                + "e.`estado` AS estado_company, "
                + "u.id AS id_usuario,"
                + "u.`correo`,"
                + "u.`password`,"
                + "u.`rol`,"
                + "u.`nombre`,"
                + "u.`apellido`,"
                + "u.`fechaCreacion`,"
                + "u.`fechaActualizacion`, "
                + "u.`estado`  AS estado_user "
                + "FROM `tbempresa`  e INNER JOIN `tbusuario` u ON e.idUsuario=u.id "
                + "WHERE "
                + "u.`correo` = "
                + "'" + user.getMail() + "'  AND "
                + "u.`password`="
                + "'" + user.getPassword() + "' "
                + "AND u.`rol` ="
                + "'" + user.getRole() + "';";

        
        Company company = new Company();
        ResultSet rs = this.mysql.list(sql);
        /* Guardamos el resultado */
        while (rs.next()) {
            company.setId(rs.getInt("id"));
            company.setBusinessName(rs.getString("razonSocial"));
            company.setCreationDate(rs.getString("fechaCreacion"));
            company.setUpdateDate(rs.getString("fechaActualizacion"));

            company.setRuc(rs.getString("ruc"));
            company.setMobile(rs.getString("celular"));
            company.setTradename(rs.getString("nombreComercial"));
            company.setAddress(rs.getString("direccion"));
            company.setTradename(rs.getString("nombreComercial"));
            company.setLogo(rs.getString("logo"));
            company.setStatus(rs.getInt("estado_company"));
            company.setTradename(rs.getString("nombreComercial"));

            User userCompany = new User();
            userCompany.setId(rs.getInt("id_usuario"));
            userCompany.setName(rs.getString("nombre"));
            userCompany.setLastName(rs.getString("apellido"));
            userCompany.setMail(rs.getString("correo"));
            userCompany.setPassword(rs.getString("password"));

            userCompany.setRole(rs.getString("rol"));
            userCompany.creationDate();

            userCompany.setStatus(rs.getInt("estado_user"));
            company.setUser(userCompany);
        }
        return company;
    }

}
