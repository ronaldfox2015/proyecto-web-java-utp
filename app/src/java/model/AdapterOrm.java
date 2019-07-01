/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import library.MysqlORM;

/**
 *
 * @author ronald
 */
public class AdapterOrm {

    private final MysqlORM mysqlOrm;
    private int id;

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
        int result;
        if (this.mysqlOrm.conectar()) {
            if (this.mysqlOrm.query(sql) == true) {
                this.id = mysqlOrm.getId();
                this.mysqlOrm.desconectar();
            }
        }
    }

    public int getId() {
        return this.id;
    }

    public ArrayList<Object> list(String sql) {
        ArrayList<Object> list = new ArrayList<>();
        if (this.mysqlOrm.conectar()) {
            list = this.mysqlOrm.list(sql);
        }
        return list;
    }
}
