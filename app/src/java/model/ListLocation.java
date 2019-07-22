/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import entity.Location;
import entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ronald
 */
public class ListLocation {

    AdapterOrm mysql;

    public ListLocation() {
        this.mysql = new AdapterOrm();

    }

    public ArrayList<Location> get() throws SQLException {
        ArrayList<Location> Locationlist = new ArrayList<Location>();
        String sql = "SELECT `id`,`name`, `padre`,`coordenada`,`estado` FROM `tbubicacion` ";
        ResultSet rs = this.mysql.list(sql);
        /* Guardamos el resultado */

        while (rs.next()) {
            Location location = new Location();
            location.setId(rs.getInt("id"));
            location.setName(rs.getString("name"));
            location.setPadre(rs.getInt("padre"));
            location.setCoordinate(rs.getString("coordenada"));
            location.setState(rs.getInt("estado"));
            Locationlist.add(location);

        }
        return Locationlist;

    }

    public Location getById(int id) throws SQLException {
        Location location = new Location();
        String sql = "SELECT "
                + "`id`,`name`,"
                + " `padre`,"
                + "`coordenada`,"
                + "`estado` FROM"
                + " `tbubicacion` WHERE "
                + "id =" + id + ";";
        ResultSet rs;

        rs = this.mysql.list(sql);
        /* Guardamos el resultado */

        while (rs.next()) {
            location.setId(rs.getInt("id"));
            location.setName(rs.getString("name"));
            location.setPadre(rs.getInt("padre"));
            location.setCoordinate(rs.getString("coordenada"));
            location.setState(rs.getInt("estado"));
        }

        return location;
    }

}
