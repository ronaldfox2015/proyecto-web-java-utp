/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Garage;

/**
 *
 * @author ronald
 */
public class CreateGarege {

    private final AdapterOrm mysql;

    public CreateGarege() {
        this.mysql = new AdapterOrm();
    }

    public void register(Garage garage) {
        String sql = "INSERT INTO `tbcochera` ("
                + "`id`,"
                + "`idEmpresa`,"
                + "`idUbicacion`,"
                + "`nombre`,"
                + "`fechaCreacion`,"
                + "`fechaActualizacion`,"
                + "`direccion`,"
                + "`numVehiculos`,"
                + "`estado` "
                + ") VALUES  ("
                + "NULL,"
                + garage.getCompany().getId() + ","
                + garage.getLocation().getId() + ","
                + "'" + garage.getName() + "',"
                + "'" + garage.getCreationDate() + "' ,"
                + "'" + garage.getUpdateDate() + "',"
                + "'" + garage.getAddress() + "',"
                + "" + garage.getNumberOfVehicles() + ", "
                + "" + garage.getStatus() + ""
                + ");";
        mysql.insert(sql);
        garage.setId(mysql.getId());
    }
}
