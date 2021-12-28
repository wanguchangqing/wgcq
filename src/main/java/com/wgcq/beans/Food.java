package com.wgcq.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Food {
    private int id;
    private String name;
    private int value;
    private String info;

    public Food(String name, int value, String info) {
        this.name = name;
        this.value = value;
        this.info = info;
    }
}
