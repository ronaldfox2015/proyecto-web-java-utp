/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import library.DateTime;

/**
 *
 * @author ronald
 */
public class Reserva {

    private int id;
    private Vehiculo vehiculo;
    private int idCochera;
    private String fechaCreacion;
    private String fechaActualizacion;
    private int estado;

    public Reserva() {
         DateTime date = new DateTime();
        this.fechaCreacion = date.format("yyyy-MM-dd HH:mm:ss");
        this.fechaActualizacion = date.format("yyyy-MM-dd HH:mm:ss");

        this.estado = 1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
 

    public int getIdCochera() {
        return idCochera;
    }

    public void setIdCochera(int idCochera) {
        this.idCochera = idCochera;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(String fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }

}
