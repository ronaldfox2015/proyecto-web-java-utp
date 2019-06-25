/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import library.DateTime;

/**
 *
 *
 * `id`, `idUsuario`, `razonSocial`, `fechaCreacion`, `fechaActualizacion`,
 * `ruc`, `celular`, `nombreComercial`, `direccion`, `logo`, `estado`
 *
 * @author ronald
 */
public class Company {

    static final int STATUS_ACTIVATE = 1;
    static final int STATUS_INACTIVATE = 0;

    private int id;
    private User user;
    private String businessName;
    private String creationDate;
    private String updateDate;
    private String ruc;
    private String mobile;
    private String tradename;
    private String address;
    private String logo;
    private int status;

    public Company() {
        DateTime date = new DateTime();
        this.updateDate = date.format("yyyy-MM-dd");
        this.status = User.STATUS_ACTIVATE;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getTradename() {
        return tradename;
    }

    public void setTradename(String tradename) {
        this.tradename = tradename;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
