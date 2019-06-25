/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import java.sql.SQLException;

/**
 *
 * @author ronald
 */
public class ModelCompany {

    private ModelUser modelUser;
    private ModelCreateCompany modelCreateCompany;

    public ModelCompany() {
        this.modelUser = new ModelUser();
        this.modelCreateCompany = new ModelCreateCompany();
    }

    public void register(Company company) {
        this.modelUser.create(company.getUser());
        this.modelCreateCompany.save(company);

    }

}
