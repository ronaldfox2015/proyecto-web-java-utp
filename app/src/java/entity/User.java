/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import library.DateTime;

/**
 *
 * `id` `correo` `password` `rol` `nombre` `apellido` `fechaCreacion`
 * `fechaActualizacion` `estado`
 *
 * @author ronald
 */
public class User {

    static final int STATUS_ACTIVATE = 1;
    static final int STATUS_INACTIVATE = 0;

    private int id;
    private String mail;
    private String password;
    private String role;
    private String name;
    private String lastName;
    private String creationDate;
    private String updateDate;
    private int status;

    public User() {
        DateTime date = new DateTime();
        this.updateDate = date.format("yyyy-MM-dd HH:mm:ss");

        this.status = User.STATUS_ACTIVATE;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void creationDate() {
        DateTime date = new DateTime();
        this.creationDate = date.format("yyyy-MM-dd HH:mm:ss");
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {

        this.updateDate = updateDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
