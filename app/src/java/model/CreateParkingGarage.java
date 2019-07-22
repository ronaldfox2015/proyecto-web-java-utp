/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Garage;
import entity.ParkingGarage;

/**
 *
 * @author ronald
 */
public class CreateParkingGarage {

    private AdapterOrm mysql;

    public CreateParkingGarage() {
        this.mysql = new AdapterOrm();
    }

    public void register(ParkingGarage parkingGarage) {
        String sql = "INSERT INTO `tb_cochera_tarifa`  ("
                + "`id`,"
                + "`idCochera`,"
                + "`nombre`,"
                + "`precio`,"
                + "`descuento`,"
                + "`estado`) VALUES ("
                + "NULL,"
                + parkingGarage.getGarage().getId() + ","
                + "'" + parkingGarage.getName() + "',"
                + parkingGarage.getPrice() + ","
                + parkingGarage.getDiscount() + ","
                + parkingGarage.getStatus()
                + ");";
        mysql.insert(sql);
        parkingGarage.setId(mysql.getId());
    }
}
