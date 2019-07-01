/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import entity.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ronald
 */
public class Session {

    AdapterOrm mysql;

    public Session() {
        mysql = new AdapterOrm();
    }

    public Company company(User user) {
        String sql = "SELECT "
                + "e.`id`  AS id_empresa, "
                + "e.`razonSocial`,"
                + "e.`fechaCreacion`, "
                + "e.`fechaActualizacion`,"
                + "e.`ruc`,   e.`celular`, "
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
                + "u.`estado`  AS estado_user"
                + "FROM `tbempresa`  e INNER JOIN `tbusuario` u ON e.idUsuario=u.id "
                + "WHERE "
                + "u.`correo` = "
                + "'"+ user.getMail() + "'  AND "
                + "u.`password`="
                + "'" + user.getPassword() + "' "
                + "AND u.`rol` ="
                + "'" +user.getRole()+ "';";
        Company company = new Company();
        this.mysql.list(sql);
        return  company;
    }

}
