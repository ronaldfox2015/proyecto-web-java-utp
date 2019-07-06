/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library;

import java.util.ArrayList;

/**
 *
 * @author ronald
 */
public class DtoResponse {

    private boolean status;
    private String messages;
    private ArrayList<Object> data;

    /**
     *
     * @param status
     * @param messages
     * @param data
     */
    
    public DtoResponse( ) {
    }

    public DtoResponse(boolean status, String messages, ArrayList<Object> data) {
        this.status = status;
        this.messages = messages;
        this.data = data;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMessages() {
        return messages;
    }

    public void setMessages(String messages) {
        this.messages = messages;
    }

    public ArrayList<Object> getData() {
        return data;
    }

    public void setData(ArrayList<Object> data) {
        this.data = data;
    }

}
