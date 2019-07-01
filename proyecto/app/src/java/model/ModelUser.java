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
        AdapterOrm orm;
        orm = new AdapterOrm();
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
                + "'" + user.getMail() + "'"  + ","
                + "'" + user.getMail() + "'" + ","
                + "'" + user.getRole() + "'" + ","
                + "'" + user.getName() + "'" + ","
                + "'" + user.getLastName() + "'" + ","
                + "'" + user.getCreationDate() + "'" + ","
                + "'" + user.getUpdateDate() + "'" + ","
                + "'" + user.getStatus() + "'"
                + "); ";
       orm.insert(sql);
       user.setId(orm.getId());
       orm.insert(sql);
    }
}
