package library;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase encargada de conectar a MySQL, permitiendo realizar consultas y
 * obteniendo sus resultados.
 *
 * @author Ronald
 */
public class MysqlORM {

    /**
     * Clase usada para realizar la conexion
     */
    private static final String CLASE = "com.mysql.jdbc.Driver";

    /**
     * Atributos de la conexion
     */
    private final String host;
    private final String usuario;
    private final String clave;
    private final String nombre;
    private final String url;

    /**
     * Recursos de conexion
     */
    private Connection link;
    private Statement statement;

    /**
     * Mensaje de error
     */
    private String mensajeError;

    /**
     * Obtener el id de un Registro
     */
    private int id;

    /**
     * Constructor
     *
     * Aqui almacenaremos los datos respectivos a la conexion con el DBMS:
     *
     * @param host Direccion del servidor DBMS
     * @param usuario Usuario del DBMS
     * @param clave Clave del usuario
     * @param nombre Nombre de la base de datos a la que se conectara
     *
     */
    public MysqlORM(String host, String usuario, String clave, String nombre) {

        /* Asignamos los atributos */
        this.host = host;
        this.usuario = usuario;
        this.clave = clave;
        this.nombre = nombre;

        /* Asignamos el mensaje de error */
        this.mensajeError = "";

        /* Creamos la URL */
        this.url = "jdbc:mysql://" + this.host + "/" + this.nombre;

    }

    /**
     * Este metodo inicia la conexion a la base de datos
     *
     * @return boolean Resultado de la operacion TRUE si se conecto
     * exitosamente, FALSE en caso contrario.
     */
        public boolean conectar(){

        try {

            Class.forName(CLASE);
            this.link = DriverManager.getConnection(this.url, this.usuario, this.clave);

        } catch (SQLException e) {
           
            return false;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MysqlORM.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return true;
    }

    /**
     * Se encarga de ejecutar una consulta, que no arrojara ningun resultado
     * (INSERT, UPDATE, DELETE).
     *
     * @param consulta Consulta a ejecutar
     * @return boolean Resultado de la operacion TRUE si se desconecto
     * exitosamente, FALSE en caso contrario.
     */
    public boolean consulta(String consulta) {

        int resultado;

        try {

            this.statement = this.link.createStatement();
            resultado = this.statement.executeUpdate(consulta);
            try (ResultSet generatedKeys = this.statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    this.id = generatedKeys.getInt(1);
                } else {
                    return false;
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(MysqlORM.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }

        return (resultado > 0);
    }

    public int getId() {
        return this.id;
    }

    /**
     * Se encarga de ejecutar una consulta, que arrojara un resultado (SELECT)
     *
     * @param consulta Consulta a ejecutar
     * @return ArrayList Lista con los resultados obtenidos de la consulta
     */
    public ArrayList<Object> obtener(String consulta) {

        /* Resultados */
        ArrayList<Object> listado = new ArrayList<>();
        ResultSet resultado;

        /* Realizamos la consulta */
        try {

            this.statement = this.link.createStatement();
            resultado = this.statement.executeQuery(consulta);

        } catch (SQLException e) {
            this.mensajeError = e.getMessage();
            return null;
        }

        /* Guardamos el resultado */
        try {

            while (resultado.next()) {
                listado.add(resultado);
            }

        } catch (SQLException e) {
            this.mensajeError = e.getMessage();
            return null;
        }

        return listado;
    }

    /**
     * Realiza la desconexion del DBMS
     *
     * @return boolean Resultado de la operacion TRUE si se desconecto
     * exitosamente, FALSE en caso contrario.
     */
    public boolean desconectar() {

        try {

            this.link.close();

        } catch (SQLException e) {
            this.mensajeError = e.getMessage();
            return false;
        }

        return true;
    }

    public String getMensajeError() {
        return mensajeError;
    }

}
