/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Cliente;
import entity.Company;
import entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ronald
 */
public class ListClient {

    AdapterOrm mysql;

    public ListClient() {
        mysql = new AdapterOrm();
    }

    public Cliente getUserClient(User user) throws SQLException {
        String sql = "SELECT "
                + "c.`id`  , "
                + "c.`dni`,"
                + "c.`celular`, "
                + "c.`estado`,"
                + "u.id AS id_usuario,"
                + "u.`correo`,"
                + "u.`password`,"
                + "u.`rol`,"
                + "u.`nombre`,"
                + "u.`apellido`,"
                + "u.`fechaCreacion`,"
                + "u.`fechaActualizacion`, "
                + "u.`estado`  AS estado_user "
                + "FROM `tbcliente`  c INNER JOIN `tbusuario` u ON c.idUsuario=u.id "
                + "WHERE "
                + "u.`correo` = "
                + "'" + user.getMail() + "'  AND "
                + "u.`password`="
                + "'" + user.getPassword() + "' "
                + "AND u.`rol` ="
                + "'" + user.getRole() + "';";

        Cliente cliente = new Cliente();
        ResultSet rs = this.mysql.list(sql);
        /* Guardamos el resultado */
        while (rs.next()) {
            cliente.setId(rs.getInt("id"));
            cliente.setCelular(rs.getString("celular"));
            cliente.setDni(rs.getString("dni"));
            cliente.setStatus(rs.getInt("estado"));

            User userCompany = new User();
            userCompany.setId(rs.getInt("id_usuario"));
            userCompany.setName(rs.getString("nombre"));
            userCompany.setLastName(rs.getString("apellido"));
            userCompany.setMail(rs.getString("correo"));
            userCompany.setPassword(rs.getString("password"));
            userCompany.setRole(rs.getString("rol"));
            userCompany.creationDate();
            userCompany.setStatus(rs.getInt("estado_user"));
            cliente.setUser(user);
        }
        return cliente;
    }
}
