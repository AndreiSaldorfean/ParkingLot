package com.parking.parkinglot.common;

public class UserDto {
    Long id;
    String Username;
    String Email;
    String Password;

    public UserDto(Long id, String username, String email) {
        this.id = id;
        Username = username;
        Email = email;
    }

    public UserDto(Long id, String username, String email,String password) {
        this.id = id;
        Username = username;
        Email = email;
        Password = password;
    }
    public Long getId() {
        return id;
    }

    public String getUsername() {
        return Username;
    }

    public String getEmail() {
        return Email;
    }
    public String getPassword() {
        return Password;
    }
}
