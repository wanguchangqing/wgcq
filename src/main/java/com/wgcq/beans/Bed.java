package com.wgcq.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bed {
    private int id;
    private String location;
    private int state;
    private int userId;


    public Bed(String location, int state) {
        this.location = location;
        this.state = state;
        this.userId = -1;
    }

    public void setIdAndUserId(int id,int userId) {
        this.id = id;
        this.userId = userId;
    }
}
