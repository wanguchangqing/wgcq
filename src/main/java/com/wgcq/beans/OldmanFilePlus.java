package com.wgcq.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OldmanFilePlus extends File {
    Bed bed;
    User user;

    public OldmanFilePlus(int id, String name, int age, int sex, String info, int userId, Bed bed, User user) {
        super(id, name, age, sex, info, userId);
        this.bed = bed;
        this.user = user;
    }


}
