/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Cliente;
import entity.Garage;
import entity.Reserva;
import entity.User;
import entity.Vehiculo;

/**
 *
 * @author Lucia
 */
public class ModelCreateReserva {
    
    AdapterOrm mysql;

    public ModelCreateReserva() {
        mysql = new AdapterOrm();
    }
    
    public void save(Reserva reserva) {
        int id;
        String sql = "INSERT INTO "
                + "`tbreserva`("
                + "`id`,"
                + "`idVehiculo`,"
                + "`idCochera`,"
                + "`fechaCreacion`,"
                + "`fechaActualizacion`,"
                + "`estado`) VALUES ("
                + " NULL,"
                 + reserva.getVehiculo().getId()+ ","
               + ""+reserva.getIdCochera()+","
                + "NOW(),"
                + "NOW(),1); ";
             
        this.mysql.insert(sql);
        id=this.mysql.getId();
        reserva.setId(id);
    }
}
