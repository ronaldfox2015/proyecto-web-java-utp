/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author ronald
 */
public class DateTime {

    Date date = new Date();

    /**
     * 
     */
    public DateTime() {
    }

    /**
     * 
     * @param StringDate 
     */
    public DateTime(String StringDate) {
        Date date = new Date(StringDate);
    }

    /**
     * 
     * @param time
     * @return 
     */
    public String format(String time) {
        DateFormat hourFormat = new SimpleDateFormat(time);
        return hourFormat.format(date);
    }
}
