/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Account {
    private int accountId;
    private String username;
    private String password;
    private String role;
    private String informationStatus;

    // Constructors
    public Account() {
    }

    public Account(String username, String password, String role, String informationStatus) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.informationStatus = informationStatus;
    }

    // Getters and setters
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getInformationStatus() {
        return informationStatus;
    }

    public void setInformationStatus(String informationStatus) {
        this.informationStatus = informationStatus;
    }

    // toString method (optional for debugging)
    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", informationStatus='" + informationStatus + '\'' +
                '}';
    }
}
