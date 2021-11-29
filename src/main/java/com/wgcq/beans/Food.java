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

    public Food(String name, int value) {
        this.name = name;
        this.value = value;
    }
}
