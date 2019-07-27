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
public class ListGarage {

    AdapterOrm mysql;

    public ListGarage() {
        this.mysql = new AdapterOrm();
    }

    public ArrayList<Garage> getByIdEmpresa(int idEmpresa) throws SQLException {
        ArrayList<Garage> Garagelist = new ArrayList<Garage>();
        String sql = "select tbu.id as idlocation,tbu.name as name,tbu.estado,tbc.id,tbc.direccion,tbc.estado as estadochochera ,tbc.nombre   from tbempresa tbe inner join tbcochera tbc on tbe.id= tbc.idEmpresa inner join tbubicacion tbu on tbc.idUbicacion = tbu.id where tbe.id=" + idEmpresa;
        ResultSet rs = this.mysql.list(sql);
        /* Guardamos el resultado */

        while (rs.next()) {
            Garage garage = new Garage();
            Company c = new Company();
            c.setId(idEmpresa);

            Location location = new Location();
            location.setId(rs.getInt("idlocation"));
            location.setName(rs.getString("name"));
            location.setState(rs.getInt("estado"));

            garage.setId(rs.getInt("id"));
            garage.setAddress(rs.getString("direccion"));
            garage.setLocation(location);
            garage.setStatus(rs.getInt("estadochochera"));
            garage.setCompany(c);
            garage.setName(rs.getString("nombre"));

            Garagelist.add(garage);
        }
        return Garagelist;
    }
}
