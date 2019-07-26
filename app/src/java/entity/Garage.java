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
public class Garage {

    static final int STATUS_ACTIVATE = 1;
    static final int STATUS_INACTIVATE = 0;
    private int id;
    private Company company;
    private ParkingGarage parkingGarage;

    private Location location;
    private String name;
    private String creationDate;
    private String updateDate;
    private String address;
    private int numberOfVehicles;
    private int status;

    public Garage() {
        DateTime date = new DateTime();
        this.updateDate = date.format("yyyy-MM-dd HH:mm:ss");
        this.status = User.STATUS_ACTIVATE;
    }

    public ParkingGarage getParkingGarage() {
        return parkingGarage;
    }

    public void setParkingGarage(ParkingGarage parkingGarage) {
        this.parkingGarage = parkingGarage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate() {
        DateTime date = new DateTime();
        this.creationDate = date.format("yyyy-MM-dd HH:mm:ss");
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getNumberOfVehicles() {
        return numberOfVehicles;
    }

    public void setNumberOfVehicles(int numberOfVehicles) {
        this.numberOfVehicles = numberOfVehicles;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
