/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import entity.Garage;
import entity.Location;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ronald
 */
public class ListDistrito {

    AdapterOrm mysql;

    public ListDistrito() {
        this.mysql = new AdapterOrm();
    }

    public ArrayList<Garage> get() throws SQLException {
        ArrayList<Garage> Garagelist = new ArrayList<Garage>();
        String sql = "select tbu.id,tbu.name, count(tbc.id) as 'Cant avisos'"
                + ", tbc.id as idCochera from tbcochera as tbc "
                + "inner join tbubicacion as tbu  "
                + "on tbc.idUbicacion=tbu.id "
                 + "join tb_cochera_tarifa tbct on tbc.id = tbct.idCochera "
                + "group by tbu.id ";

        ResultSet rs = this.mysql.list(sql);
        /* Guardamos el resultado */

        while (rs.next()) {
            Garage garage = new Garage();

            Location location = new Location();
            location.setId(rs.getInt("id"));
            location.setName(rs.getString("name"));

            garage.setId(rs.getInt("idCochera"));
            garage.setLocation(location);

            Garagelist.add(garage);
        }
       //this.mysql.close();

        return Garagelist;
    }
}
