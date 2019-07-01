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

    AdapterOrm mysql;

    public ModelUser() {
        mysql = new AdapterOrm();
    }

    public void create(User user) {
        int id;
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
                + "'" + user.getMail() + "'" + ","
                + "'" + user.getPassword() + "'" + ","
                + "'" + user.getRole() + "'" + ","
                + "'" + user.getName() + "'" + ","
                + "'" + user.getLastName() + "'" + ","
                + "'" + user.getCreationDate() + "'" + ","
                + "'" + user.getUpdateDate() + "'" + ","
                + "'" + user.getStatus() + "'"
                + "); ";
        this.mysql.insert(sql);
        id = this.mysql.getId();
        user.setId(id);
    }


}
