package com.wgcq.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Access {
    private int id;
    private String detail;
    private Date time;
    private int userId;

    public Access(String detail, Date time, int userId) {
        this.detail = detail;
        this.time = time;
        this.userId = userId;
    }
}
