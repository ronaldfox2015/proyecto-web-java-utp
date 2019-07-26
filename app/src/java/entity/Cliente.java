package entity;

public class Cliente {
    
    static final int STATUS_ACTIVATE = 1;
    static final int STATUS_INACTIVATE = 0;
    
    private User user;
    private int id;
    private int idUsuario;
    private String dni;
    private String celular;
    private int status;

    public Cliente(){
        this.status = User.STATUS_ACTIVATE;
    }
    public Cliente cliente(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
