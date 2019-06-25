/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ronald
 */
public class ModelCreateCompany {

    AdapterOrm orm;
    ModelUser modelUser;
    public ModelCreateCompany() {
        this.orm = new AdapterOrm();
    }
    
    public void save(Company company){
        try {
            String sql = "INSERT INTO `tbempresa`("
                    + "`id`,"
                    + "`idUsuario`,"
                    + "`razonSocial`,"
                    + "`fechaCreacion`,"
                    + "`fechaActualizacion`,"
                    + "`ruc`,"
                    + "`celular`,"
                    + "`nombreComercial`,"
                    + "`direccion`,"
                    + "`logo`,"
                    + "`estado`) VALUES ("
                    + " NULL,"
                    + company.getUser().getId()+","
                    + "'"+ company.getBusinessName() +"'" +","
                    + "'"+ company.getCreationDate()+"'" +","
                    + "'"+ company.getUpdateDate()+"'" +","
                    + "'"+ company.getRuc()+"'" +","
                    + "'"+ company.getMobile()+"'" +","
                    + "'"+ company.getTradename()+"'" +","
                    + "'"+ company.getAddress()+"'" +","
                    + "'"+ company.getLogo()+"'" +","
                    + "'"+ company.getStatus()+"'"
                    + "); ";
            this.orm.insert(sql);           
            company.setId(this.orm.getId());
        } catch (SQLException ex) {
            Logger.getLogger(ModelCreateCompany.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
