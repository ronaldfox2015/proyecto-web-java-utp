/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Garage;
import entity.ParkingGarage;

/**
 *
 * @author ronald
 */
public class ParkingAnnouncement {

    private final CreateGarege createGarege;
    private final CreateParkingGarage createParkingGarage;

    public ParkingAnnouncement() {
        this.createGarege = new CreateGarege();
        this.createParkingGarage = new CreateParkingGarage();
    }

    public void create(Garage garage, ParkingGarage parkingGarage) {

        this.createGarege.register(garage);
        if (garage.getId() > 0) {
            parkingGarage.setGarage(garage);
            this.createParkingGarage.register(parkingGarage);
        }       
    }

}
