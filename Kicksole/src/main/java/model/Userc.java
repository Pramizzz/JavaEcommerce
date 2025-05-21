package model;

public class Userc {
    private int id;
    private String name;
    private String username;
    private String email;
    private String password;
    private String birthday;
    private String phone;
    private String role;
    
    // Default constructor
    public Userc() {
    }
    
    // Constructor with all fields
    public Userc(int id, String name, String username, String email, String password, String birthday, String phone, String role) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.birthday = birthday;
        this.phone = phone;
        this.role = role;
    }
    
    // Constructor without ID (for creating new users)
    public Userc(String name, String username, String email, String password, String birthday, String phone, String role) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.birthday = birthday;
        this.phone = phone;
        this.role = role;
    }
    
    // Getters and setters
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
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getBirthday() {
        return birthday;
    }
    
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    
    // Helper methods
    public String getFirstName() {
        if (name != null && !name.isEmpty()) {
            int spaceIndex = name.indexOf(" ");
            if (spaceIndex > 0) {
                return name.substring(0, spaceIndex);
            }
            return name;
        }
        return null;
    }
    
    public String getLastName() {
        if (name != null && !name.isEmpty()) {
            int spaceIndex = name.indexOf(" ");
            if (spaceIndex > 0 && spaceIndex < name.length() - 1) {
                return name.substring(spaceIndex + 1);
            }
        }
        return null;
    }
    
    public String getFullName() {
        return name;
    }
    
    public void setFirstName(String firstName) {
        if (this.getLastName() != null) {
            this.name = firstName + " " + this.getLastName();
        } else {
            this.name = firstName;
        }
    }
    
    public void setLastName(String lastName) {
        if (this.getFirstName() != null) {
            this.name = this.getFirstName() + " " + lastName;
        } else {
            this.name = lastName;
        }
    }
    
    public void setFullName(String fullName) {
        this.name = fullName;
    }
}