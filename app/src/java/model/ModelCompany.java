/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;

/**
 *
 * @author ronald
 */
public class ModelCompany {


    public ModelCompany() {
       
    }

    public void register(Company company) {
        ModelUser modelUser;
        modelUser = new ModelUser();
        
        ModelCreateCompany modelCreateCompany;
        modelCreateCompany = new ModelCreateCompany();
        
        modelUser.create(company.getUser());       
        modelCreateCompany.save(company);

    }

}
