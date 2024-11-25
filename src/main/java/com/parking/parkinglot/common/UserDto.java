package com.parking.parkinglot.common;

public class UserDto {
    Long ID;
    String Username;
    String Email;

    public UserDto(Long ID, String username, String email) {
        this.ID = ID;
        Username = username;
        Email = email;
    }

    public Long getID() {
        return ID;
    }

    public String getUsername() {
        return Username;
    }

    public String getEmail() {
        return Email;
    }
}
