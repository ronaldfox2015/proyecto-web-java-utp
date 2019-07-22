/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;

/**
 *
 * @author ronald
 */
public class ModelCreateCompany {

    public void save(Company company) {
        AdapterOrm mysql;
        mysql = new AdapterOrm();
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
                + company.getUser().getId() + ","
                + "'" + company.getBusinessName() + "'" + ","
                + "'" + company.getCreationDate() + "'" + ","
                + "'" + company.getUpdateDate() + "'" + ","
                + "'" + company.getRuc() + "'" + ","
                + "'" + company.getMobile() + "'" + ","
                + "'" + company.getTradename() + "'" + ","
                + "'" + company.getAddress() + "'" + ","
                + "'" + company.getLogo() + "'" + ","
                + "'" + company.getStatus() + "'"
                + "); ";
        mysql.insert(sql);
        company.setId(mysql.getId());
    }
}
