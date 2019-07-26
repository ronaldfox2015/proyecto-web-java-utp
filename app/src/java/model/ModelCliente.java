/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Cliente;

/**
 *
 * @author Lucia
 */
public class ModelCliente {
 
     public void register(Cliente cliente) {
        ModelUser modelUser;
        modelUser = new ModelUser();
        
        ModelCreateCliente modelCreateCliente;
        modelCreateCliente = new ModelCreateCliente();
        
        modelUser.create(cliente.getUser());  
        
        modelCreateCliente.save(cliente);

    }
}
