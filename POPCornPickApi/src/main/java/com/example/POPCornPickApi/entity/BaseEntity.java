package com.example.POPCornPickApi.entity;

import java.util.Date;

import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@MappedSuperclass
@Data
public abstract class BaseEntity {

    private Date regdate = new Date(); // 기본 값으로 초기화
    private Date moddate;

    @PrePersist
    protected void onCreate() {
        regdate = new Date(); // 생성 시간 설정
    }

    @PreUpdate
    protected void onUpdate() {
        moddate = new Date(); // 수정 시간 설정
    }
}
