package model;

public class ListModel {
    private int id;
    private String name;
    private String username;
    private String email;
    private String birthday;
    private String password;
    private String contact;
    private String role;

    // Constructors
    public ListModel() {}

    public ListModel(int id, String name, String username, String email, String birthday,
                     String password, String contact, String role) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.birthday = birthday;
        this.password = password;
        this.contact = contact;
        this.role = role;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
