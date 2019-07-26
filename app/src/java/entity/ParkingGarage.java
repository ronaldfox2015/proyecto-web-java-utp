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
public class ParkingGarage {

    static final int STATUS_ACTIVATE = 1;
    static final int STATUS_INACTIVATE = 0;

    private int id;
    private Garage garage;
    private String name;
    private double price;
    private double discount;
    private int status;

    public ParkingGarage() {
        this.status = User.STATUS_ACTIVATE;
        this.name = "Alquieler de cochera";

    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Garage getGarage() {
        return garage;
    }

    public void setGarage(Garage garage) {
        this.garage = garage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
