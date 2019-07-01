/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import library.MysqlORM;

/**
 *
 * @author ronald
 */
public class AdapterOrm {

    private final MysqlORM mysqlOrm;

    /**
     *
     */
    public AdapterOrm() {
        this.mysqlOrm = new MysqlORM("192.168.1.60:3306", "root", "1234", "dbhparking");
    }

   /**
    * 
    * @param sql 
    */
    public void insert(String sql) {

        if (this.mysqlOrm.conectar()) {
            if (this.mysqlOrm.consulta(sql)) {
                this.mysqlOrm.desconectar();
            }
        }
    }

    public int getId() {
        return this.mysqlOrm.getId();
    }
}
