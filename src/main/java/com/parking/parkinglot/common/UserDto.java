package com.parking.parkinglot.common;

public class UserDto {
    Long id;
    String Username;
    String Email;

    public UserDto(Long id, String username, String email) {
        this.id = id;
        Username = username;
        Email = email;
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
}
