package com.wgcq.beans;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkerFilePlus extends File {
    User user;

    public WorkerFilePlus(int id, String name, int age, int sex, String info, int userId, User user) {
        super(id, name, age, sex, info, userId);
        this.user = user;
    }
}
