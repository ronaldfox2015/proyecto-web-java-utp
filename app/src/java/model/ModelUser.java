/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.User;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ronald
 */
public class ModelUser {

   private AdapterOrm orm;

    public ModelUser() {
        orm = new AdapterOrm();
    }

    public void create(User user) throws ClassNotFoundException, InstantiationException, IllegalAccessException {

        try {
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
                    + user.getMail() + ","
                    + "'" + user.getMail() + "'" + ","
                    + "'" + user.getRole() + "'" + ","
                    + "'" + user.getName() + "'" + ","
                    + "'" + user.getLastName() + "'" + ","
                    + "'" + user.getCreationDate() + "'" + ","
                    + "'" + user.getUpdateDate() + "'" + ","
                    + "'" + user.getStatus() + "'"
                    + "); ";
            
            this.orm.insert(sql);
            user.setId(this.orm.getId());
        } catch (SQLException ex) {
            Logger.getLogger(ModelUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
