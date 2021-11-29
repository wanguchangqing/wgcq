package com.wgcq.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class File {
    private int id;
    private String name;
    private int age;
    private int sex;
    private String info;
    private int bedId;
    private int userId;

    public File(String name, int age, int sex, String info, int bedId, int userId) {
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.info = info;
        this.bedId = bedId;
        this.userId = userId;
    }
}
