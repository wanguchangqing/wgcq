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

    public Bed(String location, int state) {
        this.location = location;
        this.state = state;
    }
}
