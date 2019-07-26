/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library;

import com.google.gson.JsonObject;
import com.google.gson.Gson;

/**
 *
 * @author ronald
 */
public class Json {

    private final Gson gson;

    public Json() {
        gson = new Gson();
    }

    public String convert(DtoResponse response) {

        JsonObject jarray = gson.toJsonTree(response).getAsJsonObject();
        JsonObject jsonObject = new JsonObject();
        jsonObject.add("response", jarray);

        return jsonObject.toString();
    }
}
