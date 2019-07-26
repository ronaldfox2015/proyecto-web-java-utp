/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import entity.Garage;
import entity.Location;
import entity.ParkingGarage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author BIB-USR-AQP265
 */
public class ListSearchGarage {

    AdapterOrm mysql;

    public ListSearchGarage() {
        mysql = new AdapterOrm();
    }

    public ArrayList<Garage> get() throws SQLException {
        ArrayList<Garage> Garagelist = new ArrayList<Garage>();
        String sql = "SELECT "
                + " tbc.id as idCochera,"
                + " tbc.nombre as titulo,"
                + " tbc.fechaActualizacion as fh_pub,"
                + " tbc.direccion as dir,"
                + " tbu.id as idDistrito,"
                + " tbu.name as distrio,"
                + " tbct.precio as precio,"
                + "(tbu.name) as distrito"
                + " from tbcochera tbc join "
                + "tbubicacion tbu on tbc.idUbicacion=tbu.id"
                + " join tb_cochera_tarifa tbct on tbc.id = tbct.idCochera";
        ResultSet rs = this.mysql.list(sql);
        /* Guardamos el resultado */
        
        while (rs.next()) {        
            
            Garage garage = new Garage();

            Location location = new Location();
            location.setId(rs.getInt("idDistrito"));
            location.setName(rs.getString("distrio"));

            garage.setId(rs.getInt("idCochera"));
            garage.setAddress(rs.getString("dir"));
            garage.setLocation(location);
            garage.setName(rs.getString("titulo"));
            garage.setUpdateDate(rs.getString("fh_pub"));

            ParkingGarage parkingGarage = new ParkingGarage();
            parkingGarage.setPrice(rs.getDouble("precio"));
            garage.setParkingGarage(parkingGarage);
            
            Garagelist.add(garage);
        }
        //this.mysql.close();
        return Garagelist;
    }

}
