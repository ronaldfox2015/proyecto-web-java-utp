/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.User;

/**
 *
 * @author ronald
 */
public class ModelUser {



    public void create(User user) {
        int id;
        AdapterOrm mysql;
        mysql = new AdapterOrm();
        String sql = "INSERT INTO `tbusuario`"
                + "("
                + "`id`,"
                + "`correo`,"
                + "`password`,"
                + "`rol`,"
                + "`nombre`,"
                + "`apellido`,"
                + "`fechaCreacion`,"
                + "`fechaActualizacion`,"
                + "`estado`"
                + ") "
                + "VALUES ( "
                + "NULL,"
                + "'" +  user.getMail() + "'"  + ","
                + "'" + user.getPassword()+ "'" + ","
                + "'" + user.getRole() + "'" + ","
                + "'" + user.getName() + "'" + ","
                + "'" + user.getLastName() + "'" + ","
                + "'" + user.getCreationDate() + "'" + ","
                + "'" + user.getUpdateDate() + "'" + ","
                + "'" + user.getStatus() + "'"
                + "); ";
       mysql.insert(sql);
       id = mysql.getId();
       user.setId(id);
    }
}
