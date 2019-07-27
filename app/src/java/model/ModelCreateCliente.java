/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Cliente;
import entity.User;

/**
 *
 * @author Lucia
 */
public class ModelCreateCliente {
    
    AdapterOrm mysql;

    public ModelCreateCliente() {
        mysql = new AdapterOrm();
    }
    
    public void save(Cliente cliente) {
        int id;
        String sql = "INSERT INTO `tbcliente`("
                + "`id`,"
                + "`idUsuario`,"
                + "`dni`,"
                + "`celular`,"
                + "`estado`) VALUES (NULL,"
                + cliente.getUser().getId()+ ","
                + "'" + cliente.getDni() + "',"
                + "'" + cliente.getCelular() + "',"
                + "" + cliente.getStatus() + ""
                + ");";
        this.mysql.insert(sql);
        id=this.mysql.getId();
        cliente.setId(id);
    }
}
