/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Cliente;
import entity.User;
import entity.Vehiculo;

/**
 *
 * @author Lucia
 */
public class ModelCreateVehiculo {
    
    AdapterOrm mysql;

    public ModelCreateVehiculo() {
        mysql = new AdapterOrm();
    }
    
    public void save(Vehiculo vehiculo) {
        int id;
        String sql = "INSERT INTO `tbvehiculo`("
                + "`id`,"
                + "`idCliente`,"
                + "`placa`,"
                + "`modelo`,"
                + "`descripcion`,"
                + "`fechaCreacion`,"
                + "`fechaActualizacion`) VALUES ("
                + " NULL,"
               + vehiculo.getCliente().getId()+ ","
                + "'"+vehiculo.getPlaca()+"',"
                + "'"+vehiculo.getModelo()+"',"
                + "'"+vehiculo.getDescripcion()+"',"
                + "'"+vehiculo.getFechaCreacion()+"',"
                + "'"+vehiculo.getFechaActualizacion()+"'"
                + "); ";
              
             
        this.mysql.insert(sql);
        id=this.mysql.getId();
        vehiculo.setId(id);
    }
}
