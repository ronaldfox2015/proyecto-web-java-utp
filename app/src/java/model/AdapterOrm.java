/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.SQLException;
import library.MysqlORM;

/**
 *
 * @author ronald
 */
public class AdapterOrm {
    
   private MysqlORM mysqlOrm;
    /**
     * 
     */
    public AdapterOrm() {
       mysqlOrm = new MysqlORM("192.168.1.60:3306", "root", "1234", "dbhparking");
    }

    /**
     * 
     * @param sql
     * @throws SQLException 
     */
    public void insert(String sql) throws SQLException {
        if (this.mysqlOrm.conectar()) {
            if (this.mysqlOrm.consulta(sql)) {
                this.mysqlOrm.desconectar();
            }
            throw new SQLException("No se puedo realizar la consulta.");

        }
        throw new SQLException("No se puedo Realizar la conexión.");
    }
    
    public int getId()
    {
        return this.getId();
    }
}
