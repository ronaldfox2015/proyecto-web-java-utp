/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import static java.nio.file.Files.list;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.Iterator;
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
        this.mysqlOrm = new MysqlORM("localhost:3306", "root", "", "dbhparking");
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

    public ResultSet list(String sql) throws SQLException {
        ResultSet response = null;
        if (this.mysqlOrm.conectar()) {
            response = this.mysqlOrm.list(sql);

        }
        return response;
    }

    public MysqlORM mysqlOrm() {
        return this.mysqlOrm;
    }

    public void close() {
        this.mysqlOrm.desconectar();
    }
}
