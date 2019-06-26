/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ronald
 */
public class ModelCompany {

    private final ModelUser modelUser;
    private final ModelCreateCompany modelCreateCompany;

    public ModelCompany() {
        this.modelUser = new ModelUser();
        this.modelCreateCompany = new ModelCreateCompany();
    }

    public void register(Company company) {
        try {
            this.modelUser.create(company.getUser());
            this.modelCreateCompany.save(company);
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(ModelCreateCompany.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
